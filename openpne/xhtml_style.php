<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';
require_once 'smarty_plugins/function.t_img_url_skin.php';

$custom_css = p_common_c_siteadmin4target_pagename('inc_custom_css');
$decoration_config = db_decoration_enable_list();
$old_colors = util_get_color_config();
$colors = array(
    1 => $old_colors['bg_01'], // 1. 线的颜色
    2 => $old_colors['bg_12'], // 2. 页面背景
    3 => $old_colors['bg_13'], // 3. 内容区域背景
    4 => $old_colors['bg_00'], // 4. 线框颜色
    5 => $old_colors['bg_06'], // 5. 导航条背景
    6 => $old_colors['bg_09'], // 6. 说明区域背景
    7 => $old_colors['bg_02'], // 7. 框内背景
    8 => $old_colors['bg_10'], // 8. 左边菜单栏颜色
);

function getSkin($name)
{
    $params['filename'] = $name;
    return smarty_function_t_img_url_skin($params, $dummy);
}

header('Content-Type: text/css');

header('Cache-Control: max-age=315360000');
header('Expires: ' . gmdate('D, d M Y H:i:s', strtotime('+10 years')) . ' GMT');
?>
@charset "UTF-8";

/*==============================================================================
 * 默认样式表
 *----------------------------------------------------------------------------*/
body, div, p, pre, blockquote, th, td,
dl, dt, dd, ul, ol, li,
h1, h2, h3, h4, h5, h6,
iframe, object, embed {
	margin: 0;
	padding: 0;
	border: none;
	text-align: left;
}
ul, ol {
	list-style-position: outside;
	list-style-type: none;
}
table {
	border-collapse: separate;
	border-spacing: 0;
	empty-cells: show;
	margin: 0;
	font-size: 1em;
}
* {
	word-break: break-all;
}
*:first-child+html table {
	border-collapse: collapse;
}
* html table {
	border-collapse: collapse;
}
th, td {
	vertical-align: middle;
}
address, cite, caption, th, del, ins,
abbr, acronym, dfn, em, strong,
code, kbd, samp, var {
	border: none;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	text-align: left;
	text-decoration: none;
}
img {
	border: none;
	vertical-align: baseline;
}
a img {
	vertical-align: text-bottom;
}
* html a img {
	vertical-align: baseline;
}
br {
	letter-spacing: 0;
}
h1, h2, h3, h4, h5, h6 {
	font-size: 100%;
	font-weight: normal;
}
q:before, q:after {
	content: "";
}
form, fieldset, input, textarea {
	margin: 0;
}
form, fieldset {
	padding: 0;
}
fieldset {
	border: none;
}
form p {
	margin: 0;
	padding: 0;
}

/*==============================================================================
 * OpenPNE全共通指定
 *----------------------------------------------------------------------------*/
body {
	font: normal normal normal 10pt/1.2 Arial,Helvetica,sans-serif; 
	}
input,
textarea,
select {
	color: #333333;
	font-size: inherit;
	font: normal normal normal 10pt/1.2 Arial,Helvetica,sans-serif; 
}
a:link {
	color: #026cd1; TEXT-DECORATION:None
}
a:visited {
	color: #004a95; TEXT-DECORATION:None
}
a:hover, a:active {
	color: #76afe6; TEXT-DECORATION:None
}
.input_text,
.input_password,
textarea {
	background-color: #f8f8f8;
}
.input_text,
.input_password,
textarea,
select {
	border: 1px solid #888888;
}
.input_image {
	border: none;
}
p {
	overflow: hidden;
}
strong {
	font-weight: bold;
}
/*----------------------------------------------
 * 表格
 *--------------------------------------------*/
div.parts table {
	table-layout: fixed;
	width: 100%;
}
div.parts th,
div.parts td {
	overflow: hidden;
	border-width: 1px 0 0 1px;
	border-style: solid;
	border-color: #<?php echo $colors[1]; ?>;
}
div.parts tr th:first-child,
div.parts tr td:first-child,
div.parts tr th.first-child,
div.parts tr td.first-child {
	border-left-width: 0;
}
/*----------------------------------------------
 * 文字链接
 *--------------------------------------------*/
ul.moreInfo li {
	padding: 2px 0 2px 20px;
	background: url(<?php echo getSkin('icon_arrow_1'); ?>) no-repeat 0 0.4em;
}
ul.moreInfo.button li {
	padding: 0;
	background: none;
}
ul.moreInfo.button li form {
	display: inline;
}
ul.moreInfo.button li form .input_submit {
	margin: 0 5px;
}
/*----------------------------------------------
 * 
 *--------------------------------------------*/
.input_submit {
	border: 1px solid #888888;
	background: #dadce6 url(<?php echo getSkin('bg_button'); ?>) repeat-x scroll 50% 0;
	letter-spacing: 0;
}
.input_file {
	background: none;
}
/*----------------------------------------------
 * 单选按钮
 *--------------------------------------------*/
.input_checkbox,
.input_radio {
	width: 16px;
}
ul.check {
	line-height: 1.4;
}
ul.check .input_radio,
ul.check .input_checkbox {
	margin: 0 4px;
}
/*----------------------------------------------
 * 画像置換指定
 *--------------------------------------------*/
#globalNav a,
#globalNavBefore a,
.localNav a {
	display: block;
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	border: none;
	text-indent: -9999px;
	text-decoration: none;
}
#globalNav a:focus,
#globalNavBefore a:focus,
.localNav a:focus {
	overflow: hidden;
}
/*----------------------------------------------
 * clearfix, overflow: hidden
 *--------------------------------------------*/
div#LayoutA,
div#LayoutB,
div#LayoutC {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
	margin-bottom: 10px;
}
#Left,
#Center,
#Top {
	overflow: hidden;
}

/*----------------------------------------------
 * 基本布局
 *--------------------------------------------*/
#Container {
	position: relative;
	width: 720px;
	margin-left: auto; 
	margin-right: auto;
	border:0px solid #666;
}
#Header {
	position: relative;
}
#topBanner {
	position: absolute;
	top: 2px;
	left: 230px;
	width: 468px;
	height: 60px;
}
#Top {
	padding-left: 5px;
}
#Top .infoBox,
#Top .descriptionBox {
	margin-right: 20px;
	margin-left: 20px;
}
#LayoutA #Left {
	float: left;
	width: 270px;
	padding: 0 5px;
}
#LayoutA #Center {
	float: right;
	width: 440px;
}
#LayoutB #Left {
	float: left;
	width: 180px;
}
#LayoutB #Center {
	float: right;
	width: 540px;
}
#LayoutC #Center {
	width: 650px;
	margin: 0 auto;
}
#Footer {
	width: 720px;
	height: 21px;
	background: url(<?php echo getSkin('skin_footer'); ?>) repeat;
}
#Footer p {
	padding-right: 12px;
	line-height: 21px;
	text-align: right;
}
#sideBanner {
	position: absolute;
	top: 0px;
	left: 720px;
	width: 230px;
}
*:first-child+html #pc_page_h_diary_add #Footer,
*:first-child+html #pc_page_h_diary_edit #Footer {
	margin-top: 10px;
}
* html #pc_page_h_diary_add #Footer,
* html #pc_page_h_diary_edit #Footer {
	margin-top: 10px;
}
/*----------------------------------------------
 * 线
 *--------------------------------------------*/
div.dparts,
div.dparts div.parts,
div.ditem,
#LayoutA #Left div.parts {
	border: 1px solid #<?php echo $colors[1]; ?>;
}
div.ditem div.item {
	border-width: 0 1px 1px;
	border-style: solid;
	border-color: #<?php echo $colors[1]; ?>;
}
div.dparts {
	margin: 0 auto 10px;
	padding: 7px;
}
div.dparts div.parts {
	margin: 0;
}
div.parts {
	margin: 0 auto 10px;
}
div.ditem {
	padding: 5px 6px;
}
/*----------------------------------------------
 * 小图标
 *--------------------------------------------*/
