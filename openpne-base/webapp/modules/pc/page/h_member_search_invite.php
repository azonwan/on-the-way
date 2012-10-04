<?php

class pc_page_h_member_search_invite extends OpenPNE_Action
{    
	function handleError($errors)
    {
        $_REQUEST['msg1'] = $errors['username'];
        $_REQUEST['msg2'] = $errors['hostname'];
        $_REQUEST['msg3'] = $errors['password'];
        openpne_forward('pc', 'page', 'h_member_search', $errors);
        exit;
    }
    function execute($requests)
    {
    $u = $GLOBALS['AUTH']->uid();
		$username = $requests['username'];
		$password = $requests['password'];
		$hostname = $requests['hostname'];
		if(!extension_loaded(curl))
		{
//			die('<p align="center"><font color="#FF0000">Curl is not installed on your server, Please contact to your server administrator.</font></p>');
			openpne_redirect('pc', 'page_h_member_search');
			exit;
		}
		
		require(OPENPNE_LIB_DIR . '/include/ContactGrabber/BaseClass.php');
		switch($hostname){
			case 'msn':
				require(OPENPNE_LIB_DIR . '/include/ContactGrabber/Hotmail/msn_contact_grab.class.php');
		 		$obj = new hotmail();
				break;
		}

		$contacts = $obj->getAddressbook($username,$password);
		if(empty($contacts)){
			$p = array('msg'=>$GLOBALS['ltag']['fh_member_search_result_erro']);
        	openpne_redirect('pc', 'page_h_search', $p);
		}
//TODO
//$contacts=array(
//'name'=>array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15),
//'email'=>array('cmm@openkaku.com','admxin4@openkaku.com','acdmin5@openkaku.com'
//,'ss.ss@hotmail.com','cmm@openkaku.com','admin4@openkaku.com'
//,'ss.ss@hotmail.com','cmm@openkaku.com','admin4@openkaku.com'
//,'ss.ss@hotmail.com','cmm@openkaku.com','admin4@openkaku.com'
//,'ss.ss@hotmail.com','cmm@openkaku.com','admin4@openkaku.com')
//);

		$members = array();
		$total = sizeof($contacts['name']);
		for ($i=0,$k=0;$i< $total;$i++) {
			$name = $contacts['name'][$i];
			$mail = $contacts['email'][$i];
			$c_member_id = db_member_c_member_id4pc_address($mail);
			if(empty($c_member_id)){
					$members[$k]['name'] = $name;
					$members[$k]['email'] = $mail;
					$members[$k]['c_member_id'] = $c_member_id;
					$members[$k++]['image_filename'] = '';
			}
		}
		
		$this->set('members',$members);
		$this->set('members_num',count($members));
		
        $this->set('inc_navi', fetch_inc_navi('h'));
        return 'success';
    }
}

?>
