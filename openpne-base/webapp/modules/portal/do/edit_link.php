<?php

class portal_do_edit_link extends OpenPNE_Action
{

    function execute($requests)
    {
        $link_list = array_map(array($this, '_validateParams'), $requests['link_list']);

        foreach ($link_list as $link) {
            $target_link_id = $link['id'];
            unset($link['id']);

            // いずれの項目も未入力である
            if (!$target_link_id && !$link['title'] && !$link['url']) {
                continue;
            }

            db_portal_update_portal_link($target_link_id, $link);
        }

        portal_client_redirect('edit_link', '更改链接设置');
    }

    function handleError($errors)
    {
        $msg = array_shift($errors);
        portal_client_redirect('edit_link', $msg);
    }

    function _validateParams($link)
    {
        $ini_filepath = openpne_ext_search('portal/validate/do/edit_link/link_list.ini');
        $rules = parse_ini_file($ini_filepath, true);
        $validator = new OpenPNE_Validator($rules, $link);

        // OpenPNE_Validator による検証
        if (!$validator->validate()) {
            $this->handleError($validator->getErrors());
        }

        // 独自のパラメータ検証
        $params = $validator->getParams();

        if ($params['title'] || $params['url']) {  // タイトルとURLのいずれかが入力されている
            $error = array();

            // タイトルもしくはURLのどちらかが入力されていない
            if (!$params['title']) {
                $error[] = '请输入标题';
            } elseif (!$params['url']) {
                $error[] = '请输入URL';
            }

            if (!empty($error)) {
                $this->handleError($error);
            }
        }

        return $params;
    }
}

?>