.partsHeading {
	overflow: hidden;
	padding: 4px 0 4px 16px;
	background: url(<?php echo getSkin('bg_heading11'); ?>) no-repeat 0 0;
	text-align: left;
	font-size: 12px;
}
#LayoutA #Left .partsHeading {
	padding-left: 14px;
	background-image: url(<?php echo getSkin('bg_heading11'); ?>);no-repeat 0 0;
}
.partsHeading h3 {
	display: inline;
	font-weight: bold;
}
.partsHeading p {
	display: inline;
	margin-left: 0.5em;
}
/*----------------------------------------------
 * 涉及到较多内容显示部分的样式（1表示1件～20件）
 *--------------------------------------------*/
div.block,
div.partsInfo,
div.pagerAbsolute,
div.pagerRelative,
div.pagerRelativeMulti,
div.operation {
	border-top: 1px solid #<?php echo $colors[1]; ?>;
}
div.partsInfo {
	padding: 10px 40px;
}
div.pagerAbsolute {
	padding: 4px;
	text-align: center;
}
div.pagerAbsolute p {
	display: inline;
}
div.pagerRelative {
	padding: 4px;
	text-align: right;
}
div.pagerRelativeMulti {
	padding: 4px;
}
div.pagerRelative p,
div.pagerRelativeMulti div.pager p {
	display: inline;
	margin-left: 10px;
}
div.pagerRelativeMulti {
	zoom: 1;
	position: relative;
}
div.pagerRelativeMulti div.pager {
	position: absolute;
	top: 1em;
	right: 4px;
}
div.operation {
	padding: 4px;
}
div.operation ul.moreInfo {
	text-align: center;
}
div.operation ul.moreInfo li {
	display: inline;
	background-position: 0 50%;
}
/*----------------------------------------------
 * 写日记时左侧日历样式
 *--------------------------------------------*/
.sideNav .calendar td,
.sideNav .calendar td * {
	word-break: normal;
	letter-spacing: -1px;
}
#Body .calendar .holiday,
.calendar .sun {
	color: #d92c49;
}
.calendar .sat {
	color: #2c65d9;
}

/*==============================================================================
 * h系、f系、c系导航条样式表（localNav）
 *----------------------------------------------------------------------------*/
#globalNav,
#globalNavBefore {
	zoom: 1;
	position: relative;
	width: 720px;
}
#globalNav {
	height: 98px;
	background: url(<?php echo getSkin('skin_after_header'); ?>) 0 0 no-repeat;
}
#globalNavBefore {
	height: 125px;
	margin-bottom: 10px;
	background: url(<?php echo getSkin('skin_before_header'); ?>) 0 0 no-repeat;
}
.localNav {
	zoom: 1;
	position: relative;
	width: 720px;
	height: 37px;
}
#hLocalNav {
	background: url(<?php echo getSkin('skin_navi_h'); ?>) 0 0 no-repeat;
}
#fLocalNav {
	background: url(<?php echo getSkin('skin_navi_f'); ?>) 0 0 no-repeat;
}
#cLocalNav {
	background: url(<?php echo getSkin('skin_navi_c'); ?>) 0 0 no-repeat;
}
<?php if (OPENPNE_ENABLE_ROLLOVER): ?>
#globalNav li a:hover, #globalNav li a:active {
	background-image: url(<?php echo getSkin('skin_after_header_2'); ?>);
}
#hLocalNav li a:hover, #hLocalNav li a:active {
	background-image: url(<?php echo getSkin('skin_navi_h_2'); ?>);
}
#fLocalNav li a:hover, #fLocalNav li a:active {
	background-image: url(<?php echo getSkin('skin_navi_f_2'); ?>);
}
#cLocalNav li a:hover, #cLocalNav li a:active {
	background-image: url(<?php echo getSkin('skin_navi_c_2'); ?>);
}
<?php endif; ?>
/*==============================================================================
 * globalNav h1为网站header导航条左上角logo部分的CSS
 *----------------------------------------------------------------------------*/
#globalNav h1,
#globalNavBefore h1 {
	position: absolute;
	top: 2px;
	left: 0;
	width:  80px;
	height: 50px;
}
#globalNav li, .localNav li {
	position: absolute;
}

li#globalNav_1 { left: 182px; width: 54px; height: 27px;top: 72px;}
li#globalNav_2 { left: 260px; width: 54px; height: 27px;top: 72px;}
li#globalNav_3 { left: 338px; width: 54px; height: 27px;top: 72px;}
li#globalNav_4 { left: 416px; width: 54px; height: 27px;top: 72px;}
li#globalNav_5 { left: 0px; width: 107px; height: 64px;top: 0px;}
li#globalNav_9 { left: 704px; width: 16px; height: 17px;top: 45px;}

li#globalNav_1 a:hover, li#globalNav_1 a:active { background-position: -182px -72px; }
li#globalNav_2 a:hover, li#globalNav_2 a:active { background-position: -260px -72px; }
li#globalNav_3 a:hover, li#globalNav_3 a:active { background-position: -338px -72px; }
li#globalNav_4 a:hover, li#globalNav_4 a:active { background-position: -416px -72px; }
li#globalNav_5 a:hover, li#globalNav_5 a:active { background-position: -0px -0px;}
li#globalNav_9 a:hover, li#globalNav_9 a:active { background-position:  -704px -45px; }


#hLocalNav li {
	top: 0;
	height: 37px;
}
li#hLocalNav_1 { left: 29px;  width: 55px; }
li#hLocalNav_2 { left: 105px;  width: 55px;}
li#hLocalNav_3 { left: 184px; width: 55px;}
li#hLocalNav_4 { left: 264px; width: 56px;}
li#hLocalNav_5 { left: 339px; width: 56px;}
li#hLocalNav_6 { left: 418px; width: 56px;}
li#hLocalNav_7 { left: 499px; width: 62px;}
li#hLocalNav_8 { left: 580px; width: 55px;}

li#hLocalNav_1 a:hover, li#hLocalNav_1 a:active { background-position: -29px -0px; }
li#hLocalNav_2 a:hover, li#hLocalNav_2 a:active { background-position: -105px -0px; }
li#hLocalNav_3 a:hover, li#hLocalNav_3 a:active { background-position: -184px -0px; }
li#hLocalNav_4 a:hover, li#hLocalNav_4 a:active { background-position: -264px -0px; }
li#hLocalNav_5 a:hover, li#hLocalNav_5 a:active { background-position: -339px -0px; }
li#hLocalNav_6 a:hover, li#hLocalNav_6 a:active { background-position: -418px -0px; }
li#hLocalNav_7 a:hover, li#hLocalNav_7 a:active { background-position: -499px -0px; }
li#hLocalNav_8 a:hover, li#hLocalNav_8 a:active { background-position: -580px -0px; }


#fLocalNav li {
	top: 0;
	height: 37px;
}
li#fLocalNav_1 { left: 115px; width: 62px;}
li#fLocalNav_2 { left: 208px; width: 43px;}
li#fLocalNav_3 { left: 289px; width: 43px;}
li#fLocalNav_4 { left: 352px; width: 57px;}
li#fLocalNav_5 { left: 426px; width: 67px;}
li#fLocalNav_6 { left: 505px; width: 75px;}

li#fLocalNav_1 a:hover, li#fLocalNav_1 a:active { background-position:  -115px -37px; }
li#fLocalNav_2 a:hover, li#fLocalNav_2 a:active { background-position:  -208px -37px; }
li#fLocalNav_3 a:hover, li#fLocalNav_3 a:active { background-position: -289px -37px; }
li#fLocalNav_4 a:hover, li#fLocalNav_4 a:active { background-position: -352px -37px; }
li#fLocalNav_5 a:hover, li#fLocalNav_5 a:active { background-position: -426px -37px; }
li#fLocalNav_6 a:hover, li#fLocalNav_6 a:active { background-position: -505px -37px; }

