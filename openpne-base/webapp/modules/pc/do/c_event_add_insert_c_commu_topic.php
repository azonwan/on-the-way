<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_event_add_insert_c_commu_topic extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $tmpfile1 = $requests['image_filename1_tmpfile'];
        $tmpfile2 = $requests['image_filename2_tmpfile'];
        $tmpfile3 = $requests['image_filename3_tmpfile'];
        // ----------

        //--- 権限チェック
        //コミュニティ参加者

        list($event, $errors) = p_c_event_add_confirm_event4request(true);

        $status = db_common_commu_status($u, $event['c_commu_id']);
        if (!$status['is_commu_member']) {
            handle_kengen_error();
        }

        $c_commu = db_commu_c_commu4c_commu_id2($event['c_commu_id']);

        //トピック作成権限チェック
        if ($c_commu['topic_authority'] == 'admin_only' && !db_commu_is_c_commu_admin($event['c_commu_id'], $u)) {
            $_REQUEST['target_c_commu_id'] = $event['c_commu_id'];
            $_REQUEST['msg'] = "活动只能由管理者发布";
            openpne_forward('pc', 'page', "c_home");
            exit;
        }
        //---

        // エラーチェック
        $err_msg = $errors;

        if (!$event['open_date_month'] || !$event['open_date_day'] || !$event['open_date_year']) {
            $err_msg[] = "请输入举办日期";
        } elseif (!t_checkdate($event['open_date_month'], $event['open_date_day'], $event['open_date_year'])) {
            $err_msg[] = "举办日期不存在";
        } elseif (mktime(0, 0, 0, $event['open_date_month'], $event['open_date_day'], $event['open_date_year']) < mktime(0, 0, 0)) {
            $err_msg[] = "举办日期不能指定为过去";
        }

        if ($event['invite_period_month'].$event['invite_period_day'].$event['invite_period_year'] != "") {
            if (!$event['invite_period_month'] || !$event['invite_period_day'] || !$event['invite_period_year']) {
                $err_msg[] = "招募期限不存在";
            } elseif (!t_checkdate($event['invite_period_month'], $event['invite_period_day'], $event['invite_period_year'])) {
                $err_msg[] = "招募期限不存在";
            } elseif (mktime(0, 0, 0, $event['invite_period_month'], $event['invite_period_day'], $event['invite_period_year']) < mktime(0, 0, 0)) {
                $err_msg[] = "招募期限不能指定为过去";
            } elseif (mktime(0, 0, 0, $event['open_date_month'], $event['open_date_day'], $event['open_date_year'])
                    < mktime(0, 0, 0, $event['invite_period_month'], $event['invite_period_day'], $event['invite_period_year'])) {
                $err_msg[] = "招募期限不能超过举办日期";
            }
        }

        if ($err_msg) {
            $_REQUEST = $event;
            $_REQUEST['target_c_commu_id'] = $event['c_commu_id'];
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', "c_event_add");
            exit;
        }

        if ($event['invite_period_year'].$event['invite_period_month'].$event['invite_period_day']!="") {
            $invite_period = $event['invite_period_year']."-".$event['invite_period_month']."-".$event['invite_period_day'];
        }

        $insert_c_commu_topic = array(
            "name"              => $event['title'],
            "c_commu_id"        => $event['c_commu_id'],
            "c_member_id"       => $u,
            "open_date"         => $event['open_date_year']."-".$event['open_date_month']."-".$event['open_date_day'],
            "open_date_comment" => $event['open_date_comment'],
            "open_pref_id"      => $event['open_pref_id'],
            "open_pref_comment" => $event['open_pref_comment'],
            "invite_period"     => $invite_period,
            "event_flag"        => 1,
            "capacity"        => $event['capacity'],
        );
        $c_commu_topic_id = db_commu_insert_c_commu_topic($insert_c_commu_topic);

        if ($tmpfile1) {
            $filename1 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_1", $tmpfile1);
        }
        if ($tmpfile2) {
            $filename2 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_2", $tmpfile2);
        }
        if ($tmpfile3) {
            $filename3 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_3", $tmpfile3);
        }
        t_image_clear_tmp(session_id());

        $insert_c_commu_topic_comment = array(
            "c_commu_id"       => $event['c_commu_id'],
            "c_member_id"      => $u,
            "body"             => $event['detail'],
            "number"           => 0,
            "c_commu_topic_id" => $c_commu_topic_id,
            "image_filename1"  => !empty($filename1) ? $filename1 : '',
            "image_filename2"  => !empty($filename2) ? $filename2 : '',
            "image_filename3"  => !empty($filename3) ? $filename3 : '',
        );
        $insert_id = db_commu_insert_c_commu_topic_comment_3($insert_c_commu_topic_comment);

        //お知らせメール送信(携帯へ)
        send_bbs_info_mail($insert_id, $u);
        //お知らせメール送信(PCへ)
        send_bbs_info_mail_pc($insert_id, $u);

        db_commu_insert_c_event_member_as_admin($c_commu_topic_id, $u);

        if (OPENPNE_USE_POINT_RANK) {
            //イベントを作成した人にポイント付与
            $point = db_action_get_point4c_action_id(10);
            db_point_add_point($u, $point);
        }

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('pc', 'page_c_event_detail', $p);
    }
}

?>
