<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $name = $requests['name'];
        $c_commu_category_id = $requests['c_commu_category_id'];
        $info = $requests['info'];
        $public_flag = $requests['public_flag'];
        $topic_authority = $requests['topic_authority'];
        $err_msg = $requests['err_msg'];
        // ----------

        //--- 権限チェック
        //コミュニティ管理者
        if (!db_commu_is_c_commu_admin($target_c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---

        $this->set('inc_navi', fetch_inc_navi('c', $target_c_commu_id));
        //コミュニティデータ取得
        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);
        if ($name) {
            $c_commu['name'] = $name;
        }
        if ($c_commu_category_id) {
            $c_commu['c_commu_category_id'] = $c_commu_category_id;
        }
        if ($info) {
            $c_commu['info'] = $info;
        }
        if ($public_flag) {
            $c_commu['public_flag'] = $public_flag;
        }

        $this->set('target_c_commu_id', $target_c_commu_id);

        if ($err_msg) {
            $c_commu['name'] = $name;
            $c_commu['info'] = $info;
        }

        $this->set('c_commu', $c_commu);
        $this->set('c_commu_category_list', db_commu_c_commu_category4null());
        $public_flag_list=
        array(
        'public' =>'加入：谁都可以加入，论坛：对全体公开',
        'auth_sns' =>'加入：必须得到管理人的承认，论坛：对全体公开',
        'auth_commu_member' =>'加入：必须得到管理人的承认，论坛：只对参加者公开',
        );
        $this->set('public_flag_list', $public_flag_list);
        $topic_authority_list=
        array(
            'public' =>'全体圈子参加者可以发贴',
            'admin_only' =>'只有圈子管理者可以发贴',
        );
        $this->set('topic_authority_list', $topic_authority_list);
        $this->set('is_topic', db_commu_is_topic4c_commu_id($target_c_commu_id));
        $this->set('err_msg', $err_msg);

        $this->set('is_unused_join_commu', util_is_unused_mail('m_pc_join_commu'));

        return 'success';
    }
}
?>
