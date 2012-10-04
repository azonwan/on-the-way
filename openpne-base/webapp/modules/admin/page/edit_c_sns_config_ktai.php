<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_edit_c_sns_config_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        // 色設定名配列構造
        $v['bgcolor_scheme_names'] = array(
            'color_1' => '网页背景',
            'color_2' => '标题背景',
            'color_3' => '副标题背景',
            'color_4' => '个人页面内容说明背景',
            'color_5' => '目录 A 标题背景',
            'color_6' => '目录 A 背景 1',
            'color_7' => '目录 A 背景 2',
            'color_8' => '目录 B 标题背景',
            'color_9' => '目录 B 背景1',
            'color_10' => '目录 B 背景2',
            'color_11' => '段落表格线',
            'color_12' => '目录 A 表格线',
            'color_13' => '目录 B 表格线',
            'color_14' => '文字颜色',
            'color_15' => '链接文字颜色',
            'color_23' => '链接被触击时的颜色',
            'color_17' => '访问过的链接颜色',
            'color_18' => '栏目标题文字',
            'color_19' => '日期文字颜色',
            'color_20' => '「⇒」文字',
            'color_21' => '「▼」文字',
            'color_22' => '错误消息提示文字颜色',
            'color_24' => '查询部分标题背景颜色',
            'color_25' => '查询部分标题文字',
            'color_26' => '目录B标题文字',
            'color_27' => '查询部分标题背景颜色',
            'color_28' => '查询部分标题文字',
        );
        $v['c_config_color_ktai_list'] = db_etc_c_config_color_ktai_list();
        $v['c_config_color_ktai_list'][0]['caption'] = '当前设定';
        $v['c_config_color_ktai_list'][0] = util_apply_color_default2current($v['c_config_color_ktai_list'][0], 'ktai');

        $this->set($v);
        return 'success';
    }
}

?>
