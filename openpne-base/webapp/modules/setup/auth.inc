<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// c_admin_user に既にデータがあった場合は無効
if (db_admin_user_exists($sql)) {
    openpne_display_error('已经安装完毕 ');
}

?>
