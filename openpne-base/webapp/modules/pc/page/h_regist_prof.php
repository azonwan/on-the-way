<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_regist_prof extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $this->set('c_member', db_member_c_member4c_member_id($u, true, true, 'private'));
        $this->set('profs', $_SESSION['prof']);
        $public_flags = array(
            'public' => '对全体公开',
            'friend' => '只对'.WORD_MY_FRIEND.'公开',
            'private'=> '不公开',
        );
        $this->set('public_flags', $public_flags);

        $this->set('inc_navi', fetch_inc_navi("h"));

        $this->set('month_list', p_regist_prof_c_profile_month_list4null());
        $this->set('day_list', p_regist_prof_c_profile_day_list4null());

        $this->set('c_profile_list', db_member_c_profile_list());

        return 'success';
    }
}

?>
