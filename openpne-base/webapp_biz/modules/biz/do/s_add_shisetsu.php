<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 施設情報追加
class biz_do_s_add_shisetsu extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!$requests['name']) {
            $p = array('msg' => '请输入名称');
            openpne_redirect('biz', 'page_s_add_shisetsu', $p);
        }

        $sessid = session_id();
        $filename = '';

        if ($_FILES['image_filename']['name']) {
            $filename = biz_saveImage($_FILES['image_filename'], "s_".$sessid);

            if (!$filename) {
                $p = array('msg' => '请上传' . IMAGE_MAX_FILESIZE . 'KB以内的GIF・JPEG・PNG格式文件');
                openpne_redirect('biz', 'page_s_add_shisetsu', $p);
            }
        }

        t_image_clear_tmp(session_id());

        biz_addShisetsu($requests['name'], $filename, $requests['info']);

        $p = array('msg' => '完成。');
        openpne_redirect('biz', 'page_s_list', $p);
    }
}

?>
