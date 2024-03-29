<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_image_edit_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg'] = array_shift($errors);
        openpne_forward('pc', 'page', 'h_album_edit', $errors);
        exit;
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_image_id = $requests['target_c_album_image_id'];
        $image_description = $requests['image_description'];
        // ----------

        $sessid = session_id();
        t_image_clear_tmp($sessid);

        // アルバムの写真データ取得
        $c_album_image = db_album_image_get_c_album_image4id($target_c_album_image_id);
        $target_c_album_id = $c_album_image['c_album_id'];

        //アルバムデータ取得
        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        //--- 権限チェック
        if ($u != $c_album['c_member_id']) {
            handle_kengen_error();
        }

        $upfile = $_FILES['upfile_1'];
        $tmpfile = '';

        if ($upfile['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile))) {
                $_REQUEST['msg'] = '图片请使用'.IMAGE_MAX_FILESIZE.'KB以内的GIF・JPEG・PNG格式';
                openpne_forward('pc', 'page', 'h_album_image_edit');
                exit;
            }
            $tmpfile = t_image_save2tmp($upfile, $sessid, "a_{$target_c_album_id}_1", $image['format']);

            // 置き換えたときのファイルサイズを出すために、追加ファイルサイズから置き換わるファイルサイズを減算
            $filesize = $upfile['size'] - $c_album_image['filesize'];

            if (!db_album_is_insertable4c_member_id($u, $filesize)) {
                t_image_clear_tmp($sessid);
                $msg = '无法上传限制容量以上的图片';
                if (!db_album_is_insertable4c_member_id($u)) {
                    $msg .= '编辑前请删除原来的内容';
                } else {
                    $msg .= '变更文件尺寸需要重新上传';
                }
                $p = array(
                    'msg' => $msg,
                    'target_c_album_id' => $target_c_album_id,
                    'target_c_album_image_id' => $target_c_album_image_id,
                );
                openpne_redirect('pc', 'page_h_album_image_edit', $p);
            }
        }

        $this->set('inc_navi', fetch_inc_navi("h"));

        $form_val = array(
            "target_c_album_id" => $target_c_album_id,
            "target_c_album_image_id" => $target_c_album_image_id,
            "image_description" => $image_description,
            "upfile_1" => $upfile,
            "tmpfile_1" => $tmpfile,
        );

        $this->set("form_val", $form_val);
        
        return 'success';
    }
}

?>
