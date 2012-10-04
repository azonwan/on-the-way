<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_event_write_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $body = $requests['body'];
        $button = $requests['button'];
        // ----------
        $upfile_obj1 = $_FILES['image_filename1'];
        $upfile_obj2 = $_FILES['image_filename2'];
        $upfile_obj3 = $_FILES['image_filename3'];

        $c_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];

        //--- 権限チェック
        if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
            handle_kengen_error();
        }
        if (!db_commu_is_writable_c_commu_topic_comment4c_commu_topic_id($c_commu_topic_id)) {
            $err_msg[] = '留言达到1000条，此日记不能在留言';
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', "c_event_detail");
            exit;
        }
        //---

        if ($button == "参加活动") {
            $event_write['add_event_member'] = 1;
        } elseif ($button == "取消参加") {
            $event_write['add_event_member'] = -1;
        }

        //エラーチェック
        $err_msg = array();

        if(trim($body) == '')  $err_msg[] = "请输入内容";

        if (!empty($upfile_obj1) && $upfile_obj1['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj1))) {
                $err_msg[] = '请使用图像1".IMAGE_MAX_FILESIZE."KB以内的GIF、JPEG、PNG文件';
            }
        }
        if (!empty($upfile_obj2) && $upfile_obj2['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj2))) {
                $err_msg[] = '请使用图像2".IMAGE_MAX_FILESIZE."KB以内的GIF、JPEG、PNG文件';
            }
        }
        if (!empty($upfile_obj3) && $upfile_obj3['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj3))) {
                $err_msg[] = '请使用图像3".IMAGE_MAX_FILESIZE."KB以内的GIF、JPEG、PNG文件';
            }
        }

        if ($event_write['add_event_member'] === 1 && $c_topic['capacity'] && $c_topic['capacity'] <= $c_topic['member_num'] ) {
                $err_msg[] = '超过活动参加者人数限制';
        }

        if ($event_write['add_event_member']) {
            if (!db_commu_is_event_join_date($c_commu_topic_id)) {
                $err_msg[] = '现在参加这个活动么？不能更改已经取消的';
            }
        }

        if ($err_msg) {
            $_REQUEST['err_msg'] = $err_msg;
            $_REQUEST['body'] = $body;
            openpne_forward('pc', 'page', "c_event_detail");
            exit;
        }

        $sessid = session_id();
        t_image_clear_tmp($sessid);
        $tmpfile1 = t_image_save2tmp($upfile_obj1, $sessid, "tc_1");
        $tmpfile2 = t_image_save2tmp($upfile_obj2, $sessid, "tc_2");
        $tmpfile3 = t_image_save2tmp($upfile_obj3, $sessid, "tc_3");

        $this->set('inc_navi', fetch_inc_navi("c", $c_commu_id));
        $event_write['target_c_commu_id'] = $c_commu_id;
        $event_write['target_c_commu_topic_id'] = $c_commu_topic_id;
        $event_write['body'] = $body;
        $event_write['image_filename1_tmpfile'] = $tmpfile1;
        $event_write['image_filename2_tmpfile'] = $tmpfile2;
        $event_write['image_filename3_tmpfile'] = $tmpfile3;
        $event_write['image_filename1'] = $upfile_obj1["name"];
        $event_write['image_filename2'] = $upfile_obj2["name"];
        $event_write['image_filename3'] = $upfile_obj3["name"];

        $this->set('event_write', $event_write);
        return 'success';
    }
}

?>
