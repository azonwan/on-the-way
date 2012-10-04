<?php
//require_once 'OpenPNE/member.php';
class pc_page_h_search extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        
        $host_list = array('msn'=>'MSN');
        $host_selected = 'msn';
        
        $this->set('host_list',$host_list);
        $this->set('host_selected',$host_selected);
        
       //最近注册的用户
        $limit = 4;
        
        $cond = array(
            'birth_year' => '',
            'birth_month' => '',
            'birth_day' => '',
            'image' => '',
        );
        $cond_like = array(
            'nickname' => '',
        );
        $profiles = array();
        $page = 1;
        $result = db_member_search($cond, $cond_like, $limit, $page, $u, $profiles);
        $this->set("target_friend_list", $result[0]);
        if(!extension_loaded(curl))
        {
        	$use_msn = false;
        } else {
            $use_msn =true;
        }
        
        //TODO 新注册用户列表
        $this->set('use_msn', $use_msn);
        $this->set('inc_navi', fetch_inc_navi('h'));
        return 'success';
    }
}

?>
