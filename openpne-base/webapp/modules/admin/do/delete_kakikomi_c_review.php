<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(レビュー削除)
class admin_do_delete_kakikomi_c_review extends OpenPNE_Action
{
    function execute($requests)
    {
        $review = db_review_edit_c_review_comment4c_review_comment_id($requests['target_c_review_comment_id']);

        if (!$review) {
            admin_client_redirect('review_list', '该评论不存在');
        }

        do_h_review_edit_delete_c_review_comment($requests['target_c_review_comment_id']);

        admin_client_redirect('review_list', '评论已经删除');
    }
}

?>
