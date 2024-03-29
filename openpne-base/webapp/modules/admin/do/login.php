<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_login extends OpenPNE_Action
{
    var $_auth;

    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        $config['storage'] = 'DB';
        $config['options'] = array(
            'dsn'         => db_get_dsn(),
            'table'       => 'c_admin_user',
            'usernamecol' => 'username',
            'passwordcol' => 'password',
            'cryptType'   => 'md5',
        );
        $auth = new OpenPNE_Auth($config);
        $auth->setExpire($GLOBALS['OpenPNE']['admin']['session_lifetime']);
        $auth->setIdle($GLOBALS['OpenPNE']['admin']['session_idletime']);
        $this->_auth =& $auth;

        // 現在のセッションを削除
        $auth->logout();

        if (!$auth->login($requests['is_save'])) {
            $this->_fail_login();
        }

        admin_client_redirect('top');
    }

    function _fail_login()
    {
        $this->_auth->logout();
        admin_client_redirect('login', '登录失败');
    }
}

?>
