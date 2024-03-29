<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 小カテゴリ編集
class admin_do_update_c_commu_category extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_category', '小类别无法编辑');
    }

    function execute($requests)
    {
        db_admin_update_c_commu_category(
            $requests['c_commu_category_id'],
            $requests['name'],
            $requests['sort_order']);

        admin_client_redirect('edit_category', '小类别已经编辑');
    }
}

?>
