<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_img_insert_dialog extends OpenPNE_Action
{
    function execute()
    {
        $view =& $this->getView();
        $view->ext_display('h_img_insert_dialog.tpl');
        exit;
    }
}
?>