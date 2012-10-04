<?php
class pc_do_h_member_invite_firend extends OpenPNE_Action
{  
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
		$friends  = $requests['friends'];
		$body  = $requests['body'];
		$lang_tag  = $requests['langage'];
        $c_member_from = db_member_c_member4c_member_id($u);

        $session = create_hash();
        $c_member_id_invite = $u;
        
        foreach($friends as $key=>$mail){
            // c_member_pre に追加
            $message=$body;
            if (db_member_c_member_pre4pc_address($mail)) {
                db_member_update_c_invite($c_member_id_invite, $mail, $message, $session);
            } else {
                db_member_insert_c_invite($c_member_id_invite, $mail, $message, $session);
            }
            do_h_invite_insert_c_invite_mail_send($c_member_id_invite, $session, $message, $mail, $lang_tag);
        }

        openpne_redirect('pc', 'page_h_home');
    }
}

?>
