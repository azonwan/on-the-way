<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メンバー情報一括登録
class admin_do_import_c_member extends OpenPNE_Action
{
    function handleError($msg)
    {
        admin_client_redirect('import_c_member', $msg);
    }

    function execute($requests)
    {
        $member_file = $_FILES['member_file'];

        $limit = 1000;  // 行数制限

        if (empty($member_file) || $member_file['error'] === UPLOAD_ERR_NO_FILE) {
            $this->handleError('请选择文件');
        }

        $filename_parts = explode('.', $member_file['name']);
        if (array_pop($filename_parts) != 'csv') {
            $this->handleError('请延长.csv');
        }

        $handle = fopen($member_file['tmp_name'], 'r');

        if (($data = fgetcsv($handle, 4096)) === false) {
            $this->handleError('该文件的内容是空的');
        }

        $required_list = array('nickname', 'mail_address', 'password');
        if (OPENPNE_AUTH_MODE == 'pneid') {
            $required_list[] = 'login_id';
        }
        foreach ($required_list as $required) {
            if (!in_array($required, $data)) {
                $this->handleError('第一行: ' . $required . '必须填写');
            }
        }

        $title = array();
        foreach ($data as $key => $value) {
            $matches = array();
            if (preg_match('/^profile\[(.*)\]$/', $value, $matches)) {
                $is_profile = true;
                $name = $matches[1];
                $c_profile = db_member_c_profile4name($name);
            } else {
                $is_profile = false;
                $name = $value;
                $c_profile = null;
            }

            $title[$key] = array(
                'is_profile' => $is_profile,
                'name'       => $name,
                'c_profile'  => $c_profile,
            );
        }

        $row = 1; // 1行目がタイトル行
        $count = 0; // メンバー登録に成功した数

        while (($data = fgetcsv($handle, 4096)) !== false && $row <= $limit) {
            $row++;

            $data_member = array();
            $data_profile = array();

            foreach ($data as $key => $value) {
                if (empty($title[$key])) {
                    continue;
                }
                $name = $title[$key]['name'];
                if ($title[$key]['is_profile']) {
                    if ($title[$key]['c_profile']['form_type'] === 'checkbox') {
                        $data_profile[$name] = explode(',', $value);
                    } else {
                        $data_profile[$name] = $value;
                    }
                } else {
                    $data_member[$name] = $value;
                }
            }

            if (is_ktai_mail_address($data_member['mail_address'])) {
                $data_member['mail_address'] = str_replace('"', '', $data_member['mail_address']);
            }

            // validate
            $errors = array();

            $validator = new OpenPNE_Validator();
            $validator->addRequests($data_member);
            $validator->addRules($this->_getValidateRules());
            if (!$validator->validate()) {
                $errors = array_merge($errors, $validator->getErrors());
            }
            $member = $validator->getParams();

            // mail_address
            if (!db_common_is_mailaddress($member['mail_address'])) {
                $errors[] = "电子邮件地址 [{$member['mail_address']}] 的地址不正确";
            } elseif (db_member_is_sns_join4mail_address($member['mail_address'])) {
                $errors[] = "电子邮件地址 [{$member['mail_address']}] 已经注册";
            } elseif (!db_member_is_limit_domain4mail_address($member['mail_address'])) {
                $errors[] = "电子邮件地址 [{$member['mail_address']}] 不能注册";
            }

            // login_id
            if (OPENPNE_AUTH_MODE == 'pneid') {
                if (db_member_c_member_id4username($member['login_id'])) {
                    $errors[] = "注册ID［{$member['login_id']}］已经注册";
                }
            }

            // 生年月日のチェック
            if ($member['birth_year'] || $member['birth_month'] || $member['birth_day']) {
                if (!t_checkdate($member['birth_month'], $member['birth_day'], $member['birth_year'])) {
                    $errors[] = '请输入正确的出生日期';
                } elseif (t_isFutureDate($member['birth_day'], $member['birth_month'], $member['birth_year'])) {
                    $errors[] = '您无法设置今天以后的出生日期';
                }
            }

            if ($errors) {
                $this->handleError("{$row}行：" . array_shift($errors));
            }

            // profile
            $c_member_profile = db_member_check_profile($data_profile, array());

            // register

            // メールアドレスが携帯メールアドレスのドメインの場合は、
            // 携帯メールアドレスとして登録する
            if (is_ktai_mail_address($member['mail_address'])) {
                $ktai_address = $member['mail_address'];
                $pc_address   = '';
            } else {
                $ktai_address = '';
                $pc_address   = $member['mail_address'];
            }

            $c_member = array(
                'nickname' => $member['nickname'],
                'birth_year' => $member['birth_year'],
                'birth_month' => $member['birth_month'],
                'birth_day' => $member['birth_day'],
                'c_password_query_id' => 0,
                'c_member_id_invite' => 1,
                'is_receive_mail' => 1,
                'is_receive_ktai_mail' => 1,
                'is_receive_daily_news' => 1,
                'public_flag_birth_year' => $member['public_flag_birth_year'],
                'public_flag_birth_month_day' => $member['public_flag_birth_month_day'],
            );

            if (OPENPNE_AUTH_MODE == 'pneid') {
                $c_member['login_id'] = $member['login_id'];
            }

            $c_member_secure = array(
                'password' => $member['password'],
                'pc_address' => $pc_address,
                'ktai_address' => $ktai_address,
                'regist_address' => $member['mail_address'],
            );

            if (!util_regist_c_member($c_member, $c_member_secure, $c_member_profile)) {
                $this->handleError("{$row}行：成员登录失败");
            }
            $count++;
        }
        fclose($handle);

        admin_client_redirect('import_c_member', "{$count}件のインポートが完了しました");
    }

    function _getValidateRules()
    {
        $rules = array(
            'nickname' => array(
                'type' => 'string',
                'required' => '1',
                'caption' => WORD_NICKNAME,
                'max' => '40',
            ),
            'mail_address' => array(
                'type' => 'string',
                'required' => '1',
                'caption' => '电子邮件地址',
            ),
            'password' => array(
                'type' => 'regexp',
                'regexp' => '/^[a-z0-9]{6,12}$/i',
                'required' => '1',
                'caption' => '密码',
                'type_error' => '密码请输入6～12个半脚英文字母、数字',
            ),
            'birth_year' => array(
                'type' => 'int',
                'caption' => '年',
                'min' => '1901',
                'default' => '0',
            ),
            'birth_month' => array(
                'type' => 'int',
                'caption' => '月',
                'min' => '1',
                'max' => '12',
                'default' => '0',
            ),
            'birth_day' => array(
                'type' => 'int',
                'caption' => '日',
                'min' => '1',
                'max' => '31',
                'default' => '0',
            ),
            'public_flag_birth_year' => array(
                'type' => 'regexp',
                'regexp' => '/^(public|friend|private)$/',
                'caption' => '出生年的公开范围',
                'default' => 'public',
            ),
            'public_flag_birth_month_day' => array(
                'type' => 'regexp',
                'regexp' => '/^(public|friend|private)$/',
                'caption' => '生日的公开范围',
                'default' => 'public',
            ),
        );
        if (OPENPNE_AUTH_MODE == 'pneid') {
            $rules['login_id'] = array(
                'type' => 'regexp',
                'regexp' => '/^[a-z0-9][a-z0-9\-_]+[a-z0-9]$/i',
                'required' => '1',
                'caption' => '注册的ID',
                'regexp_error' => '注册的ID请输入4～30个半脚英文字母、数字',
            );
        }
        return $rules;
    }
}

?>