#cLocalNav li {
	top: 0;
	height: 37px;
}
li#cLocalNav_1 { left: 96px; width: 106px;}
li#cLocalNav_2 { left: 226px; width: 106px;}
li#cLocalNav_3 { left: 362px; width: 106px;}
li#cLocalNav_4 { left: 503px; width: 106px;}
li#cLocalNav_5 { left: 480px; }
li#cLocalNav_6 { left: 600px; }
li#cLocalNav_1 a:hover, li#cLocalNav_1 a:active { background-position:  -96px -0px; }
li#cLocalNav_2 a:hover, li#cLocalNav_2 a:active { background-position: -226px -0px; }
li#cLocalNav_3 a:hover, li#cLocalNav_3 a:active { background-position: -362px -0px; }
li#cLocalNav_4 a:hover, li#cLocalNav_4 a:active { background-position: -503px -0px; }
li#cLocalNav_5 a:hover, li#cLocalNav_5 a:active { background-position: -480px -29px; }
li#cLocalNav_6 a:hover, li#cLocalNav_6 a:active { background-position: -600px -29px; }

/*==============================================================================
 * 1. simpleBox（简要说明框样式）
 *----------------------------------------------------------------------------*/
.simpleBox .block {
	padding: 10px 0;
}
.simpleBox .block p {
	text-align: center;
}

/*==============================================================================
 * 2. descriptionBox（说明框样式）
 *----------------------------------------------------------------------------*/
.descriptionBox p {
	margin: 12px;
}

/*==============================================================================
 * 3. alertBox（报警框样式）
 *----------------------------------------------------------------------------*/
.alertBox {
	width: 564px;
}
#Body .alertBox th {
	width: 148px;
	padding: 8px 0;
	border: none;
	text-align: center;
}
#Body .alertBox td {
	padding: 6px;
	border-width: 0 0 0 1px;
	color: #ff0000;
}

/*==============================================================================
 * 4. infoBox（首页右侧信息框内样式）
 *----------------------------------------------------------------------------*/
.infoBox .parts {
	zoom: 1;
	overflow: hidden;
	position: relative;
}
.infoBox p {
	overflow: hidden;
	margin-right: 16em;
	padding: 5px;
	border-right: 1px solid #<?php echo $colors[1]; ?>;
	background: #<?php echo $colors[6]; ?>;
}
.infoBox ul.moreInfo {
	position: absolute;
	bottom: 3px;
	right: 0;
	width: 15.5em;
}

/*==============================================================================
 * 5. infoButtonBox（信息确认按钮）
 *----------------------------------------------------------------------------*/
.infoButtonBox .block {
	padding: 30px 10px;
}
.infoButtonBox p,
.infoButtonBox ul {
	margin-top: 6px;
	text-align: center;
}
.infoButtonBox ul.check li {
	text-align: center;
}
.infoButtonBox ul.check li .input_submit {
	margin-top: 6px;
}
.infoButtonBox ul.moreInfo {
	margin-left: 230px;
}
.infoButtonBox ul.moreInfo.button {
	margin-left: 0;
}
.infoButtonBox ul.moreInfo.button li {
	text-align: center;
}

/*==============================================================================
 * 6. yesNoButtonBox（确定按钮的样式）
 *----------------------------------------------------------------------------*/
.yesNoButtonBox .block {
	padding: 10px 0;
}
.yesNoButtonBox .block p,
.yesNoButtonBox ul.moreInfo.button {
	text-align: center;
}
.yesNoButtonBox ul.moreInfo.button {
	margin-top: 4px;
}
.yesNoButtonBox ul.moreInfo.button li {
	display: inline;
}

/*==============================================================================
 * 7. searchFormBox（检索框样式）
 *----------------------------------------------------------------------------*/
.searchFormBox .partsHeading {
	border-bottom: 1px solid #<?php echo $colors[1]; ?>;
}
.searchFormBox .parts {
	zoom: 1;
}
.searchFormBox .item {
	overflow: hidden;
	margin: 10px 40px;
	padding-top: 8px;
	border: 1px solid #<?php echo $colors[1]; ?>;
}
.searchFormBox label,
.searchFormBox span.label {
	margin: 0 4px 0 8px;
	padding: 1px 16px 0 0;
	background: url(<?php echo getSkin('icon_arrow_2'); ?>) no-repeat 100% 0;
}
.searchFormBox .input_submit {
	margin-right: 8px;
}
.searchFormBox p.desc {
	margin: 0 4px 16px 8px;
}
.searchFormBox p.form {
	margin: 0 4px 8px 0;
}
.searchFormBox p.note {
	margin: -4px 4px 8px 8px;
}
.searchFormBox ul.moreInfo {
	margin: 0 4px 8px 150px;
}
.searchFormBox div.block {
	padding: 8px 0;
}
.searchFormBox dl.category {
	zoom: 1;
}
.searchFormBox dl.category dt {
	float: left;
	width: 6em;
}
.searchFormBox dl.category dd {
	zoom: 1;
	margin-left: 6em;
}
.searchFormBox dl.category dd p {
	margin: 0 16px;
}
.searchFormBox dl.categories dt {
	margin-bottom: 4px;
}
.searchFormBox table.category th {
	width: 74px;
	padding: 3px 7px 3px 5px;
	border: none;
	background: url(<?php echo getSkin('colon'); ?>) no-repeat 100% 4px;
	font-weight: bold;
	vertical-align: top;
}
.searchFormBox table.category td {
	padding: 3px 8px;
	border: none;
	vertical-align: top;
}

/*==============================================================================
 * 8. diaryDetailBox（日记详细列表样式）
 *----------------------------------------------------------------------------*/
.diaryDetailBox .partsHeading {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
}
.diaryDetailBox h3 {
	float: left;
	width: 66%;
}
.diaryDetailBox .partsHeading p.public {
	float: right;
	width: 33%;
	margin: 0;
	text-align: right;
}
.diaryDetailBox dl {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
	border-top: 1px solid #<?php echo $colors[1]; ?>;
}
.diaryDetailBox dt {
	float: left;
	width: 70px;
	padding-top: 5px;
	text-align: center;
}
.diaryDetailBox dd {
	zoom: 1;
	min-height: 4.2em;
	margin-left: 70px;
	border-left: 1px solid #<?php echo $colors[1]; ?>;
}
* html .diaryDetailBox dd {
	height: 4.2em;
}
.diaryDetailBox dd div {
	border-top: 1px solid #<?php echo $colors[1]; ?>;
}
.diaryDetailBox dd div p {
	padding: 4px 3px;
}
.diaryDetailBox dd div.title {
	border-top: none;
}
.diaryDetailBox dd div.body {
	padding: 4px 3px;
}
.diaryDetailBox dd ul.photo {
	padding: 4px 5px;
}
.diaryDetailBox dd ul.photo li {
	display: inline;
	margin-left: 6px;
}
.diaryDetailBox div.category ul {
	padding: 4px;
	text-align: right;
}
.diaryDetailBox div.category ul li {
	display: inline;
	font-size: 80%;
}

/*==============================================================================
 * 9. topicDetailBox（话题列表框样式）
 *----------------------------------------------------------------------------*/
