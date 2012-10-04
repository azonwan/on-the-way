<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//グループを編集
class biz_do_h_biz_group_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        $id = $requests['target_id'];

        if (!$requests['name']) {
            $p = array('msg' => '请输入团队名称', 'target_id' => $id);
            openpne_redirect('biz', 'page_h_biz_group_edit', $p);
            exit();
        }

        $filename = $requests['image_filename'];

        if ($_FILES['image_filename']['name']) {
            $filename = biz_saveImage($_FILES['image_filename'], "g_".$sessid);
            if (!$filename) {
                $filename = $requests['image_filename'];
                $p = array('msg' => '请上传' . IMAGE_MAX_FILESIZE . 'KB以内的GIF・JPEG・PNG格式的文件', 'target_id' => $id);
                openpne_redirect('biz', 'page_h_biz_group_edit', $p);
                exit();
            }
        }
        t_image_clear_tmp(session_id());

        biz_editGroup($id, $requests['name'], $u, $requests['info'], $filename, $requests['member_list']);

        $p = array('msg' => '更改以下内容吗？', 'target_c_commu_id' => $id);
        openpne_redirect('biz', 'page_g_home', $p);

    }
}

?>
