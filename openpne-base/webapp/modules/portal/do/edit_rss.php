<?php

class portal_do_edit_rss extends OpenPNE_Action
{
    var $min_portal_rss_id = 1;
    var $max_portal_rss_id = 5;

    function execute($requests)
    {

        for ($i = $this->min_portal_rss_id; $i <= $this->max_portal_rss_id; $i++) {
            $url = strval($requests['rss_'.$i]);
            $name = strval($requests['rss_name_' . $i]);
            $data = array(
                'portal_rss_id' => intval($i),
                'url' => $url,
                'name' => $name,
            );

            if (db_portal_portal_rss($i)) {
                db_portal_update_portal_rss($data);
            } else {
                db_portal_insert_portal_rss($data);
            }
        }

        portal_client_redirect('edit_rss', 'RSS设定已经变更');
    }

    function handleError($errors)
    {
        $error_str = 'RSS的URL请使用半角英文输入。';
        portal_client_redirect('edit_rss', null, 'error_msg=' . urlencode($error_str));
    }

}

?>
