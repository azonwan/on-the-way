<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_com_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $name = $requests['name'];
        $c_commu_category_id = $requests['c_commu_category_id'];
        $info = $requests['info'];
        $public_flag = $requests['public_flag'];
        $err_msg = $requests['err_msg'];
        // ----------

        $form_val=array(
            'name'=>$name,
            'c_commu_category_id'=>$c_commu_category_id,
            'info'=>$info,
            'public_flag'=>$public_flag,
        );

        $this->set('inc_navi', fetch_inc_navi('h'));

        $c_commu_category_list = db_commu_c_commu_category4null();
        $this->set("c_commu_category", $c_commu_category_list);

        $public_flag_list=
        array(
        'public' =>'加入：谁都可以加入，论坛：对全体公开',
        'auth_sns' =>'加入：必须得到管理人的承认，论坛：对全体公开',
        'auth_commu_member' =>'加入：必须得到管理人的承认，论坛：只对参加者公开',
        );

        $this->set("c_commu_category_list", $c_commu_category_list);
        $this->set("public_flag_list", $public_flag_list);
        $this->set("form_val", $form_val);

        $this->set('err_msg', $err_msg);

        return 'success';
    }
}

?>
