<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// c_sns_config を編集
class admin_page_edit_c_sns_config extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        // 色設定名配列構造
        $v['bgcolor_scheme_names'] = array(
            'color_5' => '线的颜色',
            'color_16' => '页面背景',
            'color_17' => '内容区域背景',
            'color_4' => '线框颜色',
            'color_10' => '导航条背景',
            'color_13' => '说明区域背景',
            'color_6' => '框内背景',
            'color_14' => '左边菜单栏颜色',
        );
        $v['c_config_color_list'] = db_etc_c_config_color_list();
        $v['c_config_color_list'][0]['caption'] = '当前设置';
        $v['c_config_color_list'][0] = util_apply_color_default2current($v['c_config_color_list'][0]);
        $v['inc_custom_css'] = p_common_c_siteadmin4target_pagename('inc_custom_css');

        $this->set($v);
        return 'success';
    }
}

?>
