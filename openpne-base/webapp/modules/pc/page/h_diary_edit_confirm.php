<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_diary_edit_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg'] = array_shift($errors);
        openpne_forward('pc', 'page', 'h_diary_edit', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        $subject = $requests['subject'];
        $body = $requests['body'];
        $public_flag = util_cast_public_flag_diary($requests['public_flag']);
        $category = $requests['category'];
        // ----------

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
                    openpne_forward('pc', 'page', 'h_diary_edit');
                    exit;
                } else {
                    $tmpfiles[$key] = t_image_save2tmp($upfile, $sessid, "d_{$key}", $image['format']);
                }
            }
        }

        $category_list = array_unique(preg_split('/\s+/', $category));
        if (count($category_list) > 5) {
            $_REQUEST['msg'] = '指定分类不能超过5个';
            openpne_forward('pc', 'page', 'h_diary_edit');
            exit;
        }
        foreach ($category_list as $value) {
            if (mb_strwidth($value) > 20) {
                $_REQUEST['msg'] = '分类文字数不能超过半角20位';
                openpne_forward('pc', 'page', 'h_diary_edit');
                exit;
            }
        }

        $this->set('inc_navi', fetch_inc_navi("h"));

        //プロフィール
        $this->set("member", db_member_c_member4c_member_id($u));

        $form_val = array(
            "target_c_diary_id" => $target_c_diary_id,
            "del_img" => $_REQUEST['del_img'],
            "subject" => $subject,
            "body" => $body,
            "public_flag" => $public_flag,
            "upfile_1" => $_FILES['upfile_1'],
            "upfile_2" => $_FILES['upfile_2'],
            "upfile_3" => $_FILES['upfile_3'],
            "tmpfile_1" => $tmpfiles[1],
            "tmpfile_2" => $tmpfiles[2],
            "tmpfile_3" => $tmpfiles[3],
            "category" => join(" ", $category_list),
        );
        $this->set("form_val", $form_val);

        return 'success';
    }
}

?>
