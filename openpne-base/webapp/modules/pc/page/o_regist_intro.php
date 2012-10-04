<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_regist_intro extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //<PCKTAI
        if (OPENPNE_AUTH_MODE == 'slavepne' || !(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
            client_redirect_login();
        }
        //>
        $sid = $requests['sid'];
        $target_c_member_id = $requests['target_c_member_id'];
        $c_member_session = db_member_get_session_id4c_member_id($target_c_member_id);
        if (!$c_member_session) {
            if (!db_member_is_active_sid($sid)) {
                $p = array('msg_code' => 'invalid_url');
                openpne_redirect('pc', 'page_o_tologin', $p);
            }
        // メールアドレスが登録できるかどうか
        $pre = db_member_c_member_pre4sid($sid);
        if (!util_is_regist_mail_address($pre['pc_address'])) {
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }
        }
        $this->set('inc_page_header', fetch_inc_page_header('public'));

        $this->set('sid', $sid);
        $this->set('c_member_id', $target_c_member_id);
        $this->set('c_member_session', $c_member_session);
        $this->set('c_siteadmin', p_common_c_siteadmin4target_pagename('sns_kiyaku'));

        return 'success';
    }
}

?>
