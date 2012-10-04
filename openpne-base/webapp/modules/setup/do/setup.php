<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class setup_do_setup extends OpenPNE_Action
{
    function handleError($errors)
    {
        openpne_forward('setup', 'page', 'setup', $errors);
        exit;
    }

    function execute($requests)
    {
        $errors = array();
        if (OPENPNE_AUTH_MODE == 'email' && $requests['password'] != $requests['password2']) {
            $errors[] = '密码不一致';
        }
        if ($requests['admin_password'] != $requests['admin_password2']) {
            $errors[] = '管理者密码不一致';
        }
        if (OPENPNE_AUTH_MODE == 'slavepne') {
            $auth_config = get_auth_config(false);
            $storage = Auth::_factory($auth_config['storage'],$auth_config['options']);
            if (!$storage->fetchData($requests['username'], $requests['password'], false)){
                $errors[] = '登录ID或密码不正确。';
            }
        }
        if (OPENPNE_AUTH_MODE == 'pneid') {
            if (is_null($requests['username']) || $requests['username'] === '') {
                $errors[] = '请输入您的登录ID';
            } elseif (!preg_match('/^[a-zA-Z0-9][a-zA-Z0-9\-_]+[a-zA-Z0-9]$/i', $requests['username'])) {
                $errors[] = '登录ID请输入4~30个英文字母、数字(下划线“_”、连字符“-”)';
            } elseif (mb_strwidth($requests['username'], 'UTF-8') < 4) {
                $errors[] = "登录ID请输入4个或4个以上的半角字符";
            } elseif (mb_strwidth($requests['username'], 'UTF-8') > 30) {
                $errors[] = "登录ID请输入30个以内的半角字符";
            }
        }
        if ($errors) {
            $this->handleError($errors);
        }

        // c_admin_config: SNS_NAME
        $data = array(
            'name' => 'SNS_NAME',
            'value' => $requests['SNS_NAME'],
        );
        db_insert('c_admin_config', $data);

        // c_member_secure
        $data = array(
            'c_member_id' => 1,
            'hashed_password' => md5($requests['password']),
            'hashed_password_query_answer' => '',
            'pc_address' => t_encrypt($requests['pc_address']),
            'ktai_address' => '',
            'regist_address' => t_encrypt($requests['pc_address']),
            'easy_access_id' => '',
        );

        if (OPENPNE_AUTH_MODE == 'slavepne' && !IS_SLAVEPNE_EMAIL_REGIST) {
            $data['ktai_address'] = t_encrypt('1@ktai.example.com');
        }

        db_insert('c_member_secure', $data);

        // c_admin_user
        $data = array(
            'username' => $requests['admin_username'],
            'password' => md5($requests['admin_password']),
            'auth_type' => 'all',
        );
        db_insert('c_admin_user', $data);

        if (OPENPNE_AUTH_MODE != 'email') {
            db_member_insert_username(1, $requests['username']);
        }

        openpne_redirect('setup', 'page_setup_done');
    }
}

?>
