<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 招待メールドメイン制限設定の更新
class admin_do_update_limit_domain extends OpenPNE_Action
{
    function execute($requests)
    {
        $config =& OpenPNE_Config::getInstance();

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

        admin_client_redirect('limit_domain', '邀请函区域限制设定已经更新');
    }
}

?>
