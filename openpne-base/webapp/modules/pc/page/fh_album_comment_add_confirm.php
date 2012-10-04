<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_fh_album_comment_add_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg2'] = $errors['body'];
        openpne_forward('pc', 'page', 'h_diary_add', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $body = $requests['body'];
        $target_c_album_id = $requests['target_c_album_id'];
        $sessid = session_id();
        t_image_clear_tmp($sessid);

        $upfiles = array(
            1 => $_FILES['upfile_1'],
            $_FILES['upfile_2'],
            $_FILES['upfile_3'],
        );
        $tmpfiles = array(
            1 => '',
            '',
            '',
        );

        foreach ($upfiles as $key => $upfile) {
            if (!empty($upfile) && $upfile['error'] !== UPLOAD_ERR_NO_FILE) {
                if (!($image = t_check_image($upfile))) {
                    $_REQUEST['msg'] = '图像请使用'.IMAGE_MAX_FILESIZE.'KB以内的GIF、JPEG、PNG文件';
                    openpne_forward('pc', 'page', 'h_diary_add');
                    exit;
                } else {
                    $tmpfiles[$key] = t_image_save2tmp($upfile, $sessid, "d_{$key}", $image['format']);
                }
            }
        }


        $this->set('inc_navi', fetch_inc_navi('h'));

        //プロフィール
        $this->set("member", db_member_c_member4c_member_id($u));

        $form_val = array(
            "target_c_album_id" => $target_c_album_id,
            "body" => $body,
            "upfile_1" => $_FILES['upfile_1'],
            "upfile_2" => $_FILES['upfile_2'],
            "upfile_3" => $_FILES['upfile_3'],
            "tmpfile_1" => $tmpfiles[1],
            "tmpfile_2" => $tmpfiles[2],
            "tmpfile_3" => $tmpfiles[3],
        );
        $this->set("form_val", $form_val);
        return 'success';
    }
}

?>
