<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */


/**
 * 日記コメント削除
 */
class pc_do_fh_album_delete_c_album_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $target_c_album_comment_id =  $_REQUEST['target_c_album_comment_id'];
        
        

        foreach ($target_c_album_comment_id as $val) {

            //--- 権限チェック
            //日記作成者 or コメント作成者

            $target_c_album_comment = _do_c_album_comment4c_album_comment_id($val);
            $target_c_album_id = $target_c_album_comment['c_album_id'];

            $c_album = db_album_get_c_album_row4id($target_c_album_id);
            if ($c_album['c_member_id'] != $u
                && $target_c_album_comment['c_member_id'] != $u) {

                handle_kengen_error();
            }
            //---

            //コメント削除実行
            db_album_delete_c_album_comment($val, $u);
        }

        $p = array('target_c_album_id' => $target_c_album_id);
        openpne_redirect('pc', 'page_fh_album', $p);
    }
}

?>
