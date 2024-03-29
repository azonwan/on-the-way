<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// プロフィール項目追加
class admin_do_insert_c_admin_user extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('insert_c_admin_user', array_shift($errors));
    }

    function execute($requests)
    {
        $errors = array();
        if (db_admin_exists_c_admin_username($requests['username'])) {
            $errors[] = '该用户名已经注册';
        }
        if ($requests['password'] != $requests['password2']) {
            $errors[] = '密码不一致';
        }
        if ($errors) {
            $this->handleError($errors);
        }

        db_admin_insert_c_admin_user(
            $requests['username'],
            $requests['password'],
            $requests['auth_type']
        );
        admin_client_redirect('list_c_admin_user', '用户已经添加');
    }
}

?>
