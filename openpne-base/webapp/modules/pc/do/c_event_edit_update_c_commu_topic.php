<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_event_edit_update_c_commu_topic extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();


        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        // ----------
        $upfile_obj1 = $_FILES['image_filename1'];
        $upfile_obj2 = $_FILES['image_filename2'];
        $upfile_obj3 = $_FILES['image_filename3'];


        list($event, $errors) = p_c_event_add_confirm_event4request(true);
        if ($event['invite_period_year'].$event['invite_period_month'].$event['invite_period_day'] != '') {
            $invite_period = $event['invite_period_year']."-".$event['invite_period_month']."-".$event['invite_period_day'];
        } else {
            $invite_period = "";
        }
        $c_commu_id = $event['c_commu_id'];

        //--- 権限チェック
        //イベント管理者 or コミュニティ管理者

        if (!db_commu_is_c_event_admin($c_commu_topic_id, $u) &&
            !db_commu_is_c_commu_admin($c_commu_id, $u)) {
            handle_kengen_error();
        }
        $c_commu = db_commu_c_commu4c_commu_id2($c_commu_id);
        if ($c_commu['topic_authority'] == 'admin_only' &&
            !db_commu_is_c_commu_admin($c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---

        //エラーチェック
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
                $err_msg[] = "募集期限不存在";
            } elseif (!t_checkdate($event['invite_period_month'], $event['invite_period_day'], $event['invite_period_year'])) {
                $err_msg[] = "招募期限不存在";
            } elseif (mktime(0, 0, 0, $event['invite_period_month'], $event['invite_period_day'], $event['invite_period_year']) < mktime(0, 0, 0)) {
                $err_msg[] = "招募期限不能指定为过去";
            } elseif (mktime(0, 0, 0, $event['open_date_month'], $event['open_date_day'], $event['open_date_year'])
                    < mktime(0, 0, 0, $event['invite_period_month'], $event['invite_period_day'], $event['invite_period_year'])) {
                $err_msg[] = "招募期限不能超过举办日期";
            }
        }

        if (!empty($upfile_obj1) && $upfile_obj1['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj1))) {
                $err_msg[] = '图像1请使用'.IMAGE_MAX_FILESIZE.'KB以内的GIF、JPEG、PNG文件';
            }
        }
        if (!empty($upfile_obj2) && $upfile_obj2['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj2))) {
                $err_msg[] = '图像2请使用'.IMAGE_MAX_FILESIZE.'KB以内的GIF、JPEG、PNG文件';
            }
        }
        if (!empty($upfile_obj3) && $upfile_obj3['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj3))) {
                $err_msg[] = '图像3请使用'.IMAGE_MAX_FILESIZE.'KB以内的GIF、JPEG、PNG文件';
            }
        }

        if ($err_msg) {
            $_REQUEST = $event;
            $_REQUEST['err_msg'] = $err_msg;
            $_REQUEST['target_c_commu_topic_id'] = $c_commu_topic_id;
            openpne_forward('pc', 'page', "c_event_edit");
            exit;
        }

        // 画像アップデート
        $filename1 = image_insert_c_image_direct($upfile_obj1, "t_{$c_commu_topic_id}_1");
        $filename2 = image_insert_c_image_direct($upfile_obj2, "t_{$c_commu_topic_id}_2");
        $filename3 = image_insert_c_image_direct($upfile_obj3, "t_{$c_commu_topic_id}_3");

        $update_c_commu_topic = array(
            'name'              => $event['title'],
            'open_date'         => $event['open_date_year']."-".$event['open_date_month']."-".$event['open_date_day'],
            'open_date_comment' => $event['open_date_comment'],
            'open_pref_id'      => $event['open_pref_id'],
            'open_pref_comment' => $event['open_pref_comment'],
            'invite_period'     => $invite_period,
            'event_flag'        => 1,
            'capacity'        => $event['capacity'],
        );
        db_commu_update_c_commu_topic($c_commu_topic_id, $update_c_commu_topic);


        $update_c_commu_topic_comment = array(
            'body' => $event['detail'],
        );
        $c_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
        if ($filename1) {
            $update_c_commu_topic_comment["image_filename1"] = $filename1;
            db_image_data_delete($c_topic['image_filename1']);
        }
        if ($filename2) {
            $update_c_commu_topic_comment["image_filename2"] = $filename2;
            db_image_data_delete($c_topic['image_filename2']);
        }
        if ($filename3) {
            $update_c_commu_topic_comment["image_filename3"] = $filename3;
            db_image_data_delete($c_topic['image_filename3']);
        }
        db_commu_update_c_commu_topic_comment($c_commu_topic_id, $update_c_commu_topic_comment);

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('pc', 'page_c_event_detail', $p);
    }
}

?>
