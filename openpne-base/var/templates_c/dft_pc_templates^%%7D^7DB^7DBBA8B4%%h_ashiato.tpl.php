<?php /* Smarty version 2.6.18, created on 2012-10-04 20:16:37
         compiled from file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_ashiato.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 't_escape', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_ashiato.tpl', 10, false),array('modifier', 'date_format', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_ashiato.tpl', 16, false),array('modifier', 'default', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_ashiato.tpl', 16, false),array('function', 't_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_ashiato.tpl', 16, false),array('function', 't_img_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_ashiato.tpl', 16, false),)), $this); ?>
<div id="LayoutC">
<div id="Center">

<?php if ($this->_tpl_vars['c_ashiato_list']): ?>

<div class="dparts ashiatoList"><div class="parts">
<div class="partsHeading"><h3>访客</h3></div>
<div class="partsInfo">
<p><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_member']['nickname']); ?>
的访问者。最新显示到30件，同一人物、同一日期的访问者只表示最新到访时间。 </p>
</div>
<div class="item">
<p>页面全体的访问数：<strong><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_ashiato_num']); ?>
</strong> 次</p>
<ul class="list">
<?php $_from = $this->_tpl_vars['c_ashiato_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['c_ashiato']):
?>
<li><div class="ashiatoTime"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['c_ashiato']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%Y年%m月%d日 %H:%M") : smarty_modifier_date_format($_tmp, "%Y年%m月%d日 %H:%M")); ?>
</div><div class="ashiatoPic"><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_ashiato']['c_member_id_from']); ?>
"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['c_ashiato']['image_filename']),'w' => 40,'h' => 40,'noimg' => 'no_image'), $this);?>
" alt="" /></a></div><div class="ashiatoName"> <a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_ashiato']['c_member_id_from']); ?>
"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['c_ashiato']['nickname']))) ? $this->_run_mod_handler('default', true, $_tmp, "&nbsp;") : smarty_modifier_default($_tmp, "&nbsp;")); ?>
</a></div></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
</div>
</div></div>

<?php else: ?>

<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>访客</h3></div>
<div class="block">
<p>目前还没有朋友访问过你的主页。</p>
</div>
</div></div>

<?php endif; ?>

</div><!-- Center -->
</div><!-- LayoutC -->