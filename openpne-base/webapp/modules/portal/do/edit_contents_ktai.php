<?php
class portal_do_edit_contents_ktai extends OpenPNE_Action
{
    var $layout_keys = array(
        PORTAL_LAYOUT_FREE1,
        PORTAL_LAYOUT_FREE2,
        PORTAL_LAYOUT_FREE3,
        PORTAL_LAYOUT_FREE4,
    );


    function execute($requests)
    {
        // 選択肢に重複位置がないかどうかチェック
        if (!$this->validate_position($requests)) {
            $error_str = '同样的内容不能在相同地方（号码）显示。';
            portal_client_redirect('edit_contents_ktai', null, 'error_msg=' . urlencode($error_str));
        }

        // portal_layout position
        db_portal_truncate_portal_layout_ktai();

        foreach ($this->layout_keys as $key) {
            $value = $requests[$key];
            if ($value != PORTAL_LAYOUT_NOUSE) {
                db_portal_insert_portal_layout_ktai($key, $value);
            }
        }

        portal_client_redirect('edit_contents_ktai', '更改内容');
    }

    function validate_position($requests)
    {
        $tmp = array();

        foreach ($this->layout_keys as $key) {
            $value = $requests[$key];
            if (($value != PORTAL_LAYOUT_NOUSE ) and (array_key_exists($value ,$tmp))) {
                return false;
            }
            $tmp[$value] = $key;
        }

        return true;
    }

}

?>
