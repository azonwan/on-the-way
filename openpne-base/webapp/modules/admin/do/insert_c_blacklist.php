<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_insert_c_blacklist extends OpenPNE_Action
{
    function handleError($errors)
    {
        $tail = array('info' => $this->requests['info'], 'easy_access_id' => $this->requests['easy_access_id']);
        admin_client_redirect('blacklist_add', array_shift($errors), $tail);
    }

    function execute($requests)
    {
        if (db_member_easy_access_id_is_blacklist($requests['easy_access_id'])) {
            admin_client_redirect('blacklist_add', '该手机号码（已加密）已注册');
        }

        if (db_admin_insert_c_blacklist($requests['easy_access_id'], $requests['info'])) {
            admin_client_redirect('blacklist', '已经添加到黑名单');
        } else {
            admin_client_redirect('blacklist', '不能添加到黑名单');
        }
    }
}

?>
