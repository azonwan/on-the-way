<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_csv_member extends OpenPNE_Action
{
    function isSecure()
    {
        session_cache_limiter('public');
        return true;
    }

    function handleError($errors)
    {
        admin_client_redirect('csv_download', array_shift($errors));
    }

    function execute($requests)
    {
        $start_id = $requests['start_id'];
        $end_id = $requests['end_id'];
        $allflag = $requests['allflag'];

        $errors = array();
        if (!$allflag && ($start_id < 1 || $end_id < 1)) {
            $errors[] = '範囲指定のメンバーIDは1以上の整数値で入力してください';
        }
        if (!$allflag && $start_id > $end_id) {
            $errors[] = '開始メンバーIDは終了メンバーIDより大きい値で入力してください。';
        }
        if ($errors) {
            $this->handleError($errors);
        }

        $member_key_string = $this->get_key_list();
        $c_member_list = $this->db_get_c_member_list($start_id, $end_id);
        if (!$c_member_list) {
            $this->handleError(array('該当するメンバーの情報がありません。'));
        }
        $member_csv_data = $this->create_csv_data($member_key_string, $c_member_list);

        send_nocache_headers(true);
        header("Content-Type: application/octet-stream");
        header("Content-Disposition: attachment; filename=member.csv");
        echo $member_csv_data;
        exit;
    }

    /**
     * メンバーリスト取得
     */
    function db_get_c_member_list($start_id, $end_id)
    {
        $params = array();
        $sql = 'SELECT c_member_id FROM c_member';
        $wheres = array();
        if ($start_id > 1) {
            $wheres[] = 'c_member_id >= ?';
            $params[] = $start_id;
        }
        if ($end_id > 0) {
            $wheres[] = 'c_member_id <= ?';
            $params[] = $end_id;
        }
        if ($wheres) {
            $where = ' WHERE ' . implode(' AND ', $wheres);
        } else {
            $where = '';
        }
        $sql .= $where;
        $sql .= ' ORDER BY c_member_id';
        $ids = db_get_col($sql, $params);

        $c_member_list = array();
        foreach ($ids as $id) {
            $tmp_c_member = array();
            $_tmp_c_member = db_member_c_member4c_member_id($id, false, false, 'private');

            $tmp_c_member['c_member_id'] = $_tmp_c_member['c_member_id'];
            $tmp_c_member['nickname'] = $_tmp_c_member['nickname'];
            if (OPENPNE_USE_POINT_RANK) {
                $tmp_c_member['rank'] = '';
                $tmp_c_member['PNE_POINT'] = '';
            }
            $tmp_c_member['access_date'] = $_tmp_c_member['access_date'];
            $tmp_c_member['r_date'] = $_tmp_c_member['r_date'];
            $tmp_c_member['c_member_id_invite'] = $_tmp_c_member['c_member_id_invite'];
            $tmp_c_member['image_filename_1'] = $_tmp_c_member['image_filename_1'];
            $tmp_c_member['image_filename_2'] = $_tmp_c_member['image_filename_2'];
            $tmp_c_member['image_filename_3'] = $_tmp_c_member['image_filename_3'];
            $tmp_c_member['birth_year'] = $_tmp_c_member['birth_year'];
            $tmp_c_member['birth_month'] = $_tmp_c_member['birth_month'];
            $tmp_c_member['birth_day'] = $_tmp_c_member['birth_day'];

            $tmp_profile_list = db_member_c_member_profile_list4c_member_id($id, 'private');
            $c_profile_list = db_member_c_profile_list4null();
            foreach ($c_profile_list as $key => $tmp_profile) {
                if (is_array($tmp_profile_list[$tmp_profile['name']]['value'])){
                    foreach ($tmp_profile_list[$tmp_profile['name']]['value'] as $itm){
                        $tmp_c_member[$tmp_profile['name']] .= $itm . " ";
                    }
                } else {
                    $tmp_c_member[$tmp_profile['name']] = $tmp_profile_list[$tmp_profile['name']]['value'];
                }
            }
            if (OPENPNE_USE_POINT_RANK) {
                if (!OPENPNE_IS_POINT_ADMIN && $id == 1) {
                    $tmp_c_member['PNE_POINT'] = '-';
                    $tmp_c_member['rank'] = '-';
                } else {
                    $tmp_c_member['PNE_POINT'] = (int)$tmp_c_member['PNE_POINT'];
                    $rank = db_point_get_rank4point($tmp_c_member['PNE_POINT']);
                    $tmp_c_member['rank'] = $rank['name'];
                }
            } else {
                unset($tmp_c_member['PNE_POINT']);
            }

            $tmp_secure = db_member_c_member_secure4c_member_id($id);
            $tmp_c_member['pc_address'] = $tmp_secure['pc_address'];
            $tmp_c_member['ktai_address'] = $tmp_secure['ktai_address'];
            $tmp_c_member['regist_address'] = $tmp_secure['regist_address'];

            $c_member_list[]=$tmp_c_member;
        }

        return $c_member_list;
    }

    function get_key_list()
    {
        $c_profile_list = db_member_c_profile_list4null();

        $ley_list[]="成员ID";
        $ley_list[]=WORD_NICKNAME;
        if (OPENPNE_USE_POINT_RANK) {
            $ley_list[] = '头衔';
            $ley_list[] = '积分';
        }
        $ley_list[]="上次登录";
        $ley_list[]="登录日期";
        $ley_list[]="邀请者ID";
        $ley_list[]="图片1";
        $ley_list[]="图片2";
        $ley_list[]="图片3";
        $ley_list[]="年";
        $ley_list[]="月";
        $ley_list[]="日";
        foreach ($c_profile_list as $profile) {
            if ($profile['name'] != 'PNE_POINT') {
                $ley_list[]= $profile['caption'];
            }
        }
        $ley_list[]="PC邮件地址";
        $ley_list[]="手机邮件地址";
        $ley_list[]="登录时邮件地址";

        return $ley_list;
    }

    function create_csv_data($key_string, $value_list)
    {
        $csv = "";
        foreach ($key_string as $each_key) {
            if ($csv != "") {
                $csv .= ",";
            }
            $csv .= '"' . mb_convert_encoding($each_key, 'SJIS', 'UTF-8') . '"';
        }
        $csv .= "\n";

        foreach ($value_list as $key => $value) {
            $temp = "";
            foreach ($value as $key2 => $value2) {
                $value2 = mb_convert_encoding($value2, 'SJIS', 'UTF-8');
                if ($value2 != null) $value2 = str_replace('"', '""', $value2);//クォート
                if ($value2 != null) $value2 = str_replace("\r","",$value2);//改行コードを変換
                $temp .= '"' . $value2 . '",';
            }
            $csv .= $temp . "\n";
        }
        return $csv;
    }
}

?>
