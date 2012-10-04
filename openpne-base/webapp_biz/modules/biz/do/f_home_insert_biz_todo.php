<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_f_home_insert_biz_todo extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $todo = $requests['todo'];
        $id = $requests['target_id'];
        $nickname = $requests['nickname'];
        $is_all = $requests['is_all'];
        // ----------

        if (empty($todo)) {
            $p = array('msg' => '请输入内容');
            openpne_redirect('pc', 'page_h_home', $p);
        }

        biz_insertTodo($id, $todo, $u, 0, $is_all);

        $p = array('target_c_member_id' => $id);
        openpne_redirect('pc', 'page_f_home', $p);

    }
}

?>
