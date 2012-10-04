<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_config_prof extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $prof = $_REQUEST['prof'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi('h'));

        if (!$prof) {
            $prof = db_member_c_member_with_profile($u, 'private');
        }
        $this->set('c_member', $prof);

        $this->set('month', p_regist_prof_c_profile_month_list4null());
        $this->set('day', p_regist_prof_c_profile_day_list4null());

        $public_flags = array(
            'public' => '对全体公开',
            'friend' => '只对'.WORD_MY_FRIEND.'公开',
            'private'=> '不公开',
        );
        $this->set('public_flags', $public_flags);

        $this->set('profile_list', db_member_c_profile_list());

        return 'success';
    }
}

?>
