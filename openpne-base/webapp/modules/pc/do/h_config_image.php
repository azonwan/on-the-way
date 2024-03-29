<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * プロフィール画像の変更
 */
class pc_do_h_config_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $upfile_obj = $_FILES['upfile'];

        if (!empty($upfile_obj) && $upfile_obj['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj))) {
                $p = array('msg' => '图像请使用'.IMAGE_MAX_FILESIZE.'KB以内的GIF、JPEG、PNG文件');
                openpne_redirect('pc', 'page_h_config_image', $p);
            }
        } elseif (empty($upfile_obj) || $upfile_obj['error'] === UPLOAD_ERR_NO_FILE) {
            $p = array('msg' => '请指定图像');
            openpne_redirect('pc', 'page_h_config_image', $p);
        }

        $c_member = db_member_c_member4c_member_id($u);

        if (!$c_member['image_filename_1']) {
            $img_num = 1;
        } elseif (!$c_member['image_filename_2']) {
            $img_num = 2;
        } elseif (!$c_member['image_filename_3']) {
            $img_num = 3;
        } else {
            $p = array('msg' => '图像只能上传3张');
            openpne_redirect('pc', 'page_h_config_image', $p);
        }

        // 画像をDBに格納
        $image_filename = image_insert_c_image($upfile_obj, "m_{$u}");

        if ($image_filename) {
            if (!($image_filename == $c_member['image_filename']
                  || $image_filename == $c_member['image_filename_1']
                  || $image_filename == $c_member['image_filename_2']
                  || $image_filename == $c_member['image_filename_3']
            )) {
                // c_memberのフィールドに登録
                db_member_config_image_new($u, $image_filename, $img_num);

                // 画像1の時（最初の画像）メイン画像に
                if ($img_num == 1) {
                    db_member_change_c_member_main_image($u, 1);
                }
            }
        }
        openpne_redirect('pc', 'page_h_config_image');
    }
}
?>
