<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once OPENPNE_MODULES_DIR . '/admin/lib/db_admin.php';

class pc_page_o_free_page extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        $c_free_page = db_admin_get_c_free_page_one($requests['c_free_page_id']);
        //フリーページが存在しない
        if (!$c_free_page) {
            $p = array('msg' => "被指定的自由页面不存在");
            openpne_redirect('pc', 'page_o_err_free_page', $p);
        }

        //フリーページが認証あり用
        if ($c_free_page['auth']) {
            $p = array('c_free_page_id' => $requests['c_free_page_id']);
            openpne_redirect('pc', 'page_h_free_page', $p);
        }

        //フリーページが携帯用
        if ($c_free_page['type'] == "ktai") {
            $p = array('msg' => "被指定的自由页面为手机专用，请用手机浏览");
            openpne_redirect('pc', 'page_o_err_free_page', $p);
        }

        $this->set('INC_HEADER_title', $c_free_page['title']);
        $this->set('inc_page_header', fetch_inc_page_header('public'));
        $this->set("c_free_page", $c_free_page);
        return 'success';
    }
}

?>
