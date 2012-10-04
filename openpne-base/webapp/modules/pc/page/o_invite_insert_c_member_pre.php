<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 招待メール送信
 */
class pc_page_o_invite_insert_c_member_pre extends OpenPNE_Action
{
   function isSecure()
    {
        return false;
    }
    function execute($requests)
    {
        if (!IS_USER_INVITE) {
            openpne_forward('pc', 'page', 'h_err_invite');
            exit;
        }

        // --- リクエスト変数
        
        $mail = $requests['mail'];
        $c_member_id_invite = $requests['target_c_member_id'];
        // ----------
        if (is_ktai_mail_address($mail)) {
            $mail = str_replace('"', '', $mail);
        }

        if (!db_common_is_mailaddress($mail)) {
            $msg = "请输入邮件地址";
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_invite', $p);
        }

        if (db_member_is_sns_join4mail_address($mail)) {
            $msg = "此邮件地址已经登录";
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_invite', $p);
        }

        if (!db_member_is_limit_domain4mail_address($mail)) {
            $msg = "此邮件地址不能登录";
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_invite', $p);
        }

        $session = create_hash();

        if (is_ktai_mail_address($mail)) {
            //<PCKTAI
            if (!((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_KTAI) >> 1)) {
                $msg = "手机邮件地址不能接受邀请函";
                $p = array('msg' => $msg);
                openpne_redirect('pc', 'page_h_invite', $p);
            }
            //>

            if (OPENPNE_AUTH_MODE != 'slavepne') {
                // c_member_ktai_pre に追加
                if (db_member_c_member_ktai_pre4ktai_address($mail)) {
                    db_member_update_c_member_ktai_pre($session, $mail, $c_member_id_invite);
                } else {
                    db_member_insert_c_member_ktai_pre($session, $mail, $c_member_id_invite);
                }
            }


        } else {
            //<PCKTAI
            if (!(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
                $msg = 'PC邮件地址不能接受邀请函';
                $p = array('msg' => $msg);
                openpne_redirect('pc', 'page_h_invite', $p);
            }
            //>

            if (OPENPNE_AUTH_MODE != 'slavepne') {
                // c_member_pre に追加
                if (db_member_c_member_pre4pc_address($mail)) {
                    db_member_update_c_invite($c_member_id_invite, $mail, $message, $session);
                } else {
                    db_member_insert_c_invite($c_member_id_invite, $mail, $message, $session);
                }
            }

        }
        $p = array(
            'sid' => $session,
        );
        openpne_redirect('pc', 'page_o_regist_prof', $p);
    }
}

?>
