<?php
/*
 * Created on 2008-9-1
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
class pc_page_h_invite_path extends OpenPNE_Action
{
    function execute($requests)
    {
    	$u = $GLOBALS['AUTH']->uid();
    	
		$c_member_session = db_member_get_session_id4c_member_id($u);
        if(!$c_member_session) {
        	$key = $u.ENCRYPT_KEY;
			$session_id = md5($key);
			$c_invite_session = db_member_insert_session_id($u,$session_id);
        	$c_member_session = db_member_get_session4c_invite_sessions_id($c_invite_session);
        }
 		$this->set('inc_navi', fetch_inc_navi('h'));
        
        $url = OPENPNE_URL.'?m=pc&a=page_o_ri&c_member_id='.$c_member_session['c_member_id'].'&sid='.$c_member_session['sessions_id'];
        $this->set('url', $url);
        
        return 'success';
    }
}
 
?>