.topicDetailBox dl {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
	border-top: 1px solid #<?php echo $colors[1]; ?>;
}
.topicDetailBox dt {
	float: left;
	width: 100px;
	padding: 5px;
	text-align: center;
}
.topicDetailBox dd {
	zoom: 1;
	margin-left: 110px;
	border-left: 1px solid #<?php echo $colors[1]; ?>;
}
.topicDetailBox dd div {
	border-top: 1px solid #<?php echo $colors[1]; ?>;
}
.topicDetailBox dd div p {
	padding: 5px;
}
.topicDetailBox dd div.title {
	border-top: none;
}
.topicDetailBox dd ul.photo {
	padding: 5px;
}
.topicDetailBox dd ul.photo li {
	display: inline;
	margin-left: 6px;
}
.topicDetailBox dd div.attachFile {
	padding: 16px 5px;
}
.topicDetailBox div.operation {
	padding: 10px 0;
}

/*==============================================================================
 * 10. eventDetailBox（报错提示信息框样式）
 *----------------------------------------------------------------------------*/
.eventDetailBox dl {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
	border-top: 1px solid #<?php echo $colors[1]; ?>;
}
.eventDetailBox dt {
	float: left;
	width: 100px;
	padding: 5px;
	text-align: center;
}
.eventDetailBox dd {
	zoom: 1;
	margin-left: 110px;
	border-left: 1px solid #<?php echo $colors[1]; ?>;
}
.eventDetailBox dd ul.photo {
	padding: 5px;
	border-bottom: 1px solid #<?php echo $colors[1]; ?>;
}
.eventDetailBox dd ul.photo li {
	display: inline;
	margin-left: 6px;
}
.eventDetailBox dd table th {
	width: 112px;
	text-align: center;
	border-left: none;
}
.eventDetailBox dd table th,
.eventDetailBox dd table td {
	padding: 5px;
}
.eventDetailBox dd table tr:first-child th,
.eventDetailBox dd table tr:first-child td,
.eventDetailBox dd table tr.first-child th,
.eventDetailBox dd table tr.first-child td {
	border-top: none;
}
.eventDetailBox dd table ul.moreInfo {
	margin-top: -1.2em;
	text-align: right;
}
.eventDetailBox dd table ul.moreInfo li {
	display: inline;
	background-position: 0 50%;
}

/*==============================================================================
 * 11. homePhotoBox（头像框样式）
 *----------------------------------------------------------------------------*/
.homePhotoBox * {
	text-align: center;
}
.homePhotoBox p.friendLink {
	margin-bottom: 3px;
}
.homePhotoBox .parts {
	padding: 7px;
}
.homePhotoBox ul.moreInfo {
	margin: 2px 0 -5px;
}
.homePhotoBox ul.moreInfo li {
    display: inline;
	padding: 1px 0;
	background: none;
}
.homePhotoBox ul.moreInfo li img {
	vertical-align: bottom;
}
.homePhotoBox p.rank {
	margin-top: 6px;
}
.homePhotoBox p.point {
	margin-top: 2px;
}
.homePhotoBox p.text {
	margin-top: 4px;
}
.homePhotoBox p.loginTime {
	margin-top: 0px;
}

/*==============================================================================
 * 12. homeInfoBox（首页信息提示栏的样式）
 *----------------------------------------------------------------------------*/
#Body .homeInfoBox {
	padding-left: 102px;
	border: 1px solid #<?php echo $colors[1]; ?>;
	background: #<?php echo $colors[6]; ?> url(<?php echo getSkin('icon_information'); ?>) no-repeat 5px 50%;
}
.homeInfoBox div.body {
	min-height: 1.2em;
	padding: 5px;
	border-left: 1px solid #<?php echo $colors[1]; ?>;
	background: #<?php echo $colors[7]; ?>;
}
.homeInfoBox .caution {
	color: #ff0000;
}

/*==============================================================================
 * 13. photoUploadFormBox（人物评论及照片上传的表格样式）
 *----------------------------------------------------------------------------*/
.photoUploadFormBox table {
	border-top: 1px solid #<?php echo $colors[1]; ?>;
}
#Body .photoUploadFormBox td {
	padding: 8px 0;
	border: none;
	text-align: center;
}
.photoUploadFormBox form {
	float: left;
	width: 230px;
}
.photoUploadFormBox form p {
	margin: 8px 0;
	text-align: center;
}
.photoUploadFormBox ul {
	zoom: 1;
	margin: 8px 0 8px 230px;
}
.photoUploadFormBox li {
	padding-left: 12px;
	background: url(<?php echo getSkin('marker'); ?>) no-repeat 3px 3px;
}

/*==============================================================================
 * 14. messageDetailBox（短信编辑框样式表）
 *----------------------------------------------------------------------------*/
#Body .messageDetailBox th:first-child,
#Body .messageDetailBox th.first-child {
	border-left-width: 1px;
}
.messageDetailBox th,
.messageDetailBox td {
	padding: 5px;
}
.messageDetailBox td.photo {
	width: 120px;
	text-align: center;
}
.messageDetailBox th {
	width: 54px;
	padding-left: 0;
	padding-right: 16px;
	background: url(<?php echo getSkin('colon'); ?>) no-repeat 96% 50%;
	text-align: right;
}
#Body .messageDetailBox td {
	border-left: none;
}
.messageDetailBox ul.photo {
	margin: 10px;
	text-align: center;
}
.messageDetailBox p.text {
	margin: 10px 60px;;
}
.messageDetailBox ul.photo li {
	display: inline;
	margin-left: 6px;
}
.messageDetailBox div.operation {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
}
.messageDetailBox form.delete {
	float: left;
	width: 50%;
	text-align: left;
}
.messageDetailBox form.send {
	float: right;
	width: 50%;
	text-align: right;
}
.messageDetailBox form ul.moreInfo {
	display: inline;
}
.messageDetailBox div.attachFile {
	padding: 16px 5px;
}

/*==============================================================================
 * 15. albumDetailBox（相薄详细浏览框样式表）
 *----------------------------------------------------------------------------*/
.albumDetailBox th,
.albumDetailBox td {
	padding: 5px;
}
.albumDetailBox th {
	width: 75px;
}
.albumDetailBox td.photo {
	width: 190px;
	padding: 5px 0;
	text-align: center;
}
#Body .albumDetailBox th:first-child,
#Body .albumDetailBox th.first-child,
#Body .albumDetailBox td.operation {
	border-left-width: 1px;
}
.albumDetailBox td.operation {
	text-align: right;
}

/*==============================================================================
 * 16. albumImageBox（相册相片大小框样式表）
 *----------------------------------------------------------------------------*/
.albumImageBox p.photo {
	padding: 10px;
	border-top: 1px solid #<?php echo $colors[1]; ?>;
	text-align: center;
}
.albumImageBox th, .albumImageBox td {
	padding: 5px;
}
#Body .albumImageBox th {
	width: 140px;
	border-left: none;
}

/*==============================================================================
 * 17. searchFormLine（检索条样式表）
 *----------------------------------------------------------------------------*/
.searchFormLine ul {
	text-align: center;
	padding: 1px 0;
}
.searchFormLine ul li {
	display: inline;
}
.searchFormLine ul li * {
	vertical-align: middle;
}
.searchFormLine ul li label {
	margin-right: 2px;
	padding: 1px 13px 0 0;
	background: url(<?php echo getSkin('icon_arrow_2'); ?>) no-repeat 100% 0;
}

/*==============================================================================
 * 18. linkLine（链接线的样式表）
 *----------------------------------------------------------------------------*/
.linkLine ul.moreInfo {
	text-align: center;
}
.linkLine ul.moreInfo li {
	display: inline;
	background-position: 0 50%;
}

/*==============================================================================
 * 19. prevNextLinkLine（鼠标点击后的链接线颜色）
 *----------------------------------------------------------------------------*/
.prevNextLinkLine {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
}
.prevNextLinkLine p.prev {
	float: left;
	width: 50%;
	text-align: left;
}
.prevNextLinkLine p.next {
	float: right;
	width: 50%;
	text-align: right;
}
.block.prevNextLinkLine {
	padding: 4px 10px;
}

