<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_topic_edit_update_c_commu_topic extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $body = $requests['body'];
        $title = $requests['title'];
        // ----------
        $upfile_obj1 = $_FILES['image_filename1'];
        $upfile_obj2 = $_FILES['image_filename2'];
        $upfile_obj3 = $_FILES['image_filename3'];
        $upfile_obj4 = $_FILES['filename4'];

        //--- 権限チェック
        //トピック作成者 or コミュニティ管理者

        $c_topic = db_commu_c_topic4c_commu_topic_id($c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];

        if (!db_commu_is_c_topic_admin($c_commu_topic_id, $u) &&
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
        $err_msg = array();
        if (is_null($title) || $title === '') $err_msg[] = "请输入标题";
        if (is_null($body) || $body === '') $err_msg[] = "请输入详细内容";

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

        if (OPENPNE_USE_FILEUPLOAD) {
            if (!empty($upfile_obj4) && $upfile_obj4['error'] !== UPLOAD_ERR_NO_FILE) {
                // ファイルサイズ制限
                if ($upfile_obj4['size'] === 0 || $upfile_obj4['size'] > FILE_MAX_FILESIZE * 1024) {
                    $err_msg[] = '附件请使用' . FILE_MAX_FILESIZE . 'KB以内的文件（但是空文件无法上传）';
                }

                // 拡張子制限
                if (!util_check_file_extention($upfile_obj4['name'])) {
                    $err_msg[] = sprintf('能够上传的文件扩展名为(%s)', util_get_file_allowed_extensions('string'));
                }
            }
        }

        if ($err_msg) {
            $_REQUEST['err_msg'] = $err_msg;
            $_REQUEST['target_c_commu_topic_id'] = $c_commu_topic_id;
            $_REQUEST['title'] = $title;
            $_REQUEST['body'] = $body;
            openpne_forward('pc', 'page', "c_topic_edit");
            exit;
        }

        //画像コピー
        $sessid = session_id();
        t_image_clear_tmp($sessid);
        $tmpfile1 = t_image_save2tmp($upfile_obj1, $sessid, "t_1");
        $tmpfile2 = t_image_save2tmp($upfile_obj2, $sessid, "t_2");
        $tmpfile3 = t_image_save2tmp($upfile_obj3, $sessid, "t_3");
        if (OPENPNE_USE_FILEUPLOAD) {
            $tmpfile4 = t_file_save2tmp($upfile_obj4, $sessid, "t_4");
        }

        if ($tmpfile1) {
            $filename1 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_1", $tmpfile1);
        }
        if ($tmpfile2) {
            $filename2 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_2", $tmpfile2);
        }
        if ($tmpfile3) {
            $filename3 = image_insert_c_image4tmp("t_{$c_commu_topic_id}_3", $tmpfile3);
        }
        if ($tmpfile4) {
            $filename4 = file_insert_c_file4tmp("t_{$c_commu_topic_id}_4", $tmpfile4, $upfile_obj4['name']);
        }
        t_image_clear_tmp(session_id());
        t_file_clear_tmp(session_id());


        $update_c_commu_topic = array(
            'name'       => $title,
            'event_flag' => 0,
        );
        db_commu_update_c_commu_topic($c_commu_topic_id, $update_c_commu_topic);


        $update_c_commu_topic_comment = array(
            'body' => $body,
        );
        $c_topic = db_commu_c_topic4c_commu_topic_id($c_commu_topic_id);
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
        if ($filename4) {
            $update_c_commu_topic_comment['filename4'] = $filename4;
            db_file_delete_c_file($c_topic['filename']);
        }
        db_commu_update_c_commu_topic_comment($c_commu_topic_id, $update_c_commu_topic_comment);

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('pc', 'page_c_topic_detail', $p);
    }
}

?>
