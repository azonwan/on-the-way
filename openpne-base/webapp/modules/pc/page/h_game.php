<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_game extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $this->set('inc_navi', fetch_inc_navi('h'));
        $game_area = db_member_c_profile_option_list4c_profile_id(3);
        $this->set('game_area', $game_area);
        
        return 'success';
    }
}

?>
