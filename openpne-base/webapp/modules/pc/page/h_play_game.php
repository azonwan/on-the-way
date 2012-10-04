<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_play_game extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $info['game_name'] = $requests['game_name'];
        $info['uname'] = $requests['uname'];
        // ----------
        $info['key'] = 'DG3FO895';
        $info['add_key'] = 'HG5a64z';
        $info['uid'] = db_get_username4c_member_id($u);
        if (!$info['uid']){
            $info['uid'] = $u;
        }
        $key = $info['uid'].$info['key'].$info['add_key'];
        $info['sig'] = md5($key);
        if (preg_match("/[\x80-\xff]./", $info['uname'])){
        $_REQUEST['msg'] = '必须为英文字符或者拼音。';
        openpne_forward('pc', 'page', 'h_game'); 
        exit;
        }
        $sex = db_get_member_sex4c_member_id($u);
        if ($sex){
            if ($sex == '男性'){
                $info['sex'] = 0;
            }else{
                $info['sex'] = 1;
            }
        }else {
        $info['sex'] = 0;
        }
        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('info', $info);

        return 'success';
    }
}

?>
