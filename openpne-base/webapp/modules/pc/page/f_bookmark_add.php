<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_f_bookmark_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        if ($target_c_member_id == $u) {
            handle_kengen_error();
        }

        $this->set('inc_navi', fetch_inc_navi('f', $target_c_member_id));
        $c_member = db_member_c_member_with_profile($target_c_member_id);
        $c_member['last_login'] = p_f_home_last_login4access_date($c_member['access_date']);
        $this->set('c_member', $c_member);

        return 'success';
    }
}

?>
