<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_tologin extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        $url = get_login_url();
        if ($requests['login_params']) {
            if (strrpos($url, '?') !== false) {
                $url .= '&';
            } else {
                $url .= '?';
            }
            $url .= 'login_params=' . urlencode($requests['login_params']);
        }
        // リダイレクト
        header('Refresh: 3; URL=' . $url);


        //---- inc_ テンプレート用 変数 ----//
        $this->set('inc_page_header', fetch_inc_page_header('public'));

        $msg = '';
        switch ($requests['msg_code']) {
        case 'login_failed':
            $msg = '登录失败，请重新登录。';
            break;
        case 'logout':
            $msg = '您已经成功退出系统，欢迎下次光临。';
            break;
        case 'password_query':
            $msg = '新密码已发至您的邮箱，请注意查收。';
            break;
        case 'change_mailaddress':
            $msg = '邮件地址已变更。';
            break;
        case 'change_password':
            $msg = '密码已经更改，请使用新密码重新登录。';
            break;
        case 'taikai':
            $msg = '退会手续完成，谢谢您的使用。';
            break;
        case 'invalid_url':
            $msg = '此链接已经失效。';
            break;
        case 'regist_mail':
            $msg = '邮件地址成功登录。';
            break;
        case 'login_rejected':
            $msg = '不能登录。';
            break;
        }
        $this->set('msg', $msg);

        $this->set('login_url', $url);
        return 'success';
    }
}

?>
