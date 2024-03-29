<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// パスワード再発行
class admin_do_passwd extends OpenPNE_Action
{
    function execute($requests)
    {
        $c_member_id = $requests['target_c_member_id'];
        $password = $requests['password'];

        if (!ctype_alnum($password) ||
            strlen($password) < 6 ||
            strlen($password) > 12) {
            admin_client_redirect('passwd',
                '密码请输入6～12个半脚英文字母、数字',
                'target_c_member_id='.$c_member_id);
        }

        if ($requests['password'] !== $requests['password2']) {
            admin_client_redirect('passwd',
                '密码不一致',
                'target_c_member_id='.$c_member_id);
        }

        //パスワード変更
        db_member_update_password($c_member_id, $password);

        //メール送信
        $c_member_secure = db_member_c_member_secure4c_member_id($c_member_id);
        if ($c_member_secure['pc_address']) {
            do_password_query_mail_send($c_member_id, $c_member_secure['pc_address'], $password);
        } else {
            db_mail_send_m_ktai_password_query($c_member_id, $password);
        }

        admin_client_redirect('top', '如果成员更改密码，将发送电子邮件');
    }
}

?>