/*==============================================================================
 * 20. buttonLine（按钮样式）
 *----------------------------------------------------------------------------*/
.buttonLine form {
	text-align: center;
}

/*==============================================================================
 * 21. alertLine（鼠标点击后的按钮样式）
 *----------------------------------------------------------------------------*/
.alertLine p {
	text-align: center;
	color: #ff0000;
}

/*==============================================================================
 * 22. commentList（日记回复框样式表）
 *----------------------------------------------------------------------------*/
.commentList dl {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
	border-top: 1px solid #<?php echo $colors[1]; ?>;
}
.commentList dt {
	float: left;
	width: 70px;
	padding-top: 5px;
	text-align: center;
}
.commentList dd {
	zoom: 1;
	min-height: 5.5em;
	margin-left: 70px;
	border-left: 1px solid #<?php echo $colors[1]; ?>;
}
* html .commentList dd {
	height: 5.5em;
}
#LayoutC .commentList dt {
	width: 110px;
}
#LayoutC .commentList dd {
	margin-left: 110px;
}
.commentList dd div {
	border-top: 1px solid #<?php echo $colors[1]; ?>;
}
.commentList dd div p {
	padding: 4px 3px;
}
.commentList dd div.title {
	zoom: 1;
	position: relative;
	border-top: none;
}
.commentList dd div.title p.heading {
	margin-right: 10.5em;
}
.commentList dd div.title p.public {
	position: absolute;
	top: 0;
	right: 0;
}
#pc_page_fh_diary_list .commentList dd div.title {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
}
#pc_page_fh_diary_list .commentList dd div.title p.heading {
	float: left;
	width: 66%;
}
#pc_page_fh_diary_list .commentList dd div.title p.public {
	float: right;
	width: 33%;
	text-align: right;
}
.commentList dd ul.photo {
	padding: 5px 5px 0;
}
.commentList dd ul.photo li {
	display: inline;
	margin-left: 6px;
}
.commentList dd div.footer p {
	text-align: right;
}
.commentList div.operation {
	padding: 8px 0;
}
.commentList dd div.attachFile {
	padding: 16px 5px;
}

/*==============================================================================
 * 23. searchResultList（检索结构一览表样式）
 *----------------------------------------------------------------------------*/
.searchResultList .partsInfo {
	background: #<?php echo $colors[6]; ?>;
}
.searchResultList .ditem {
	margin: 8px 34px;
}
.searchResultList .item {
	zoom: 1;
	position: relative;
}
.searchResultList td.photo {
	width: 90px;
	padding: 0;
	border-left: none;
	text-align: center;
}
.searchResultList th, .searchResultList td {
	padding: 5px;
}
.searchResultList th {
	width: 75px;
}
#Body .searchResultList th:first-child,
#Body .searchResultList th.first-child {
	border-left-width: 1px;
}
.searchResultList tr.operation th {
	padding-top: 0;
	padding-bottom: 0;
}
.searchResultList tr.operation td {
	padding: 0;
}
.searchResultList tr.operation span.text {
	float: left;
	display: block;
	width: 110px;
	margin-top: 5px;
	padding: 0 5px;
}
.searchResultList tr.operation span.moreInfo{
	zoom: 1;
	display: block;
	margin-left: 121px;
	padding: 4px 0 3px;
	text-align: center;
}
.searchResultList div.operation {
	text-align: center;
}
.searchResultList tr.operation span.moreInfo img,
.searchResultList div.operation form,
.searchResultList div.operation fieldset {
	display: inline;
	vertical-align: top;
}

/*==============================================================================
 * 24. reviewList（点评样式表）
 *----------------------------------------------------------------------------*/
.reviewList dl {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
	border-top: 1px solid #<?php echo $colors[1]; ?>;
}
.reviewList dl dt {
	float:left;
	width: 170px;
	padding: 5px;
	text-align: center;
}
.reviewList dl dt span {
	display: block;
	margin: 3px 0;
}
.reviewList dl dd {
	zoom: 1;
	margin-left: 180px;
	border-left: 1px solid #<?php echo $colors[1]; ?>;
}
.reviewList dl dd table {
	height: 216px;
}
.reviewList dl dd th,
.reviewList dl dd td {
	padding: 5px;
}
.reviewList dl tr.title th,
.reviewList dl dd tr.title td {
	border-top: none;
}
.reviewList dl dd th {
	width: 100px;
	border-left: none;
	text-align: center;
}
.reviewList dl dd tr.title td {
	font-weight: bold;
}
.reviewList dl dd td p.operation {
	text-align: right;
}
.reviewList dl dd tr.footer td {
	border-left: none;
	text-align: right;
}
.reviewList div.operation {
	padding: 10px 0;
}

/*==============================================================================
 * 25. recentList（最新信息列表样式）
 *----------------------------------------------------------------------------*/
.recentList dl {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
	border-top: 1px solid #<?php echo $colors[1]; ?>;
}
.recentList dt {
	float: left;
	width: 170px;
	padding: 5px;
	text-align: center;
}
.recentList dd {
	zoom: 1;
	margin-left: 180px;
	padding: 5px;
	border-left: 1px solid #<?php echo $colors[1]; ?>;
}
* html #Body .recentList dd {
	height: 1.2em;
}
#LayoutB #Center .recentList dt {
	width: 110px;
}
#LayoutB #Center .recentList dd {
	margin-left: 120px;
}

/*==============================================================================
 * 26. friendIntroList（首页朋友印象列表样式）
 *----------------------------------------------------------------------------*/
.friendIntroList th,
.friendIntroList td {
	padding: 14px;
}
#Body .friendIntroList th {
	width: 120px;
	border-left: none;
	text-align: center;
}
.friendIntroList p.text {
	margin-bottom: 1em;
}
.friendIntroList div.moreInfo ul.moreInfo {
	width: 10em;
	margin-left: auto;
	padding: 6px 2px;
}

/*==============================================================================
 * 27. manageList（管理菜单样式）
 *----------------------------------------------------------------------------*/
.manageList td {
	padding: 5px;
}
.manageList td.photo {
	width: 140px;
	border-left: none;
	text-align: center;
}
.manageList td.delete {
	width: 120px;
}
.manageList col.date {
	width: 160px;
}
* html .manageList col.date {
	width: 150px;
}
*:first-child+html .manageList col.date {
	width: 150px;
}
.manageList col.name {
	width: auto;
}
.manageList colgroup.operation col {
	width: 86px;
}
* html .manageList colgroup.operation col {
	width: 76px;
}
*:first-child+html .manageList colgroup.operation col {
	width: 76px;
}

/*==============================================================================
 * 28. searchCategoryList（分类检索页面的列表样式）
 *----------------------------------------------------------------------------*/
.searchCategoryList .partsInfo {
	padding: 5px;
	border-bottom: 1px solid #<?php echo $colors[1]; ?>;
	background: #<?php echo $colors[6]; ?>;
	text-align: center;
}
.searchCategoryList .item {
	margin: 10px 40px;
	border: 1px solid #<?php echo $colors[1]; ?>;
	border-top: none;
}
.searchCategoryList span.label {
	margin: 0 4px 0 8px;
	padding: 1px 16px 0 0;
	background: url(<?php echo getSkin('icon_arrow_2'); ?>) no-repeat 100% 0;
}
.searchCategoryList dl {
	border-top: 1px solid #<?php echo $colors[1]; ?>;
}
.searchCategoryList dl dt {
	margin: 8px 0 0;
}
.searchCategoryList dl dd {
	margin: 8px 10px 8px 70px;
}
.searchCategoryList dl dd ul {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
	margin: 4px 0;
}
.searchCategoryList dl dd ul li {
	overflow: hidden;
	float: left;
	width: 19%;
	margin: 0 2px;
}

