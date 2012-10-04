<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_topic_write_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['err_msg'] = $errors;
        openpne_forward('pc', 'page', 'c_topic_detail', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $body = $requests['body'];
        $button = $requests['button'];
        // ----------

        //TODO:画像バリデータ
        $upfile_obj1 = $_FILES['image_filename1'];
        $upfile_obj2 = $_FILES['image_filename2'];
        $upfile_obj3 = $_FILES['image_filename3'];

        //添付ファイル
        $upfile_obj4 = $_FILES['uploadfile'];

        //エラーチェック
        $err_msg = array();

        if (!empty($upfile_obj1) && $upfile_obj1['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj1))) {
                $err_msg[] = '图像1请使用".IMAGE_MAX_FILESIZE."KB以内的GIF、JPEG、PNG文件';
            }
        }
        if (!empty($upfile_obj2) && $upfile_obj2['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj2))) {
                $err_msg[] = '图像2请使用".IMAGE_MAX_FILESIZE."KB以内的GIF、JPEG、PNG文件';
            }
        }
        if (!empty($upfile_obj3) && $upfile_obj3['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj3))) {
                $err_msg[] = '图像3请使用".IMAGE_MAX_FILESIZE."KB以内的GIF、JPEG、PNG文件';
            }
        }

        if (OPENPNE_USE_FILEUPLOAD) {
            if (!empty($upfile_obj4) && $upfile_obj4['error'] !== UPLOAD_ERR_NO_FILE) {
                // ファイルサイズ制限
                if ($upfile_obj4['size'] === 0 || $upfile_obj4['size'] > FILE_MAX_FILESIZE * 1024) {
                    $err_msg[] = '文件请使用' . FILE_MAX_FILESIZE . 'KB以内的文件（不过空文件不能上传）';
                }

                // 拡張子制限
                if (!util_check_file_extention($upfile_obj4['name'])) {
                    $err_msg[] = sprintf('能够上传的文件种类是(%s)', util_get_file_allowed_extensions('string'));
                }
            }
        }

        if ($err_msg) {
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', "c_topic_detail");
            exit;
        }
        //-----

        $c_topic = db_commu_c_topic4c_commu_topic_id($c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];

        //--- 権限チェック
        if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
            handle_kengen_error();
        }
        if (!db_commu_is_writable_c_commu_topic_comment4c_commu_topic_id($c_commu_topic_id)) {
            $err_msg[] = '留言达到1000条，此日记不能再留言。';
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', "c_topic_detail");
            exit;
        }
        //---

        $sessid = session_id();
        t_image_clear_tmp($sessid);
        t_file_clear_tmp($sessid);

        $tmpfile1 = t_image_save2tmp($upfile_obj1, $sessid, "tc_1");
        $tmpfile2 = t_image_save2tmp($upfile_obj2, $sessid, "tc_2");
        $tmpfile3 = t_image_save2tmp($upfile_obj3, $sessid, "tc_3");

        if (OPENPNE_USE_FILEUPLOAD) {
            // 一時ファイルをvar/tmpにコピー
            $tmpfile4 = t_file_save2tmp($upfile_obj4, $sessid, "tc_4");
        }

        $this->set('inc_navi', fetch_inc_navi('c', $c_commu_id));
        $topic_write['target_c_commu_topic_id'] = $c_commu_topic_id;
        $topic_write['body'] = $body;
        $topic_write['image_filename1_tmpfile']=$tmpfile1;
        $topic_write['image_filename2_tmpfile']=$tmpfile2;
        $topic_write['image_filename3_tmpfile']=$tmpfile3;
        $topic_write['image_filename1']=$upfile_obj1["name"];
        $topic_write['image_filename2']=$upfile_obj2["name"];
        $topic_write['image_filename3']=$upfile_obj3["name"];
        $topic_write['filename4_tmpfile'] = $tmpfile4;
        $topic_write['filename4_original_filename'] = $upfile_obj4["name"];
        $this->set('topic_write', $topic_write);
        return 'success';
    }
}

?>
