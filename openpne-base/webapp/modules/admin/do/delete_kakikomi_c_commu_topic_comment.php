<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(日記削除)
class admin_do_delete_kakikomi_c_commu_topic_comment extends OpenPNE_Action
{
    function execute($requests)
    {
        $topic_comment = db_commu_c_commu_topic_comment4c_commu_topic_comment_id($requests['target_c_commu_topic_comment_id']);

        if (!$topic_comment) {
            admin_client_redirect('topic_comment_list', '该活动的主题评论不存在');
        }
        if ($topic_comment['number'] == 0) {
            admin_client_redirect('topic_comment_list', '该回复因为是话题本文，请在删除话题里删除');
        }

        db_commu_delete_c_commu_topic_comment($requests['target_c_commu_topic_comment_id']);

        admin_client_redirect('topic_comment_list', '活动的评论已被删除');
    }
}

?>
