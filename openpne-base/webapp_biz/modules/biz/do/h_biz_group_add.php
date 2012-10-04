<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_biz_group_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $sessid = session_id();

        $member_list = serialize($requests['member_list']);

        if (!$requests['name']) {
            $p = array('msg' => '请输入团对名称', 'name' => $requests['name'],
                'info' => $requests['info'], 'memberlist' => $member_list);
            openpne_redirect('biz', 'page_h_biz_group_add', $p);
            exit();
        }

        $filename = '';
        if ($_FILES['image_filename']['name']) {
            $filename = biz_saveImage($_FILES['image_filename'], "g_".$sessid);
            if (!$filename) {
                $filename = $requests['image_filename'];
                $p = array('msg' => '只能是' . IMAGE_MAX_FILESIZE . 'KB以内的gif或jpg/peng格式的文件', 'id' => $id);
                openpne_redirect('biz', 'page_h_biz_group_add', $p);
                exit();
            }
        }
        t_image_clear_tmp(session_id());

        biz_insertGroup($requests['name'], $u, $requests['info'], $filename, $requests['member_list']);

        $p = array('target_c_commu_id' => biz_getGroupMax());
        openpne_redirect('biz', 'page_g_home', $p);
    }
}

?>