/*==============================================================================
 * 29. messageList（信箱中短信列表样式）
 *----------------------------------------------------------------------------*/
.messageList .partsHeading p.date {
	font-weight: bold;
}
.messageList .pagerRelativeMulti {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
}
.messageList .pagerRelativeMulti .pager {
	position: static;
	float: right;
	width: 290px;
	margin-top: 1px;
	text-align: right;
}
.messageList .pagerRelativeMulti .pager p {
	margin-left: 0;
}
* html .messageList .pagerRelativeMulti .pager p {
	margin-left: 4px;
}
*:first-child+html .messageList .pagerRelativeMulti .pager p {
	margin-left: 4px;
}
.messageList p.icons {
	float: left;
	width: 220px;
}
.messageList p.icons img {
	padding-right: 16px;
	background: url(<?php echo getSkin('articleList_marker'); ?>) no-repeat 96% 6px;
	vertical-align: text-bottom;
}
.messageList tr {
	height: 20px;
}
.messageList tr.unread {
	background: #<?php echo $colors[6]; ?>;
}
#Body .messageList th.delete {
	font-weight: normal;
}
#Body .messageList th {
	padding: 0 2px;
	border-width: 1px 0 0;
	font-weight: bold;
}
#Body .messageList td {
	padding: 0 2px;
	border-width: 1px 0 0;
}
#Body .messageList td .input_checkbox {
	margin-left: 4px;
}
.messageList td.status {
	text-align: center;
}
.messageList col.status {
	width: 35px;
}
.messageList col.delete {
	width: 35px;
}
.messageList col.target {
	width: 130px;
}
.messageList col.title {
	width: auto;
}
.messageList col.date {
	width: 80px;
}
.messageList table span {
	width: 100%;
	display: block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.messageList div.operation p {
	margin-top: 8px;
	margin-bottom: 5px;
}
.messageList div.operation ul.moreInfo {
	text-align: left;
}

/*==============================================================================
 * 30. ashiatoList（访客足迹显示样式）
 *----------------------------------------------------------------------------*/
.ashiatoList div.partsInfo {
	border-bottom: 1px solid #<?php echo $colors[1]; ?>;
}
.ashiatoList div.item {
	margin: 8px 40px;
	padding: 8px 0;
	border: 1px solid #<?php echo $colors[1]; ?>;
}
.ashiatoList div.item p,
.ashiatoList div.item ul.list {
	padding-left: 160px;
}
.ashiatoList div.item p strong {
	margin: 0 2px;
}
.ashiatoList div.item ul.list {
	overflow: hidden;
	margin-top: 16px;
}
.ashiatoList div.item ul.list li{
    padding: 4px;
}
.ashiatoList div.item ul.list .ashiatoTime {
    display: inline;
    margin: 0 10px 0 0;
    position: relative;
    top : -10px;
}
.ashiatoList div.item ul.list .ashiatoPic {
    display: inline;
    width: 40px;
    text-align: center;
}
.ashiatoList div.item ul.list .ashiatoName {
    display: inline;
    margin: 0 0 0 10px;
    position: relative;
    top : -11px;
}
/*==============================================================================
 * 31. rankingList（积分显示样式）
 *----------------------------------------------------------------------------*/
.rankingList .partsHeading p {
	margin: 0;
}
#Body .rankingList th:first-child,
#Body .rankingList th.first-child {
	border-left-width: 1px;
}
.rankingList td.photo {
	width: 120px;
	text-align: center;
}
.rankingList th {
	width: 75px;
	padding: 5px;
}
.rankingList td {
	padding: 5px;
}
.rankingList td.name {
	background: #<?php echo $colors[6]; ?>;
}
.rankingList td.name a {
	font-weight: bold;
}
.rankingList .ditem {
	margin: 8px 15px;
	background: #<?php echo $colors[6]; ?>;
}
.rankingList .item {
	background: #<?php echo $colors[7]; ?>;
}
.rankingList .item td.photo {
	width: 90px;
}

/*==============================================================================
 * 32. bizSideTodoList（公司用事件列表工具）
 *----------------------------------------------------------------------------*/
#Body .bizSideTodoList {
	width: 220px;
	margin: 10px 5px;
	border: 1px solid #<?php echo $colors[1]; ?>;
}
#Body .bizSideTodoList td {
	border-width: 1px 0 0;
}
.bizSideTodoList .block {
	padding: 5px;
}
.bizSideTodoList textarea {
	width: 98%;
}
.bizSideTodoList tr.someone {
	background: #<?php echo $colors[6]; ?>;
}
.bizSideTodoList tr.checked {
	color: #999999;
}
.bizSideTodoList td.state {
	width: 38px;
	vertical-align: top;
}
.bizSideTodoList tr.priLow td.state p {
	padding-left: 4px;
	border-left: 0;
}
.bizSideTodoList tr.priMiddle td.state p {
	padding-left: 0;
	border-left: 4px solid #ff8080;
}
.bizSideTodoList tr.priHigh td.state p {
	padding-left: 0;
	border-left: 4px solid #ff0000;
}
.bizSideTodoList tr.checked td.state p {
	padding-left: 4px;
	border-left: 0;
}
.bizSideTodoList td.operation {
	width: 16px;
	vertical-align: top;
}
.bizSideTodoList td.operation a {
	display: block;
	width: 14px;
	margin-top: 2px;
}

/*==============================================================================
 * 33. bizSideScheduleList（公司用右侧事件搜索工具） 
 *----------------------------------------------------------------------------*/
#Body .bizSideScheduleList {
	width: 220px;
	margin: 10px 5px;
	border: 1px solid #<?php echo $colors[1]; ?>;
}
.bizSideScheduleList dl {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
	border-top: 1px solid #<?php echo $colors[1]; ?>;
}
.bizSideScheduleList dt {
	float: left;
	width: 60px;
	padding: 5px;
	text-align: center;
}
.bizSideScheduleList dd {
	zoom: 1;
	margin-left: 70px;
	padding: 5px;
	border-left: 1px solid #<?php echo $colors[1]; ?>;
}

/*==============================================================================
 * 34. albumList（相册列表样式）
 *----------------------------------------------------------------------------*/
.albumList th,
.albumList td {
	padding: 5px;
}
.albumList th {
	width: 75px;
}
.albumList td.photo {
	width: 190px;
	padding: 5px 0;
	text-align: center;
}
.albumList td.photo p {
	text-align: center;
	padding: 5px;
}
#Body .albumList th:first-child,
#Body .albumList th.first-child {
	border-left-width: 1px;
}
.albumList td.operation {
	text-align: center;
}

/*==============================================================================
 * 35. albumImageList（相册中相片列表样式）
 *----------------------------------------------------------------------------*/
.albumImageList td {
	padding: 5px;
	text-align: center;
}
.albumImageList td p {
	text-align: center;
}

/*==============================================================================
 * 36. homeNineTable（ホーム9面テーブル）
 *----------------------------------------------------------------------------*/
.homeNineTable tr.photo td {
	height: 80px;
	padding: 2px 0;
	text-align: center;
}
.homeNineTable tr.photo td p.crown {
	text-align: center;
}
.homeNineTable tr.text td {
	padding: 2px;
	text-align: center;
}
.homeNineTable div.moreInfo ul.moreInfo {
	width: 11em;
	margin-left: auto;
	padding: 6px 0;
}

/*==============================================================================
 * 37. photoTable（相片框样式）
 *----------------------------------------------------------------------------*/
.photoTable {
	width: 561px;
}
.photoTable tr.photo td {
	height: 90px;
	padding: 8px 0;
	text-align: center;
}
.photoTable tr.photo td p.crown {
	text-align: center;
}
.photoTable tr.text td {
	padding: 5px 2px;
	text-align: center;
}

