<?php /* Smarty version 2.6.18, created on 2012-10-04 20:16:42
         compiled from file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_bookmark_list.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 't_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_bookmark_list.tpl', 23, false),array('function', 't_img_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_bookmark_list.tpl', 33, false),array('function', 't_img_url_skin', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_bookmark_list.tpl', 38, false),array('modifier', 't_escape', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_bookmark_list.tpl', 23, false),array('modifier', 't_truncate', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_bookmark_list.tpl', 36, false),)), $this); ?>
<div id="LayoutC">
<div id="Center">

<?php if (! $this->_tpl_vars['c_members_num']): ?>

<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>收藏</h3></div>
<div class="block">
<p>目前收藏夹中没有收藏的内容。</p>
</div>
</div></div>

<?php else: ?>

<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>收藏</h3></div>

<?php ob_start(); ?><?php echo '<div class="pagerRelative">'; ?><?php if ($this->_tpl_vars['is_prev']): ?><?php echo '<p class="prev"><a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_bookmark_list'), $this);?><?php echo '&amp;page='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['page']-1); ?><?php echo '">上一页</a></p>'; ?><?php endif; ?><?php echo '<p class="number">'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['pager_index']['displaying_first']); ?><?php echo '条～'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['pager_index']['displaying_last']); ?><?php echo '条 记录</p>'; ?><?php if ($this->_tpl_vars['is_next']): ?><?php echo '<p class="next"><a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_bookmark_list'), $this);?><?php echo '&amp;page='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['page']+1); ?><?php echo '">下一页</a></p>'; ?><?php endif; ?><?php echo '</div>'; ?>
<?php $this->_smarty_vars['capture']['pager'] = ob_get_contents(); ob_end_clean(); ?>
<?php echo $this->_smarty_vars['capture']['pager']; ?>


<div class="block">
<?php $_from = $this->_tpl_vars['c_members']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['c_member']):
?>
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="3"><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_member']['c_member_id']); ?>
"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['c_member']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_image'), $this);?>
" alt="" /></a></td>
<th><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_NICKNAME']); ?>
</th><td><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_member']['nickname']); ?>
</td>
</tr><tr>
<th>自我介绍</th><td><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['c_member']['profile']['self_intro']['value']))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 36, "", 3) : smarty_modifier_t_truncate($_tmp, 36, "", 3)); ?>
</td>
</tr><tr class="operation">
<th>最终登录</th><td><span class="text"><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_member']['last_login']); ?>
</span> <span class="moreInfo"><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_member']['c_member_id']); ?>
"><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'button_shosai'), $this);?>
" alt="查看详细" /></a> <a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'do_f_bookmark_delete'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_member']['c_member_id']); ?>
&amp;sessid=<?php echo smarty_modifier_t_escape($this->_tpl_vars['PHPSESSID']); ?>
"><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'button_sakujo'), $this);?>
" alt="删除" /></a></span></td>
</tr></table></div></div>
<?php endforeach; endif; unset($_from); ?>
</div>

<?php echo $this->_smarty_vars['capture']['pager']; ?>


</div></div>
<?php endif; ?>

</div><!-- Center -->
</div><!-- LayoutC -->