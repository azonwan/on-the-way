<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_album_comment_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $direc = $requests['direc'];
        $page = $requests['page'];
        // ----------
        if (!$page){
        	$page = 1;
        }
        $page = $page+$direc;

        if (empty($target_c_member_id)) {
            $target_c_member_id = $u;
        }

        $target_c_member = db_member_c_member4c_member_id($target_c_member_id);
        $this->set("target_member", $target_c_member);

        if ($target_c_member_id == $u) {
            $type = "h";
        } else {
            $type = "f";

            $is_friend = db_friend_is_friend($u, $target_c_member_id);

            // アクセスブロック
            if (db_member_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('pc', 'page_h_access_block');
            }
        }
        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));

        //c_member_id から自分の日記についてるコメントIDリストを取得
        $target_c_album_comment_id = $this->_p_fh_album_c_album_comment_id_list4c_member_id($target_c_member_id, $is_friend, $type);
        
        
        $page_size = 50;
        list($c_album_comment_list, $is_prev, $is_next, $total_num) =
            db_album_get_c_album_comment_list4id_list($target_c_album_comment_id, $page, $page_size, true);
        
//        print "<pre>";
//        print $page;
//        print_r ($c_album_comment_list);
//        print "</pre>";
        
        
        $list_set0 = db_album_get_c_album_subject($target_c_member_id);
        $this->set("new_album_subject_list", $list_set0);
        
        $this->set('category', db_album_category_list4c_member_id($target_c_member_id));

        //最近のコメント一覧用配列(50個まで)
        $this->set("new_comment_list", $c_album_comment_list);
        $this->set("is_prev", $is_prev);
        $this->set("is_next", $is_next);
        $pager = array();
        if(!$total_num){
        	$pager['start'] = 0;
        	$pager['end'] = 0;
        }else{
        	$pager['start'] = $page_size * ($page - 1) + 1;
        	if (($pager['end'] = $page_size * $page) > $total_num) {
            	$pager['end'] = $total_num;
        	}
        }
        $this->set('page', $page);
        $this->set('pager', $pager);

        return 'success';
    }


    //c_member_id から自分の日記についてるコメントID(複数)を取得
    //日記公開範囲を考慮
    function _p_fh_album_c_album_comment_id_list4c_member_id($c_member_id, $is_friend, $type)
    {
        if ($type == 'h') {
            return p_fh_album_c_album_comment_id_list4c_member_id($c_member_id);
        }

        $sql = "SELECT cdc.c_album_comment_id FROM c_album as cd,c_album_comment as cdc, c_member as cm" .
            " WHERE cd.c_member_id = ?".
            " AND cd.c_album_id = cdc.c_album_id".
            " AND cd.c_member_id = cm.c_member_id";

        if ($is_friend) {
            $sql .= ' AND ((cd.public_flag = \'public\') OR (cd.public_flag = \'default\' AND cm.public_flag_diary = \'public\') OR (cd.public_flag = \'friend\') OR (cd.public_flag = \'default\' AND cm.public_flag_diary = \'friend\'))';
        } else {
            $sql .= ' AND ((cd.public_flag = \'public\') OR (cd.public_flag = \'default\' AND cm.public_flag_diary = \'public\'))';
        }
        $params = array(intval($c_member_id));
        return db_get_col($sql, $params);
    }


}

?>