/*==============================================================================
 * 38. homeMainTable（个人首页最新信息框样式）
 *----------------------------------------------------------------------------*/
.homeMainTable .partsHeading {
	zoom: 1;
	position: relative;
}
.homeMainTable .partsHeading p.link {
	position: absolute;
	top: 2px;
	right: 8px;
}
.homeMainTable th {
	width: 83px;
	background-color: #<?php echo $colors[6]; ?>;
}
.homeMainTable th, .homeMainTable td {
	padding: 5px;
}
.homeMainTable ul.articleList {
	line-height: 1.3;
}
.homeMainTable ul.articleList li {
    padding-left: 85px;
    text-indent: -72px;
}
.homeMainTable tr ul.articleList li {
    background: url(<?php echo getSkin('icon_3'); ?>) 3px 0.4em no-repeat scroll;
}
.homeMainTable tr.myFriendRecentDiary ul.articleList li,
.homeMainTable tr.myFriendRecentBlog ul.articleList li,
.homeMainTable tr.allRecentDiary ul.articleList li,
.homeMainTable tr.bookmarkRecentDiary ul.articleList li,
.homeMainTable tr.bookmarkRecentBlog ul.articleList li,
.homeMainTable tr.myRecentDiary ul.articleList li,
.homeMainTable tr.myRecentBlog ul.articleList li,
.homeMainTable tr.friendRecentDiary ul.articleList li,
.homeMainTable tr.friendRecentBlog ul.articleList li
{
    background-image: url(<?php echo getSkin('icon_1'); ?>);
}
.homeMainTable tr.diaryCommentHistory ul.articleList li,
.homeMainTable tr.recentCommunityTopicComment ul.articleList li,
.homeMainTable tr.allRecentCommunityTopicComment ul.articleList li,
.homeMainTable tr.communityTopic ul.articleList li,
.homeMainTable tr.communityEvent ul.articleList li
{
    background-image: url(<?php echo getSkin('icon_2'); ?>);
}
.homeMainTable ul.articleList li span.date {
	padding-right: 18px;
	background: url(<?php echo getSkin('articleList_marker'); ?>) 92% 0.3em no-repeat scroll;
}
.homeMainTable div.moreInfo ul.moreInfo {
	width: 10em;
	margin: 0 2px 0 auto;
}
.homeMainTable td.halfway ul.moreInfo {
	width: 12em;
	margin: 0 0 20px auto;
}

/*==============================================================================
 * 39. formTable（表格）
 *----------------------------------------------------------------------------*/
.formTable .partsHeading {
	zoom: 1;
	position: relative;
}
.formTable strong {
	font-weight: normal;
	color: #ff0000;
}
.formTable p.caution {
	color: #ff0000;
}
.formTable .partsHeading p.link {
	position: absolute;
	top: 2px;
	right: 8px;
}
.formTable div.partsInfo {
	background-color: #<?php echo $colors[6]; ?>;
}
.formTable th, .formTable td {
	padding: 5px;
}
#Body .formTable th {
	width: 140px;
	border-left: none;
}
#LayoutB #Center .formTable th {
	width: 80px;
}
.formTable table table td {
	padding: 0;
	border: none;
}
.formTable textarea {
	width: 98%;
}
.formTable input.input_text_long {
	width: 98%;
}
.formTable table table td.publicSelector {
	width: 150px;
	text-align: right;
}
.formTable table table td.publicSelector select {
	width: 150px;
}
.formTable div.checkList ul {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
}
.formTable div.checkList li {
	overflow: hidden;
	overflow: -moz-scrollbars-none;
	float: left;
	width: 27%;
	padding-left: 18px;
	text-indent: -18px;
	line-height: 1.6;
}
.formTable div.operation {
	padding: 10px 0;
}

/*==============================================================================
 * 40. weeklyCalendarTable（每周日历样式）
 *----------------------------------------------------------------------------*/
#Body .weeklyCalendarTable .parts {
	border-top: none;
}
.weeklyCalendarTable div.block {
	padding: 5px;
}
.weeklyCalendarTable .input_submit {
	margin-right: 8px;
}
.weeklyCalendarTable .calendar td {
	padding: 5px;
	vertical-align: top;
}
.weeklyCalendarTable .calendar .today {
	background: #<?php echo $colors[6]; ?>;
}
.weeklyCalendarTable .calendar .today p.day {
	font-weight: bold;
}
.weeklyCalendarTable ul.moreInfo {
	margin: 0 2px 0 auto;
	width: 9em;
}

/*==============================================================================
 * 41. monthlyCalendarTable（每月日历样式）
 *----------------------------------------------------------------------------*/
.monthlyCalendarTable div.block {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
	padding: 2px 5px;
}
.monthlyCalendarTable div.block p.moreInfo {
	float: left;
	width: 70%;
	text-align: left;
}
.monthlyCalendarTable div.block p.moreInfo a {
	margin-right: 4px;
}
.monthlyCalendarTable div.block p.pager {
	float: right;
	width: 30%;
	margin-top: 2px;
	text-align: right;
}
.monthlyCalendarTable .calendar th {
	padding: 2px;
}
.monthlyCalendarTable .calendar td {
	height: 65px;
	padding: 2px;
	vertical-align: top;
}
.monthlyCalendarTable .calendar td.today {
	background: #<?php echo $colors[6]; ?>;
	font-weight: bold;
}
.monthlyCalendarTable .calendar td p {
	font-weight: normal;
}
.monthlyCalendarTable .partsInfo {
	padding: 5px;
	background: #<?php echo $colors[6]; ?>;
}
.monthlyCalendarTable .partsInfo img {
	margin: 0 1px;
}

/*==============================================================================
 * 42. bizWeeklyCalendarTable（公司用SNS每周日历表样式）
 *----------------------------------------------------------------------------*/
#Body .bizWeeklyCalendarTable .parts {
	border-top: none;
}
.bizWeeklyCalendarTable div.block {
	padding: 5px;
}
.bizWeeklyCalendarTable .calendar td {
	padding: 5px 0;
	vertical-align: top;
}
.bizWeeklyCalendarTable .calendar td p {
	padding: 0 5px;
}
.bizWeeklyCalendarTable .calendar td .time {
	padding: 0;
}
.bizWeeklyCalendarTable .calendar .today {
	background: #<?php echo $colors[6]; ?>;
}
.bizWeeklyCalendarTable .calendar .today p.day {
	font-weight: bold;
}
.bizWeeklyCalendarTable .calendar th {
	width: 130px;
	padding: 5px 0;
	text-align: center;
}
.bizWeeklyCalendarTable .calendar th * {
	text-align: center;
}
.bizWeeklyCalendarTable .calendar th .input_text {
	width: 118px;
}
.bizWeeklyCalendarTable .calendar th .input_submit {
	width: 120px;
}
.bizWeeklyCalendarTable .calendar th .nickname {
	margin: 5px 0;
}
.bizWeeklyCalendarTable .calendar th .member_image {
	margin-bottom: 5px;
}
.bizWeeklyCalendarTable .calendar td.sub {
	border-width: 0 0 0 1px;
}
.bizWeeklyCalendarTable div.moreInfo {
	padding-left: 135px;
}
.bizWeeklyCalendarTable div.moreInfo .input_submit {
	margin-right: 8px;
}

/*==============================================================================
 * 43. sideNav（h\f\c系外的其他页面左侧日历部分样式）
 *----------------------------------------------------------------------------*/
