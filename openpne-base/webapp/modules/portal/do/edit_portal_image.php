<?php
class portal_do_edit_portal_image extends OpenPNE_Action
{
    function handleError($errors)
    {
        portal_client_redirect('edit_portal_image', array_shift($errors));
    }

    function execute($requests)
    {
        $file = $_FILES['upfile'];
        $target_area = $requests['target_area'];

        $tail = 'target_area=' . $target_area;

        if (empty($file) || $file['error'] === UPLOAD_ERR_NO_FILE) {
            portal_client_redirect('edit_portal_image', '请选择上传图片', $tail);
        }

        $file_info = t_check_image($file);
        if (!$file_info) {
            portal_client_redirect('edit_portal_image', '图片必须是'.IMAGE_MAX_FILESIZE.'KB以内的GIF・JPEG・PNG文件', $tail);
        }

        $filename = sprintf('module_portal_%d.%s', time(), $file_info['format']);
        db_image_data_delete($filename);
        db_portal_delete_portal_image($filename);
        if (!admin_insert_c_image($_FILES['upfile'], $filename)) {
            portal_client_redirect('edit_portal_image', '图片无法上传', $tail);
        }

        db_portal_insert_portal_image($filename);
        portal_client_redirect('edit_portal_image', '图片已经上传', $tail);
    }
}

?>
