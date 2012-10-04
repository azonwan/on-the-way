<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// スキン画像更新
class admin_do_delete_c_image extends OpenPNE_Action
{
    function execute($requests)
    {
        if (strpos($requests['filename'], 'skin_') === 0 || strpos($requests['filename'], 'no_') === 0) {
            admin_client_redirect('edit_c_image', '此图片不能删除');
        }

        db_image_data_delete($requests['filename']);
        db_admin_delete_c_image_link4image_filename($requests['filename']);

        admin_client_redirect('edit_c_image', '图片已经删除');
    }
}

?>
