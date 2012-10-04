<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// スキン画像更新
class admin_do_insert_c_image extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_c_image', array_shift($errors));
    }

    function execute($requests)
    {
        $file = $_FILES['upfile'];

        if (empty($file) || $file['error'] === UPLOAD_ERR_NO_FILE) {
            admin_client_redirect('edit_c_image', '请选择图片');
        }

        if (!t_check_image($file)) {
            admin_client_redirect('edit_c_image', '图片必须是'.IMAGE_MAX_FILESIZE.'KB以内的GIF・JPEG・PNG文件');
        }

        db_image_data_delete($requests['filename']);
        if (!admin_insert_c_image($_FILES['upfile'], $requests['filename'])) {
            admin_client_redirect('edit_c_image', '图片无法添加');
        }

        admin_client_redirect('edit_c_image', '画图片已经添加', 'filename='.$requests['filename']);
    }
}

?>
