<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_com_add_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['err_msg'] = $errors;
        openpne_forward('pc', 'page', 'h_com_add');
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $name = $requests['name'];
        $c_commu_category_id = $requests['c_commu_category_id'];
        $info = $requests['info'];
        $public_flag = $requests['public_flag'];
        // ----------
        $upfile_obj = $_FILES['image_filename'];

        //TODO:
        $err_msg = array();
        if (db_commu_is_commu4c_commu_name($name))
            $err_msg[] = '此' . WORD_COMMUNITY . '已经存在';

        if (!empty($upfile_obj) && $upfile_obj['error'] !== UPLOAD_ERR_NO_FILE) {
            if (!($image = t_check_image($upfile_obj))) {
                $err_msg[] = '图像请使用'.IMAGE_MAX_FILESIZE.'KB以内的GIF、JPEG、PNG文件';
            }
        }

        if ($err_msg) {
            $_REQUEST['err_msg'] = $err_msg;
            openpne_forward('pc', 'page', "h_com_add");
            exit;
        }
        //-----

        $this->set('inc_navi', fetch_inc_navi('h'));

        $c_commu_category_list = db_commu_c_commu_category4null();

        $public_flag_list=
        array(
        'public' =>'加入：谁都可以加入，论坛：对全体公开',
        'auth_sns' =>'加入：必须得到管理人的承认，论坛：对全体公开',
        'auth_commu_member' =>'加入：必须得到管理人的承认，论坛：只对参加者公开',
        );

        foreach ($c_commu_category_list as $each_c_commu_categfory) {
            if ($each_c_commu_categfory['c_commu_category_id']==$c_commu_category_id)$c_commu_category_value=$each_c_commu_categfory['name'];
        }
        $public_flag_value=$public_flag_list[$public_flag];

        $this->set("c_commu_category_value", $c_commu_category_value);
        $this->set("public_flag_value", $public_flag_value);

        //画像をvar/tmpフォルダにコピー
        $sessid = session_id();
        t_image_clear_tmp($sessid);
        if (file_exists($upfile_obj["tmp_name"])) {
            $tmpfile = t_image_save2tmp($upfile_obj, $sessid, "c");
        }

        $form_val = array(
            'name'=>$name,
            'c_commu_category_id'=>$c_commu_category_id,
            'info'=>$info,
            'public_flag'=>$public_flag,
            'tmpfile'=>$tmpfile,
            'image_filename' => $upfile_obj['name']
        );
        $this->set("form_val", $form_val);

        return 'success';
    }
}

?>
