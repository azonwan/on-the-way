<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_config_password_query extends OpenPNE_Action
{
    function execute($requests)
    {
        //外部認証の場合はリダイレクト
        check_action4pne_slave(true);

        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        $this->set('password_query_list', p_common_c_password_query4null());
        return 'success';
    }
}

?>
