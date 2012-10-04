<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_ri extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        $target_c_member_id = $requests['c_member_id'];
        $_REQUEST['target_c_member_id'] = $target_c_member_id;
        openpne_forward('pc', 'page', 'o_regist_intro');
        exit;
    }
}

?>
