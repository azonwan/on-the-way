<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_delete_album_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        $target_c_album_comment_id = $requests['target_c_album_comment_id'];
        
        // ----------

        // target が指定されていない
        if (!$target_c_album_id) {
            openpne_redirect('pc', 'page_h_err_fh_album');
        }
        // target の日記が存在しない
        if (!p_common_is_active_c_album_id($target_c_album_id)) {
            openpne_redirect('pc', 'page_h_err_fh_album');
        }

        $target_album = db_album_get_c_album4c_album_id($target_c_album_id);


        // 削除するコメントがが指定されていない
        if (!$target_c_album_comment_id) {
            $p = array('target_c_album_id' => $target_c_album_id);
            openpne_redirect('pc', 'page_fh_album', $p);
        }


        // オブジェクトの振り分け用
        $target_c_member_id = $target_album['c_member_id'];

        // inc_navi.tpl
        if ($target_c_member_id == $u) {
            $type = 'h';
            $is_album_admin = true;
        } else {
            $type = 'f';
            $is_album_admin = false;
        }

        $this->set('inc_navi', fetch_inc_navi($type, $target_c_member_id));
        $this->set('is_album_admin', $is_album_admin);

        $this->set('member', db_member_c_member4c_member_id($u));
        $this->set('target_member', db_member_c_member4c_member_id($target_c_member_id));
        $this->set('target_album', $target_album);
//        print "<pre>";
//        print_r ($target_album);
//        print "</pre>";
        
        //削除するコメント一覧
        $list = db_album_get_c_album_comment_list4id_list($target_c_album_comment_id);
        $this->set('target_album_comment_list', array_shift($list));

        //削除するコメントID
        $this->set('target_c_album_comment_id', $target_c_album_comment_id);

        return 'success';
    }
}

?>
