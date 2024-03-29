<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// プロフィール項目追加
class admin_do_insert_c_profile extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('insert_c_profile', array_shift($errors));
    }

    function execute($requests)
    {
        if (db_admin_c_profile_name_exists($requests['name'])) {
            admin_client_redirect('insert_c_profile', '这个名称已经注册');
        }
        if (is_numeric($requests['name'])) {
            admin_client_redirect('insert_c_profile', '识别名不能只设定成数字');
        }

        db_admin_insert_c_profile(
            $requests['name'],
            $requests['caption'],
            $requests['info'],
            $requests['is_required'],
            $requests['public_flag_edit'],
            $requests['public_flag_default'],
            $requests['form_type'],
            $requests['sort_order'],
            $requests['disp_regist'],
            $requests['disp_config'],
            $requests['disp_search'],
            $requests['val_type'],
            $requests['val_regexp'],
            $requests['val_min'],
            $requests['val_max']);

        admin_client_redirect('edit_c_profile', '配置文件已经设置');
    }
}

?>
