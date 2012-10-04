<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_home_edit_biz_todo extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $id = $requests['id'];
        $is_check = $requests['is_check'];
        $writer_name = $requests['writer_name'];
        $sort_order = $requests['sort_order'];
        $writer_id = $requests['writer_id'];
        $memo = $requests['memo'];
        $is_done = $requests['is_done'];
        $due_year = $requests['due_year'];
        $due_month = $requests['due_month'];
        $due_day = $requests['due_day'];
        $priority = $requests['priority'];
        $biz_group_id = $requests['biz_group_id'];
        $public_flag = $requests['public_flag'];
        // ----------

        if (!biz_isPermissionTodo($u, $id)) {
            handle_kengen_error();
        }

        if (empty($memo)) {
            $_REQUEST['msg'] = '请输入内容';
            openpne_forward('biz', 'page', 'fh_home_edit_biz_todo');
            exit;
        }

        if (!$biz_group_id && $public_flag == 'group') {
            $_REQUEST['msg'] = '请确认要公开的团队对象';
            openpne_forward('biz', 'page', 'fh_home_edit_biz_todo');
            exit;
        }

        $member_info = db_member_c_member4c_member_id_LIGHT($writer_id);

        $todo_info = biz_getTodo($id);

        $due_datetime = $due_year . '-' . $due_month . '-' . $due_day . ' 00:00:00';
        if(!$todo_info['c_member_id'] && !$is_check) {
            $todo_info['c_member_id'] = $writer_id;
        }

        biz_editTodo($todo_info['c_member_id'], $memo, $writer_id, $sort_order, $is_check, $id,
            $is_done, $due_datetime, $priority, $biz_group_id, $public_flag);

        openpne_redirect('pc', 'page_h_home');
    }
}

?>
