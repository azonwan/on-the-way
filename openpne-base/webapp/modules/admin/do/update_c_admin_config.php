<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// SNS設定変更
class admin_do_update_c_admin_config extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_c_admin_config', '请正确输入');
    }
    function execute($requests)
    {
        $config =& OpenPNE_Config::getInstance();

        if (!$requests['OPENPNE_ENABLE_KTAI'] && ($requests['IS_GET_EASY_ACCESS_ID'] == 3)) {
            admin_client_redirect('edit_c_admin_config', 'PC・手机注册时必须用手机号码注册：当选择手机号码时，必须设置“启用”');
        }
        foreach ($requests as $name => $value) {
            if (!$config->is_allowed($name)) continue;

            // 配列の場合はカンマ区切りに
            if (is_array($value)) {
                $value = implode(',', $value);
            }

            if (is_null(db_admin_c_admin_config4name($name))) {
                db_admin_insert_c_admin_config($name, $value);
            } else {
                db_admin_update_c_admin_config($name, $value);
            }
        }

        admin_client_redirect('edit_c_admin_config', '设定已经变更');
    }
}

?>