.sideNav .item {
	overflow: hidden;
	width: 150px;
	margin: 0 auto 10px;
	border: 8px solid #<?php echo $colors[8]; ?>;
}
.sideNav .partsHeading {
	border-bottom: 1px solid #<?php echo $colors[1]; ?>;
}
.sideNav .pageNav ul {
	margin: 1px;
}
.sideNav .pageNav li {
	padding: 4px 0 4px 18px;
	background: url(<?php echo getSkin('icon_1'); ?>) 8px 50% no-repeat scroll;
}
.sideNav .pageNav li.looking {
	background-color: #<?php echo $colors[6]; ?>;
}
.sideNav .calendar .partsHeading {
	padding: 4px 0;
	border: none;
	background: none;
	text-align: center;
}
.sideNav .calendar th {
	background-color: #<?php echo $colors[6]; ?>;
	text-align: center;
}
.sideNav .calendar td {
	padding: 1px 2px;
	text-align: right;
}
.sideNav .list {
	padding: 4px 0;
}
.sideNav .list li {
	padding-left: 16px;
	background: no-repeat 6px 4px;
}
.sideNav .monthlyMessage li  { background-image: url(<?php echo getSkin('icon_1'); ?>); }
.sideNav .recentlyDiary li   { background-image: url(<?php echo getSkin('icon_3'); ?>); }
.sideNav .recentlyComment li { background-image: url(<?php echo getSkin('icon_1'); ?>); }
.sideNav .monthlyDiary li    { background-image: url(<?php echo getSkin('icon_2'); ?>); }
.sideNav .listCategory li    { background-image: url(<?php echo getSkin('icon_2'); ?>); }

/*==============================================================================
 * 44. rankingSideNav（显示积分部分的样式）
 *----------------------------------------------------------------------------*/
.rankingSideNav {
	width: 150px;
	margin: 0 auto;
	border: 8px solid #<?php echo $colors[8]; ?>;
}
.rankingSideNav .partsHeading {
	padding: 2px 4px;
	border-bottom: 1px solid #<?php echo $colors[1]; ?>;
	background-image: none;
	text-align: center;
}
.rankingSideNav p {
	margin: 3px;
}
.rankingSideNav p.link {
	padding: 3px;
	border: 1px solid #<?php echo $colors[1]; ?>;
	text-align: right;
}

/*==============================================================================
 * 45. 会员检索页布局
 *----------------------------------------------------------------------------*/
div#LayoutD {
	zoom: 1;
	overflow: hidden;
	overflow: -moz-scrollbars-none;
	margin-bottom: 10px;
}
#LayoutD #Left div.parts {
	border: 1px solid #<?php echo $colors[1]; ?>;
}
#LayoutD #Left {
	float: left;
	width: 440px;
	padding: 0 5px;
}
#LayoutD #Center {
	float: right;
	width: 270px;
}

#LayoutD .welcomeNewMember th{
    width: 78px;
}

/**=============================================================================
 * 网站内部线条配色设定
 *----------------------------------------------------------------------------*/
#Body {
	background: #<?php echo $colors[2]; ?>;
}
#Container {
	background: #<?php echo $colors[3]; ?>;
}
div.dparts {
	background-color: #<?php echo $colors[4]; ?>;
}
div.parts {
	background-color: #<?php echo $colors[7]; ?>;
}
.sideNav .item {
	background-color: #<?php echo $colors[7]; ?>;
}
#Body .sideNav {
	background-color: transparent;
}
#Body .linkLine,
#Body .searchFormLine,
#Body .buttonLine,
#Body .prevNextLinkLine {
	background-color: transparent;
}

/**=============================================================================
 * 普通登陆界面样式
 *----------------------------------------------------------------------------*/
div#container_login {
	position: relative;
	display: block;
	margin-left: auto; 
	margin-right: auto;
	margin-top: 130px;
	width: 600px;
	height: 350px;
	padding: 0px;
}

div#container_login img.bg {
	display: block;
	position: absolute;
	left: 0px;
	top: 0px;
	width: 600px;
	height: 350px;
	z-index: 0;
}

div#container_login a img {
	width: 100%;
	height: 100%;
}

div#container_login div.banner,
div#container_login a.banner {
	display: block;
	position: absolute;
	left: 247px;
	top: 5px;
	width: 468px;
	height: 60px;
	z-index: 200;
}

div#container_login div.header a.main_menu {
	display: block;
	display: none;
	position: absolute;
	height: 22px;
	top: 0px;
}

div#container_login input#username {
	display: block;
	position: absolute;
	left: 188px;
	top: 158px;
	width: 220px;
	height: 18px;
	font-size: 10pt;
	z-index: 100;
}

div#container_login input#password {
	display: block;
	position: absolute;
	left: 188px;
	top: 200px;
	width: 220px;
	height: 18px;
	font-size: 10pt;
	z-index: 110;
}

div#container_login input#button_login {
	display: block;
	position: absolute;
	left: 226px;
	top: 291px;
	width: 45px;
	height: 21px;
	border: none 0px;
	background-color: transparent;
	z-index: 120;
}

div#container_login a#button_new_regist {
	display: block;
	position: absolute;
	left: 326px;
	top: 291px;
	width: 45px;
	height: 21px;
	border: none 0px;
	z-index: 130;
}

div#container_login div.msg {
	display: block;
	position: absolute;
	border: none 0px;
	padding: 3px 0px;
	left: 210px;
	top: 240px;
	width: 165px;
	height: 42px;
	font-size: 15pt;
	text-align: center;
	z-index: 140;
}

div#container_login div.msg * {
	font-size: 10pt;
}

div#container_login .footer {
	display: block;
	position: absolute;
	left: 0px;
	top: 350px;
	width: 600px;
	height: 21px;
	z-index: 300;
}
div#container_login .footer p {
	margin-right: 12px;
	text-align: right;
	line-height: 21px;
}

/*==============================================================================
 * 编辑器中各图标排列样式
 *----------------------------------------------------------------------------*/
<?php if ($decoration_config['op_b']): ?>
span.op_b {
	text-decoration: inherit;
	font-style: inherit;
	font-weight: bold;
	color: inherit;
	font-size: inherit;
}
<?php endif; ?>

<?php if ($decoration_config['op_u']): ?>
span.op_u {
	text-decoration: underline;
	font-style: inherit;
	font-weight: inherit;
	color: inherit;
	font-size: inherit;
}
<?php endif; ?>

<?php if ($decoration_config['op_s']): ?>
span.op_s {
	text-decoration: line-through;
	font-style: inherit;
	font-weight: inherit;
	color: inherit;
	font-size: inherit;
}
<?php endif; ?>

<?php if ($decoration_config['op_i']): ?>
span.op_i {
	text-decoration: inherit;
	font-style: italic;
	font-weight: inherit;
	color: inherit;
	font-size: inherit;
}
<?php endif; ?>

<?php if ($decoration_config['op_large']): ?>
span.op_large {
	text-decoration: inherit;
	font-style: inherit;
	font-weight: inherit;
	color: inherit;
	font-size: 20px;
}
<?php endif; ?>

<?php if ($decoration_config['op_small']): ?>
span.op_small {
	text-decoration: inherit;
	font-style: inherit;
	font-weight: inherit;
	color: inherit;
	font-size: 8px;
}
<?php endif; ?>

<?php if ($decoration_config['op_color']): ?>
span.op_color {
	text-decoration: inherit;
	font-style: inherit;
	font-weight: inherit;
	color: inherit;
	font-size: inherit;
}
<?php else: ?>
span.op_color {
	text-decoration: inherit;
	font-style: inherit;
	font-weight: inherit;
	color: #000 !important;
	font-size: inherit;
}
<?php endif; ?>

<?php if ($custom_css): ?>

/*==============================================================================
 * 其他新增CSS样式
 *----------------------------------------------------------------------------*/
<?php echo $custom_css; ?>

<?php endif; ?>
.friendAlbumList{
	border:1px solid #cccccc;
	padding:3px;
	float:left;
	width:60px;
	margin-left:6px;
}

.friendAlbumListUl{
	padding-top:6px;
}