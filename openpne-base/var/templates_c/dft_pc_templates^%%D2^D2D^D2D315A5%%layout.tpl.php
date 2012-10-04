<?php /* Smarty version 2.6.18, created on 2012-10-04 20:14:41
         compiled from file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/common/layout.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 't_escape', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/common/layout.tpl', 12, false),array('modifier', 't_url2cmd', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/common/layout.tpl', 64, false),array('modifier', 't_cmd', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/common/layout.tpl', 64, false),array('function', 't_url_style', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/common/layout.tpl', 13, false),array('function', 't_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/common/layout.tpl', 29, false),array('function', 't_img_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/common/layout.tpl', 54, false),array('function', 't_img_url_skin', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/common/layout.tpl', 72, false),)), $this); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<?php if ($this->_tpl_vars['INC_HEADER_inc_html_head']): ?><?php echo $this->_tpl_vars['INC_HEADER_inc_html_head']; ?>
<?php endif; ?>
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="description" content="OpenPNE中文是一款优秀的SNS免费开源软件，提供SNS程序免费下载、升级、和技术咨询服务。同时在手机SNS、电子商务SNS、公司内部组织SNS方面都拥有出色的功能发挥和完善的解决方案。OpenPNE中文开发团队将与日本OpenPNE开发团队一起为中国的用户提供更好产品和服务!" /> 
<meta name="Robots" content="index,follow" />
<meta name="keywords" content="SNS,openpne,OpenPNE,开源代码,SNS开发,免费SNS引擎,公司SNS,web2.0社交,OpenPNE中国,OpenPNE中文" />
<title><?php echo smarty_modifier_t_escape($this->_tpl_vars['INC_HEADER_title']); ?>
</title>
<?php echo smarty_function_t_url_style(array(), $this);?>

<script type="text/javascript" src="./js/prototype.js?r7140"></script>
<script type="text/javascript" src="./js/Selection.js?r7140"></script>
<script type="text/javascript" src="./js/pne.js"></script>
</head>
<body id="pc_page_<?php echo smarty_modifier_t_escape($this->_tpl_vars['INC_HEADER_page_name']); ?>
">
<div id="Body">

<?php if ($this->_tpl_vars['INC_HEADER_inc_page_top2']): ?><?php echo $this->_tpl_vars['INC_HEADER_inc_page_top2']; ?>
<?php endif; ?>
<div id="Container">
<?php if ($this->_tpl_vars['INC_HEADER_inc_page_top']): ?><?php echo $this->_tpl_vars['INC_HEADER_inc_page_top']; ?>
<?php endif; ?>

<?php if (! $this->_tpl_vars['INC_HEADER_is_login']): ?>
<div id="Header">

<div id="<?php if ($this->_tpl_vars['before_after'] == 'after'): ?>globalNav<?php else: ?>globalNavBefore<?php endif; ?>">
<h1><a href="<?php echo smarty_function_t_url(array(), $this);?>
"><?php echo smarty_modifier_t_escape(@SNS_NAME); ?>
</a></h1>
<?php if ($this->_tpl_vars['before_after'] == 'after'): ?>
<ul>
<?php $_from = $this->_tpl_vars['INC_HEADER_global_navi']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
?>
<?php if ($this->_tpl_vars['item']['url']): ?>
<li id="globalNav_<?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?>
"><a href="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['url']); ?>
"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['caption']); ?>
</a></li>
<?php endif; ?>
<?php endforeach; endif; unset($_from); ?>
<li id="globalNav_9"><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'do_inc_page_header_logout'), $this);?>
&amp;sessid=<?php echo smarty_modifier_t_escape($this->_tpl_vars['PHPSESSID']); ?>
">退出系统 </a></li>
</ul>
<?php endif; ?>
</div><!-- globalNav -->

<?php if ($this->_tpl_vars['INC_HEADER_top_banner_html_before'] || $this->_tpl_vars['INC_HEADER_top_banner_html_after']): ?>
<div id="topBanner">
<?php if ($this->_tpl_vars['before_after'] == 'after'): ?>
<?php echo $this->_tpl_vars['INC_HEADER_top_banner_html_after']; ?>

<?php else: ?>
<?php echo $this->_tpl_vars['INC_HEADER_top_banner_html_before']; ?>

<?php endif; ?>
</div>
<?php elseif ($this->_tpl_vars['INC_HEADER_top_banner']['c_banner_id']): ?>
<div id="topBanner">
<?php if ($this->_tpl_vars['INC_HEADER_top_banner']['a_href']): ?>
<a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'do_h_click_banner'), $this);?>
&amp;target_c_banner_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['INC_HEADER_top_banner']['c_banner_id']); ?>
<?php if ($this->_tpl_vars['before_after'] == 'after'): ?>&amp;sessid=<?php echo smarty_modifier_t_escape($this->_tpl_vars['PHPSESSID']); ?>
<?php endif; ?>" target="_blank"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['INC_HEADER_top_banner']['image_filename'])), $this);?>
" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['INC_HEADER_top_banner']['nickname']); ?>
" /></a>
<?php else: ?>
<img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['INC_HEADER_top_banner']['image_filename'])), $this);?>
" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['INC_HEADER_top_banner']['nickname']); ?>
" />
<?php endif; ?>
</div>
<?php endif; ?>

</div><!-- Header -->

<?php if ($this->_tpl_vars['inc_entry_point'][1]): ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['inc_entry_point'][1])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_url2cmd($_tmp, 'entry_point')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_cmd($_tmp, 'entry_point')); ?>
<?php endif; ?>
<?php if ($this->_tpl_vars['inc_navi']): ?><?php echo $this->_tpl_vars['inc_navi']; ?>
<?php endif; ?>
<?php if ($this->_tpl_vars['inc_entry_point'][2]): ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['inc_entry_point'][2])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_url2cmd($_tmp, 'entry_point')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_cmd($_tmp, 'entry_point')); ?>
<?php endif; ?>

<?php if (! $this->_tpl_vars['no_use_alert'] && ( $this->_tpl_vars['msg'] || $this->_tpl_vars['msg1'] || $this->_tpl_vars['msg2'] || $this->_tpl_vars['msg3'] || $this->_tpl_vars['err_msg'] )): ?>
<div class="dparts alertBox"><div class="parts">
<table><tr>
<th><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_alert_l'), $this);?>
" alt="警告" /></th>
<td>
<?php if ($this->_tpl_vars['msg']): ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['msg']); ?>
<br /><?php endif; ?>
<?php if ($this->_tpl_vars['msg1']): ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['msg1']); ?>
<br /><?php endif; ?>
<?php if ($this->_tpl_vars['msg2']): ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['msg2']); ?>
<br /><?php endif; ?>
<?php if ($this->_tpl_vars['msg3']): ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['msg3']); ?>
<br /><?php endif; ?>
<?php $_from = $this->_tpl_vars['err_msg']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']); ?>
<br />
<?php endforeach; endif; unset($_from); ?>
</td>
</tr></table>
</div></div>
<?php endif; ?>
<?php endif; ?>
<!-- start of op_content -->
<?php echo $this->_tpl_vars['op_content']; ?>

<!-- end of op_content -->

<?php if (! $this->_tpl_vars['INC_FOOTER_is_login']): ?>
<div id="Footer">
<p><?php echo $this->_tpl_vars['INC_FOOTER_inc_page_footer']; ?>
</p>
</div>
<?php endif; ?>

<?php if ($this->_tpl_vars['INC_FOOTER_side_banner_html_before'] || $this->_tpl_vars['INC_FOOTER_side_banner_html_after'] || $this->_tpl_vars['INC_FOOTER_inc_side_banner']): ?>
<div id="sideBanner">
<?php echo ''; ?><?php if ($this->_tpl_vars['INC_FOOTER_side_banner_html_before'] || $this->_tpl_vars['INC_FOOTER_side_banner_html_after']): ?><?php echo ''; ?><?php if ($this->_tpl_vars['before_after'] == 'before'): ?><?php echo ''; ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['INC_FOOTER_side_banner_html_before'])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'side_banner') : smarty_modifier_t_url2cmd($_tmp, 'side_banner')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'side_banner') : smarty_modifier_t_cmd($_tmp, 'side_banner')); ?><?php echo ''; ?><?php else: ?><?php echo ''; ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['INC_FOOTER_side_banner_html_after'])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'side_banner') : smarty_modifier_t_url2cmd($_tmp, 'side_banner')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'side_banner') : smarty_modifier_t_cmd($_tmp, 'side_banner')); ?><?php echo ''; ?><?php endif; ?><?php echo ''; ?><?php else: ?><?php echo ''; ?><?php if ($this->_tpl_vars['INC_FOOTER_inc_side_banner']['a_href']): ?><?php echo '<a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'do_h_click_banner'), $this);?><?php echo '&amp;target_c_banner_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['INC_FOOTER_inc_side_banner']['c_banner_id']); ?><?php echo ''; ?><?php if ($this->_tpl_vars['PHPSESSID']): ?><?php echo '&amp;sessid='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['PHPSESSID']); ?><?php echo ''; ?><?php endif; ?><?php echo '" target="_blank"><img src="'; ?><?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['INC_FOOTER_inc_side_banner']['image_filename'])), $this);?><?php echo '" alt="'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['INC_FOOTER_inc_side_banner']['nickname']); ?><?php echo '" /></a>'; ?><?php else: ?><?php echo '<img src="'; ?><?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['INC_FOOTER_inc_side_banner']['image_filename'])), $this);?><?php echo '" alt="'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['INC_FOOTER_inc_side_banner']['nickname']); ?><?php echo '" />'; ?><?php endif; ?><?php echo ''; ?><?php endif; ?><?php echo ''; ?>

</div>
<?php endif; ?>

<?php if ($this->_tpl_vars['INC_FOOTER_inc_page_bottom2']): ?><?php echo $this->_tpl_vars['INC_FOOTER_inc_page_bottom2']; ?>
<?php endif; ?>
</div><!-- Container -->
<?php if ($this->_tpl_vars['INC_FOOTER_inc_page_bottom']): ?><?php echo $this->_tpl_vars['INC_FOOTER_inc_page_bottom']; ?>
<?php endif; ?>
</div><!-- Body -->
</body>
</html>