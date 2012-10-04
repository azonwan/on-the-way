<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティ情報の更新
 */
class pc_do_c_edit_update_c_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();


        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $name = $requests['name'];
        $c_commu_category_id = $requests['c_commu_category_id'];
        $info = $requests['info'];
        $public_flag = $requests['public_flag'];
        $topic_authority = $requests['topic_authority'];
        $is_send_join_mail = $requests['is_send_join_mail'];
        // ----------
        $upfile_obj = $_FILES['image_filename'];

        //--- 権限チェック
        //コミュニティ管理者

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin']) {
            handle_kengen_error();
        }
        //---

        $err_msg = array();
        if (!$name) $err_msg[] = "请输入". WORD_COMMUNITY . "名";
        if (!$info) $err_msg[] = "请输入". WORD_COMMUNITY . "说明";

        if (!empty($upfile_obj) && $upfile_obj['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj))) {
                $err_msg[] = '图像请使用'.IMAGE_MAX_FILESIZE.'KB以内的GIF、JPEG、PNG文件';
            }
        }

        if ($err_msg) {
            $_REQUEST['err_msg'] = $err_msg;
            $_REQUEST['target_c_commu_id'] = $target_c_commu_id;
            $_REQUEST['name'] = $name;
            $_REQUEST['info'] = $info;
            openpne_forward('pc', 'page', "c_edit");
            exit;
        }

        //画像アップデート
        $sessid = session_id();
        t_image_clear_tmp($sessid);
        if (file_exists($upfile_obj["tmp_name"])) {
            $tmpfile = t_image_save2tmp($upfile_obj, $sessid, "c");
        }
        if ($tmpfile) {
            $image_filename = image_insert_c_image4tmp("c_{$target_c_commu_id}", $tmpfile);
        }
        t_image_clear_tmp(session_id());

        if ($image_filename) {
            //画像削除
            $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);
            db_image_data_delete($c_commu['image_filename']);
        }

        db_commu_update_c_commu(
            $target_c_commu_id,
            $name,
            $topic_authority,
            $c_commu_category_id,
            $info,
            $public_flag,
            $image_filename,
            $is_send_join_mail);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('pc', 'page_c_home', $p);
    }
}

?>
