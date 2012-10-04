<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 日記を書く
 */
class pc_do_fh_album_comment_add_insert_c_album_comment extends OpenPNE_Action
{
function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        $tmpfile_1 = $requests['tmpfile_1'];
        $tmpfile_2 = $requests['tmpfile_2'];
        $tmpfile_3 = $requests['tmpfile_3'];
        $body = $requests['body'];
        // ----------
        if (is_null($body) || $body === '') {
            $p = array(
                'target_c_album_id' => $target_c_album_id,
                'msg' => "请输入留言"
            );
            openpne_redirect('pc', 'page_fh_album', $p);
        }

        //--- 権限チェック

        $c_album = db_album_get_c_album_row4id($target_c_album_id);
        $target_c_member_id = $c_album['c_member_id'];
        $target_c_member = db_member_c_member4c_member_id($target_c_member_id);

        if ($u != $target_c_member_id) {
            // check public_flag
            if (!pne_check_album_public_flag($target_c_album_id, $u)) {
                openpne_redirect('pc', 'page_h_err_album_access');
            }
            //アクセスブロック設定
            if (db_member_is_access_block($u, $target_c_member_id)) {
                openpne_redirect('pc', 'page_h_access_block');
            }
        }
        //---

        //日記コメント書き込み
        $c_album_comment_id = db_album_insert_c_album_comment($u, $target_c_album_id, $body);

        $sessid = session_id();
        $filename_1 = image_insert_c_image_album4tmp("ac_{$c_album_comment_id}_1", $tmpfile_1);
        $filename_2 = image_insert_c_image_album4tmp("ac_{$c_album_comment_id}_2", $tmpfile_2);
        $filename_3 = image_insert_c_image_album4tmp("ac_{$c_album_comment_id}_3", $tmpfile_3);
        t_image_clear_tmp($sessid);
    db_album_insert_c_album_comment_images($c_album_comment_id, $filename_1[0], $filename_2[0], $filename_3[0]);

        //日記コメントが書き込まれたので日記自体を未読扱いにする
        db_album_update_c_album_is_checked($target_c_album_id, 0);

        // コメント者と被コメント者が違う場合にポイント加算
        if($u!= $target_c_member_id){
            //書いた人にポイント付与
            $point = db_action_get_point4c_action_id(21);
            db_point_add_point($u, $point);

            //書かれた人にポイント付与
            $point = db_action_get_point4c_action_id(20);
            db_point_add_point($target_c_member_id, $point);
        }

        $p = array(
            'target_c_album_id' => $target_c_album_id,
            'comment_count' => db_album_count_c_album_comment4c_album_id($target_c_album_id)
        );
        openpne_redirect('pc', 'page_fh_album', $p);
    }
}
?>
