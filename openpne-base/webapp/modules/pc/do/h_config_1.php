<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メールアドレス変更
 */
class pc_do_h_config_1 extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $pc_address = $requests['pc_address'];
        $pc_address2 = $requests['pc_address2'];
        // ----------

        $msg_list = array();
        if (!$pc_address)  $msg_list[] = "请输入邮件地址";
        if (!$pc_address2)  $msg_list[] = "请输入邮件地址（确认）";
        if ($pc_address != $pc_address2) $msg_list[] = "邮件地址不一致";
        if (!db_common_is_mailaddress($pc_address)) $msg_list[] = "邮件地址输入有误";

        if (!db_member_is_limit_domain4mail_address($pc_address)) $msg_list[] = "此邮件地址不能登录";

        if ($msg_list) {
            $msg = array_shift($msg_list);
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_h_config', $p);
        }

        $c_member_id = db_member_c_member_id4pc_address($pc_address);
        if ($c_member_id == $u) {
            //自分のメールアドレス
            $p = array('msg' => "输入的邮件地址已经登录");
            openpne_redirect('pc', 'page_h_config', $p);
        } elseif ($c_member_id) {
            //既に使われている
            $p = array('msg' => "输入的邮件地址已经登录");
            openpne_redirect('pc', 'page_h_config', $p);
        }

        if (is_ktai_mail_address($pc_address)) {
            $p = array('msg' => '手机邮件地址不能登记');
            openpne_redirect('pc', 'page_h_config', $p);
        }

        db_member_h_config_1($u, $pc_address);

        $GLOBALS['AUTH']->logout();
        openpne_redirect('pc', 'page_o_h_config_mail');
    }
}

?>
