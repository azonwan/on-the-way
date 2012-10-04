<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// パスワード再発行
class admin_do_update_c_admin_user_password extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!db_admin_authenticate_password(
                $GLOBALS['AUTH']->uid(),
                $requests['old_password'])) {
            admin_client_redirect('edit_admin_password',
                '密码是不同的');
        }

        $password = $requests['new_password'];
        if (!ctype_alnum($password) ||
            strlen($password) < 6 ||
            strlen($password) > 12) {
            admin_client_redirect('edit_admin_password',
                '密码请输入6~12个半脚英文字母、数字');
        }

        if ($requests['new_password'] !== $requests['new_password2']) {
            admin_client_redirect('edit_admin_password',
                '密码不一致');
        }

        //パスワード変更
        db_admin_update_c_admin_user_password($GLOBALS['AUTH']->uid(), $password);

        $GLOBALS['AUTH']->logout();
        $msg = '密码已经变更，请用新密码重新登录';
        admin_client_redirect('login', $msg);
    }
}

?>
