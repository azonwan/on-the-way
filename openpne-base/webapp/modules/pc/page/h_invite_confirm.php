<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_invite_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        if (!IS_USER_INVITE) {
            openpne_forward('pc', 'page', 'h_err_invite');
            exit;
        }

        // --- リクエスト変数
        $form_val = $requests;
        // ----------
        if (is_ktai_mail_address($form_val['mail'])) {
            $form_val['mail'] = str_replace('"', '', $form_val['mail']);
        }

        $msg = "";
        if (OPENPNE_USE_CAPTCHA && (empty($_SESSION['captcha_keystring']) || $_SESSION['captcha_keystring'] !=  $requests['captcha'])) {
            unset($_SESSION['captcha_keystring']);
            $msg = "验证码输入有误";
        } else {
            unset($_SESSION['captcha_keystring']);
            if (!db_common_is_mailaddress($form_val['mail'])) {
                $msg = "请正确输入邮件地址";
            } elseif (db_member_is_sns_join4mail_address($form_val['mail'])) {
                $msg = "此邮件地址已经登录";
            } elseif (!db_member_is_limit_domain4mail_address($form_val['mail'])) {
                $msg = "此邮件地址不能登录";
            } else {
                if (is_ktai_mail_address($form_val['mail'])) {
                    //<PCKTAI
                    if (!((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_KTAI) >> 1)) {
                    	$msg = "不能邀请使用手机邮件地址的用户";
                    }
                    //>
                } else {
                    //<PCKTAI
                    if (!(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
                    	$msg = "不能被邀请使用PC邮件地址的用户";
                    }
                    //>
                }
            }
        }

        if ($msg) {
            $_REQUEST['msg'] = $msg;
            openpne_forward('pc', 'page', "h_invite");
            exit;
        }

        $this->set('inc_navi', fetch_inc_navi("h"));

        $this->set('form_val', $form_val);
        $this->set('SNS_NAME', SNS_NAME);

        $random_string = do_common_create_password();
        $_SESSION['captcha_confirm'] = $random_string;
        $this->set('captcha_confirm', md5($random_string));

        return 'success';
    }
}

?>
