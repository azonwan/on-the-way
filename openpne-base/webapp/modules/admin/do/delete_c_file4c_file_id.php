<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// ファイル削除
class admin_do_delete_c_file4c_file_id extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_FILEUPLOAD) {
            admin_client_redirect('top', '该网页无法使用');
        }

        $c_file = db_file_c_file4c_file_id($requests['target_c_file_id']);
        if (!$c_file) {
            admin_client_redirect('top', '该文件不存在');
        }

        db_file_delete_c_file($c_file['filename']);
        db_admin_delete_c_file_link4filename($c_file['filename']);

        admin_client_redirect('list_c_file', '文件已经删除');
    }
}

?>
