<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 休日追加
class admin_do_insert_c_holiday extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_c_holiday', array_shift($errors));
    }

    function execute($requests)
    {
        // 月日が正しいかどうか確認する（年にはうるう年(2004)を入れておく）
        if (!checkdate($requests['month'], $requests['day'], '2004')) {
            admin_client_redirect('edit_c_holiday', '请正确输入日期');
        }

        db_admin_insert_c_holiday(
            $requests['name'],
            $requests['month'],
            $requests['day']
        );
        admin_client_redirect('edit_c_holiday', '假日已经添加');
    }
}

?>