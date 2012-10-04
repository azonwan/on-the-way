<?php /* Smarty version 2.6.18, created on 2012-10-04 20:15:16
         compiled from file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_home.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 't_form_block', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_home.tpl', 7, false),array('block', 't_loop', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_home.tpl', 115, false),array('function', 't_img_url_skin', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_home.tpl', 9, false),array('function', 't_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_home.tpl', 36, false),array('function', 't_img_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_home.tpl', 69, false),array('modifier', 't_escape', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_home.tpl', 11, false),array('modifier', 'default', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_home.tpl', 32, false),array('modifier', 't_url2cmd', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_home.tpl', 32, false),array('modifier', 't_cmd', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_home.tpl', 32, false),array('modifier', 't_truncate', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_home.tpl', 99, false),array('modifier', 'escape', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_home.tpl', 99, false),array('modifier', 'date_format', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_home.tpl', 387, false),)), $this); ?>
<div id="LayoutA">
<div id="Top">

<?php if (@DISPLAY_SEARCH_HOME): ?>
<div class="parts searchFormLine">
<?php $this->_tag_stack[] = array('t_form_block', array('m' => 'pc','a' => 'do_h_home_search')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<ul>
<li><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_search'), $this);?>
" alt="search" /></li>
<li><input type="text" class="input_text" name="q" value="" size="30" /></li>
<li><input type="image" class="input_image" src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'button_search_1'), $this);?>
" value="diary" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
" name="diary" /></li>
<li><input type="image" class="input_image" src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'button_search_2'), $this);?>
" value="community" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
" name="community" /></li>
<li><input type="image" class="input_image" src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'button_search_4'), $this);?>
" value="message" alt="短信" name="message" /></li>
<?php if (@USE_EXTRA_SERVICE): ?>
<li><input type="image" class="input_image" src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'button_search_3'), $this);?>
" value="web" alt="web" name="web" /></li>
<?php endif; ?>
</ul>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</div>
<?php endif; ?>

<?php if ($this->_tpl_vars['birthday_flag']): ?>
<div class="parts">
<img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'birthday_h'), $this);?>
" alt="Happy Birthday!" />
</div>
<?php endif; ?>

<div class="parts homeInfoBox">
<div class="body">
<?php echo ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=@$this->_tpl_vars['site_info'])) ? $this->_run_mod_handler('default', true, $_tmp, "&nbsp;") : smarty_modifier_default($_tmp, "&nbsp;")))) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'info') : smarty_modifier_t_url2cmd($_tmp, 'info')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'info') : smarty_modifier_t_cmd($_tmp, 'info')); ?>

<?php if ($this->_tpl_vars['num_f_confirm_list'] || $this->_tpl_vars['num_message_not_is_read'] || $this->_tpl_vars['num_diary_not_is_read'] || $this->_tpl_vars['num_h_confirm_list'] || $this->_tpl_vars['anatani_c_commu_admin_confirm_list'] || $this->_tpl_vars['anatani_c_commu_sub_admin_confirm_list']): ?>
<ul>
<?php if ($this->_tpl_vars['num_f_confirm_list']): ?>
<li>★<span class="caution">等待承认的会员<?php echo smarty_modifier_t_escape($this->_tpl_vars['num_f_confirm_list']); ?>
名！</span> <a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_confirm_list'), $this);?>
"><strong>同意・拒绝</strong></a></li>
<?php endif; ?>
<?php if ($this->_tpl_vars['num_message_not_is_read']): ?>
<li>★<span class="caution">最新留言<?php echo smarty_modifier_t_escape($this->_tpl_vars['num_message_not_is_read']); ?>
条！</span> <a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?>
"><strong>读取消息</strong></a></li>
<?php endif; ?>
<?php if ($this->_tpl_vars['num_diary_not_is_read']): ?>
<li>★<span class="caution"><?php echo smarty_modifier_t_escape($this->_tpl_vars['num_diary_not_is_read']); ?>
条的<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
有新的评论！</span> <a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_diary'), $this);?>
&amp;target_c_diary_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['first_diary_read']); ?>
"><strong>查看<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
</strong></a></li>
<?php endif; ?>
<?php if ($this->_tpl_vars['num_h_confirm_list']): ?>
<li>★<span class="caution">申请加入<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
的会员有<?php echo smarty_modifier_t_escape($this->_tpl_vars['num_h_confirm_list']); ?>
名！</span> <a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_confirm_list'), $this);?>
"><strong>同意・拒绝</strong></a></li>
<?php endif; ?>
<?php if ($this->_tpl_vars['anatani_c_commu_admin_confirm_list']): ?>
<li>★<span class="caution"><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
管理者更换请求<?php echo smarty_modifier_t_escape($this->_tpl_vars['num_anatani_c_commu_admin_confirm_list']); ?>
条。</span> <a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_confirm_list'), $this);?>
"><strong>同意・拒绝</strong></a></li>
<?php endif; ?>
<?php if ($this->_tpl_vars['anatani_c_commu_sub_admin_confirm_list']): ?>
<li>★<span class="caution"><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
副管理者要求<?php echo smarty_modifier_t_escape($this->_tpl_vars['num_anatani_c_commu_sub_admin_confirm_list']); ?>
条。</span> <a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_confirm_list'), $this);?>
"><strong>同意・拒绝</strong></a></li>
<?php endif; ?>
</ul>
<?php endif; ?>
</div>
</div>

<?php if ($this->_tpl_vars['inc_entry_point'][3]): ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['inc_entry_point'][3])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_url2cmd($_tmp, 'entry_point')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_cmd($_tmp, 'entry_point')); ?>
<?php endif; ?>

</div><!-- Top -->
<div id="Left">

<?php if ($this->_tpl_vars['inc_entry_point'][4]): ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['inc_entry_point'][4])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_url2cmd($_tmp, 'entry_point')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_cmd($_tmp, 'entry_point')); ?>
<?php endif; ?>

<div class="dparts homePhotoBox">
<div class="parts">
<p class="photo"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['c_member']['image_filename']),'w' => 180,'h' => 180,'noimg' => 'no_image'), $this);?>
" alt="头像" /></p>
<ul class="moreInfo button">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_config_image'), $this);?>
"><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'button_edit_photo'), $this);?>
" alt="编辑头像" /></a></li>
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_config_prof'), $this);?>
"><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'button_prof_conf'), $this);?>
" alt="资料更改" /></a></li>
</ul>
</div>
<?php if (@OPENPNE_IS_POINT_ADMIN || $this->_tpl_vars['c_member']['c_member_id'] != 1): ?>
<?php if (( @OPENPNE_DISP_RANK && $this->_tpl_vars['rank'] ) || ( @OPENPNE_DISP_POINT && $this->_tpl_vars['point'] )): ?>
<?php if (@OPENPNE_DISP_RANK && $this->_tpl_vars['rank']): ?>
<p class="rank"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['rank']['image_filename'])), $this);?>
" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['rank']['name']); ?>
" /></p>
<?php endif; ?>
<?php if (@OPENPNE_DISP_POINT && $this->_tpl_vars['point']): ?>
<p class="point"><?php echo smarty_modifier_t_escape($this->_tpl_vars['point']); ?>
 Point</p>
<?php endif; ?>
<?php endif; ?>
<?php endif; ?>
<p class="text"><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_member']['nickname']); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_friend_count']); ?>
)</p>
</div>
<?php if ($this->_tpl_vars['inc_entry_point'][5]): ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['inc_entry_point'][5])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_url2cmd($_tmp, 'entry_point')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_cmd($_tmp, 'entry_point')); ?>
<?php endif; ?>

<?php if ($this->_tpl_vars['c_friend_list']): ?>
<div class="parts homeNineTable">
<div class="partsHeading"><h3>朋友名单</h3></div>
<?php if (@OPENPNE_USE_FLASH_LIST): ?>
<?php ob_start(); ?><?php echo ''; ?><?php $_from = $this->_tpl_vars['c_friend_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
?><?php echo ''; ?><?php if ($this->_tpl_vars['key'] > 0): ?><?php echo '&'; ?><?php endif; ?><?php echo 'pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?><?php echo '&pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_name='; ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['item']['nickname'])) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 12, '..') : smarty_modifier_t_truncate($_tmp, 12, '..')))) ? $this->_run_mod_handler('escape', true, $_tmp, 'url') : smarty_modifier_escape($_tmp, 'url')); ?><?php echo '&pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_linkurl='; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home','_urlencode' => true,'_html' => false), $this);?><?php echo '%26target_c_member_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?><?php echo '&pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_imageurl='; ?><?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_image','_urlencode' => true,'_html' => false), $this);?><?php echo '&pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_count='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['friend_count']); ?><?php echo ''; ?><?php endforeach; endif; unset($_from); ?><?php echo ''; ?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('flashvars', ob_get_contents());ob_end_clean(); ?>
<script type="text/javascript" src="js/show_flash.js"></script>
<script type="text/javascript">
//<![CDATA[
show_flash('flash/list.swf', '<?php echo smarty_modifier_t_escape($this->_tpl_vars['flashvars']); ?>
');
//]]>
</script>
<?php else: ?>
<table>
<?php if ($this->_tpl_vars['c_friend_list'][0]): ?>
<tr class="photo">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['c_friend_list'],'start' => 0,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_image'), $this);?>
" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
" /></a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<tr class="text">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['c_friend_list'],'start' => 0,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['friend_count']); ?>
)</a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<?php endif; ?>
<?php if ($this->_tpl_vars['c_friend_list'][3]): ?>
<tr class="photo">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['c_friend_list'],'start' => 3,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_image'), $this);?>
" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
" /></a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<tr class="text">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['c_friend_list'],'start' => 3,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['friend_count']); ?>
)</a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<?php endif; ?>
<?php if ($this->_tpl_vars['c_friend_list'][6]): ?>
<tr class="photo">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['c_friend_list'],'start' => 6,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_image'), $this);?>
" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
" /></a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<tr class="text">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['c_friend_list'],'start' => 6,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['friend_count']); ?>
)</a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<?php endif; ?>
</table>
<?php endif; ?>
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_friend_list'), $this);?>
">所有好友(<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_friend_count']); ?>
人)</a></li>
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_manage_friend'), $this);?>
"><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_MY_FRIEND']); ?>
管理</a></li>
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_invite_home'), $this);?>
">邀请好友</a></li>
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_search'), $this);?>
">寻找朋友</a></li>
</ul>
</div>
</div>
<?php endif; ?>

<?php if ($this->_tpl_vars['inc_entry_point'][6]): ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['inc_entry_point'][6])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_url2cmd($_tmp, 'entry_point')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_cmd($_tmp, 'entry_point')); ?>
<?php endif; ?>

<?php if ($this->_tpl_vars['c_commu_user_list']): ?>
<div class="parts homeNineTable">
<div class="partsHeading"><h3><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
列表</h3></div>
<?php if (@OPENPNE_USE_FLASH_LIST): ?>
<?php ob_start(); ?><?php echo ''; ?><?php $_from = $this->_tpl_vars['c_commu_user_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
?><?php echo ''; ?><?php if ($this->_tpl_vars['key'] > 0): ?><?php echo '&'; ?><?php endif; ?><?php echo 'pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_id']); ?><?php echo '&pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_name='; ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['item']['name'])) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 12, '..') : smarty_modifier_t_truncate($_tmp, 12, '..')))) ? $this->_run_mod_handler('escape', true, $_tmp, 'url') : smarty_modifier_escape($_tmp, 'url')); ?><?php echo '&pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_linkurl='; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_c_home','_urlencode' => true,'_html' => false), $this);?><?php echo '%26target_c_commu_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_id']); ?><?php echo '&pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_imageurl='; ?><?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_logo_small','_urlencode' => true,'_html' => false), $this);?><?php echo '&pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_count='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['count_commu_members']); ?><?php echo ''; ?><?php endforeach; endif; unset($_from); ?><?php echo ''; ?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('flashvars', ob_get_contents());ob_end_clean(); ?>
<script type="text/javascript" src="js/show_flash.js"></script>
<script type="text/javascript">
//<![CDATA[
show_flash('flash/list.swf', '<?php echo smarty_modifier_t_escape($this->_tpl_vars['flashvars']); ?>
');
//]]>
</script>
<?php else: ?>
<table>
<?php if ($this->_tpl_vars['c_commu_user_list'][0]): ?>
<tr class="photo">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['c_commu_user_list'],'start' => 0,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><?php if ($this->_tpl_vars['item']['c_member_id_admin'] == $this->_tpl_vars['c_member']['c_member_id']): ?><p class="crown"><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_crown'), $this);?>
" alt="" /></p><?php endif; ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_c_home'), $this);?>
&amp;target_c_commu_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_id']); ?>
"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_logo_small'), $this);?>
" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['name']); ?>
" /></a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<tr class="text">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['c_commu_user_list'],'start' => 0,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_c_home'), $this);?>
&amp;target_c_commu_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_id']); ?>
"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['name']); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['count_commu_members']); ?>
)</a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<?php endif; ?>
<?php if ($this->_tpl_vars['c_commu_user_list'][3]): ?>
<tr class="photo">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['c_commu_user_list'],'start' => 3,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><?php if ($this->_tpl_vars['item']['c_member_id_admin'] == $this->_tpl_vars['c_member']['c_member_id']): ?><p class="crown"><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_crown'), $this);?>
" alt="" /></p><?php endif; ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_c_home'), $this);?>
&amp;target_c_commu_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_id']); ?>
"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_logo_small'), $this);?>
" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['name']); ?>
" /></a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<tr class="text">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['c_commu_user_list'],'start' => 3,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_c_home'), $this);?>
&amp;target_c_commu_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_id']); ?>
"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['name']); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['count_commu_members']); ?>
)</a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<?php endif; ?>
<?php if ($this->_tpl_vars['c_commu_user_list'][6]): ?>
<tr class="photo">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['c_commu_user_list'],'start' => 6,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><?php if ($this->_tpl_vars['item']['c_member_id_admin'] == $this->_tpl_vars['c_member']['c_member_id']): ?><p class="crown"><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_crown'), $this);?>
" alt="" /></p><?php endif; ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_c_home'), $this);?>
&amp;target_c_commu_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_id']); ?>
"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_logo_small'), $this);?>
" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['name']); ?>
" /></a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<tr class="text">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['c_commu_user_list'],'start' => 6,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_c_home'), $this);?>
&amp;target_c_commu_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_id']); ?>
"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['name']); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['count_commu_members']); ?>
)</a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<?php endif; ?>
</table>
<?php endif; ?>
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_com_list'), $this);?>
">浏览全部(<?php echo smarty_modifier_t_escape($this->_tpl_vars['fh_com_count_user']); ?>
)</a></li>
</ul>
</div>
</div>
<?php endif; ?>

<?php if ($this->_tpl_vars['bookmark_member_list']): ?>
<div class="parts homeNineTable">
<div class="partsHeading"><h3>收藏夹列表</h3></div>
<?php if (@OPENPNE_USE_FLASH_LIST): ?>
<?php ob_start(); ?><?php echo ''; ?><?php $_from = $this->_tpl_vars['bookmark_member_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
?><?php echo ''; ?><?php if ($this->_tpl_vars['key'] > 0): ?><?php echo '&'; ?><?php endif; ?><?php echo 'pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?><?php echo '&pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_name='; ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['item']['nickname'])) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 12, '..') : smarty_modifier_t_truncate($_tmp, 12, '..')))) ? $this->_run_mod_handler('escape', true, $_tmp, 'url') : smarty_modifier_escape($_tmp, 'url')); ?><?php echo '&pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_linkurl='; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home','_urlencode' => true,'_html' => false), $this);?><?php echo '%26target_c_member_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?><?php echo '&pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_imageurl='; ?><?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_image','_urlencode' => true,'_html' => false), $this);?><?php echo '&pne_item'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['key']+1); ?><?php echo '_count='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['friend_count']); ?><?php echo ''; ?><?php endforeach; endif; unset($_from); ?><?php echo ''; ?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('flashvars', ob_get_contents());ob_end_clean(); ?>
<script type="text/javascript" src="js/show_flash.js"></script>
<script type="text/javascript">
//<![CDATA[
show_flash('flash/list.swf', '<?php echo smarty_modifier_t_escape($this->_tpl_vars['flashvars']); ?>
');
//]]>
</script>
<?php else: ?>
<table>
<?php if ($this->_tpl_vars['bookmark_member_list'][0]): ?>
<tr class="photo">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['bookmark_member_list'],'start' => 0,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_image'), $this);?>
" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
" /></a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<tr class="text">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['bookmark_member_list'],'start' => 0,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['friend_count']); ?>
)</a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<?php endif; ?>
<?php if ($this->_tpl_vars['bookmark_member_list'][3]): ?>
<tr class="photo">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['bookmark_member_list'],'start' => 3,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_image'), $this);?>
" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
" /></a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<tr class="text">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['bookmark_member_list'],'start' => 3,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['friend_count']); ?>
)</a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<?php endif; ?>
<?php if ($this->_tpl_vars['bookmark_member_list'][6]): ?>
<tr class="photo">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['bookmark_member_list'],'start' => 6,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_image'), $this);?>
" alt="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
" /></a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<tr class="text">
<?php $this->_tag_stack[] = array('t_loop', array('from' => $this->_tpl_vars['bookmark_member_list'],'start' => 6,'num' => 3)); $_block_repeat=true;smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<td><?php if ($this->_tpl_vars['item']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['friend_count']); ?>
)</a><?php endif; ?></td>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_loop($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</tr>
<?php endif; ?>
</table>
<?php endif; ?>
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_bookmark_list'), $this);?>
">查看全部(<?php echo smarty_modifier_t_escape($this->_tpl_vars['bookmark_count']); ?>
)</a></li>
</ul>
</div>
</div>
<?php endif; ?>

<?php if ($this->_tpl_vars['inc_entry_point'][7]): ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['inc_entry_point'][7])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_url2cmd($_tmp, 'entry_point')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_cmd($_tmp, 'entry_point')); ?>
<?php endif; ?>

</div><!-- Left -->
<div id="Center">

<?php if ($this->_tpl_vars['inc_entry_point'][8]): ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['inc_entry_point'][8])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_url2cmd($_tmp, 'entry_point')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_cmd($_tmp, 'entry_point')); ?>
<?php endif; ?>

<?php if ($this->_tpl_vars['calendar']): ?>
<div class="dparts weeklyCalendarTable"><div class="parts">
<div class="block">
<?php $this->_tag_stack[] = array('t_form_block', array('m' => 'pc','a' => 'do_h_home_insert_c_schedule')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<input type="hidden" name="w" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['w']); ?>
" />
<label for="title">计划</label> <input type="text" class="input_text" name="title" id="title" value="" size="24" />
<select name="start_date">
<?php $_from = $this->_tpl_vars['calendar']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<option value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['year']); ?>
-<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['month']); ?>
-<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['day']); ?>
"<?php if ($this->_tpl_vars['item']['now']): ?> selected="selected"<?php endif; ?>><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['month']); ?>
/<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['day']); ?>
(<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['dayofweek']); ?>
)</option>
<?php endforeach; endif; unset($_from); ?>
</select>
<input type="submit" class="input_submit" value="添加" />
<a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_home'), $this);?>
&amp;w=<?php echo smarty_modifier_t_escape($this->_tpl_vars['w']-1); ?>
" title="上周">＜</a>
<a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_home'), $this);?>
" title="这周">■</a>
<a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_home'), $this);?>
&amp;w=<?php echo smarty_modifier_t_escape($this->_tpl_vars['w']+1); ?>
" title="下周">＞</a>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</div>

<table class="calendar">
<tr>
<?php $_from = $this->_tpl_vars['calendar']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['calendar'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['calendar']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['item']):
        $this->_foreach['calendar']['iteration']++;
?>
<?php echo '<td'; ?><?php if ($this->_tpl_vars['item']['now']): ?><?php echo ' class="today"'; ?><?php endif; ?><?php echo '><p class="day'; ?><?php if ($this->_tpl_vars['item']['dayofweek'] == "日"): ?><?php echo ' sun'; ?><?php elseif ($this->_tpl_vars['item']['dayofweek'] == "土"): ?><?php echo ' sat'; ?><?php endif; ?><?php echo ''; ?><?php if ($this->_tpl_vars['item']['holiday']): ?><?php echo ' holiday'; ?><?php endif; ?><?php echo '">'; ?><?php if (($this->_foreach['calendar']['iteration'] <= 1) || $this->_tpl_vars['item']['day'] == 1): ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['month']); ?><?php echo '/'; ?><?php endif; ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['day']); ?><?php echo '<br />('; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['dayofweek']); ?><?php echo ')'; ?><?php $_from = $this->_tpl_vars['item']['holiday']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item_holiday']):
?><?php echo '<br />'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item_holiday']); ?><?php echo ''; ?><?php endforeach; endif; unset($_from); ?><?php echo '</p>'; ?><?php echo ''; ?><?php $_from = $this->_tpl_vars['item']['birth']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item_birth']):
?><?php echo ''; ?><?php if ($this->_tpl_vars['item_birth']['public_flag_birth_month_day'] != 'private' || $this->_tpl_vars['c_member']['c_member_id'] == $this->_tpl_vars['item_birth']['c_member_id']): ?><?php echo '<p><img src="'; ?><?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_birthday'), $this);?><?php echo '" alt="生日" /><a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?><?php echo '&amp;target_c_member_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item_birth']['c_member_id']); ?><?php echo '">'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item_birth']['nickname']); ?><?php echo '</a></p>'; ?><?php endif; ?><?php echo ''; ?><?php endforeach; endif; unset($_from); ?><?php echo ''; ?><?php echo ''; ?><?php $_from = $this->_tpl_vars['item']['event']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item_event']):
?><?php echo '<p><img src="'; ?><?php if ($this->_tpl_vars['item_event']['is_join']): ?><?php echo ''; ?><?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_event_R'), $this);?><?php echo ''; ?><?php else: ?><?php echo ''; ?><?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_event_B'), $this);?><?php echo ''; ?><?php endif; ?><?php echo '" alt="活动" /><a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_c_event_detail'), $this);?><?php echo '&amp;target_c_commu_topic_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item_event']['c_commu_topic_id']); ?><?php echo '">'; ?><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item_event']['name']))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 20, "..") : smarty_modifier_t_truncate($_tmp, 20, "..")); ?><?php echo '</a></p>'; ?><?php endforeach; endif; unset($_from); ?><?php echo ''; ?><?php echo ''; ?><?php $_from = $this->_tpl_vars['item']['schedule']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item_schedule']):
?><?php echo '<p><img src="'; ?><?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_pen'), $this);?><?php echo '" alt="预定" /><a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_schedule'), $this);?><?php echo '&amp;target_c_schedule_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item_schedule']['c_schedule_id']); ?><?php echo '">'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item_schedule']['title']); ?><?php echo '</a></p>'; ?><?php endforeach; endif; unset($_from); ?><?php echo '</td>'; ?>

<?php endforeach; endif; unset($_from); ?>
</tr>
</table>

<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_calendar'), $this);?>
">各月日历</a></li>
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_config'), $this);?>
#is_display_schedule_home_0">显示设定</a></li>
</ul>
</div>

</div></div>
<?php endif; ?>

<?php if ($this->_tpl_vars['inc_entry_point'][9]): ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['inc_entry_point'][9])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_url2cmd($_tmp, 'entry_point')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_cmd($_tmp, 'entry_point')); ?>
<?php endif; ?>

<?php if ($this->_tpl_vars['c_diary_friend_list'] || $this->_tpl_vars['c_rss_cache_list'] || $this->_tpl_vars['c_diary_my_comment_list'] || $this->_tpl_vars['c_commu_topic_comment_list'] || $this->_tpl_vars['c_friend_review_list']): ?>
<div class="dparts homeMainTable"><div class="parts">
<div class="partsHeading"><h3>好友动态</h3></div>
<table>
<?php if ($this->_tpl_vars['c_diary_friend_list']): ?>
<tr class="myFriendRecentDiary"><th>最新<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
</th><td>
<ul class="articleList">
<?php $_from = $this->_tpl_vars['c_diary_friend_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<li><span class="date"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_diary'), $this);?>
&amp;target_c_diary_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_diary_id']); ?>
&amp;comment_count=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['count_comments']); ?>
"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['subject']))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 30) : smarty_modifier_t_truncate($_tmp, 30)); ?>
 (<?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['count_comments']))) ? $this->_run_mod_handler('default', true, $_tmp, 0) : smarty_modifier_default($_tmp, 0)); ?>
)</a> (<?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']))) ? $this->_run_mod_handler('default', true, $_tmp, "&nbsp;") : smarty_modifier_default($_tmp, "&nbsp;")); ?>
) <?php if ($this->_tpl_vars['item']['image_filename_1'] || $this->_tpl_vars['item']['image_filename_2'] || $this->_tpl_vars['item']['image_filename_3']): ?><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_camera'), $this);?>
" alt="有照片" /><?php endif; ?></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_diary_list_friend'), $this);?>
">更多</a></li>
</ul></div>
</td></tr>
<?php endif; ?>
<?php if ($this->_tpl_vars['c_rss_cache_list']): ?>
<tr class="myFriendRecentDiary"><th>最新Blog</th><td>
<ul class="articleList">
<?php $_from = $this->_tpl_vars['c_rss_cache_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<li><span class="date"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span><a href="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['link']); ?>
" target="_blank"><?php echo ((is_array($_tmp=((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['subject']))) ? $this->_run_mod_handler('default', true, $_tmp, "&nbsp;") : smarty_modifier_default($_tmp, "&nbsp;")))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 30) : smarty_modifier_t_truncate($_tmp, 30)); ?>
</a> (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member']['nickname']); ?>
)</li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_diary_list_friend'), $this);?>
#blog">更多</a></li>
</ul></div>
</td></tr>
<?php endif; ?>
<?php if ($this->_tpl_vars['c_diary_my_comment_list']): ?>
<tr class="diaryCommentHistory"><th>我的留言</th><td>
<ul class="articleList">
<?php $_from = $this->_tpl_vars['c_diary_my_comment_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<li><span class="date"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_diary'), $this);?>
&amp;target_c_diary_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_diary_id']); ?>
&amp;comment_count=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['num_comment']); ?>
"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['subject']))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 30) : smarty_modifier_t_truncate($_tmp, 30)); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['num_comment']); ?>
)</a> (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
)</li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_diary_comment_list'), $this);?>
">更多</a></li>
</ul></div>
</td></tr>
<?php endif; ?>
<?php if ($this->_tpl_vars['c_commu_topic_comment_list']): ?>
<tr class="recentCommunityTopicComment"><th>圈内新帖</th><td>
<ul class="articleList">
<?php $_from = $this->_tpl_vars['c_commu_topic_comment_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<li><span class="date"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_c_topic_detail'), $this);?>
&amp;target_c_commu_topic_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_topic_id']); ?>
&amp;comment_count=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['number']); ?>
"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_topic_name']))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 30) : smarty_modifier_t_truncate($_tmp, 30)); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['number']); ?>
)</a> (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_name']); ?>
) <?php if ($this->_tpl_vars['item']['image_filename1'] || $this->_tpl_vars['item']['image_filename2'] || $this->_tpl_vars['item']['image_filename3']): ?><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_camera'), $this);?>
" alt="有照片" /><?php endif; ?></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_com_comment_list'), $this);?>
">更多</a></li>
</ul></div>
</td></tr>
<?php endif; ?>

<?php if ($this->_tpl_vars['c_friend_album_list']): ?>
<tr class="myFriendRecentAlbum"><th>最新相册</th><td>
<ul class="friendAlbumListUl">
<?php $_from = $this->_tpl_vars['c_friend_album_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<li class="friendAlbumList"><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_album'), $this);?>
&amp;target_c_album_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_album_id']); ?>
"><img src="img.php?filename=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['album_cover_image']); ?>
&w=180&h=180&m=pc" width="60" height="80"/></a></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div style="clear:both;"></div>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_album_list_friend'), $this);?>
">更多</a></li>
</ul></div>
</td></tr>
<?php endif; ?>
</table>
</div></div>
<?php endif; ?>

<?php if ($this->_tpl_vars['c_diary_list_all'] || $this->_tpl_vars['c_topic_list_all']): ?>
<div class="dparts homeMainTable"><div class="parts">
<div class="partsHeading"><h3>大家的最新信息</h3><p class="link"><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_config'), $this);?>
#is_display_newdiary_home_0">显示设定</a></p></div>
<table>
<?php if ($this->_tpl_vars['c_diary_list_all']): ?>
<tr class="allRecentDiary"><th>最新日志</th><td>
<ul class="articleList">
<?php $_from = $this->_tpl_vars['c_diary_list_all']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<li><span class="date"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_diary'), $this);?>
&amp;target_c_diary_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_diary_id']); ?>
&amp;comment_count=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['count_comments']); ?>
"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['subject']))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 30) : smarty_modifier_t_truncate($_tmp, 30)); ?>
 (<?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['count_comments']))) ? $this->_run_mod_handler('default', true, $_tmp, 0) : smarty_modifier_default($_tmp, 0)); ?>
)</a> (<?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']))) ? $this->_run_mod_handler('default', true, $_tmp, "&nbsp;") : smarty_modifier_default($_tmp, "&nbsp;")); ?>
) <?php if ($this->_tpl_vars['item']['image_filename_1'] || $this->_tpl_vars['item']['image_filename_2'] || $this->_tpl_vars['item']['image_filename_3']): ?><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_camera'), $this);?>
" alt="有照片" /><?php endif; ?></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_diary_list_all'), $this);?>
">更多</a></li>
</ul></div>
</td></tr>
<?php endif; ?>
<?php if ($this->_tpl_vars['c_topic_list_all']): ?>
<tr class="allRecentCommunityTopicComment"><th>最新帖子</th><td>
<ul class="articleList">
<?php $_from = $this->_tpl_vars['c_topic_list_all']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<li><span class="date"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['u_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_c_topic_detail'), $this);?>
&amp;target_c_commu_topic_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_topic_id']); ?>
&amp;comment_count=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['number']); ?>
"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['name']))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 30) : smarty_modifier_t_truncate($_tmp, 30)); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['number']); ?>
)</a> (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_name']); ?>
) <?php if ($this->_tpl_vars['item']['image_filename1'] || $this->_tpl_vars['item']['image_filename2'] || $this->_tpl_vars['item']['image_filename3']): ?><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_camera'), $this);?>
" alt="有照片" /><?php endif; ?></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_com_topic_find_all'), $this);?>
">更多</a></li>
</ul></div>
</td></tr>
<?php endif; ?>
</table>
</div></div>
<?php endif; ?>

<?php if ($this->_tpl_vars['bookmark_diary_list'] || $this->_tpl_vars['bookmark_blog_list']): ?>
<div class="dparts homeMainTable"><div class="parts">
<div class="partsHeading"><h3>收藏夹的最新信息</h3><p class="link"><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_config'), $this);?>
#is_display_bookmark_diary_home_0">显示设定变更</a></p></div>
<table>
<?php if ($this->_tpl_vars['bookmark_diary_list']): ?>
<tr class="bookmarkRecentDiary"><th>收藏夹<br />最新<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
</th><td>
<ul class="articleList">
<?php $_from = $this->_tpl_vars['bookmark_diary_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<li><span class="date"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_diary'), $this);?>
&amp;target_c_diary_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_diary_id']); ?>
&amp;comment_count=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['count_comments']); ?>
"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['subject']))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 30) : smarty_modifier_t_truncate($_tmp, 30)); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['count_comments']); ?>
)</a> (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
) <?php if ($this->_tpl_vars['item']['image_filename_1'] || $this->_tpl_vars['item']['image_filename_2'] || $this->_tpl_vars['item']['image_filename_3']): ?><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_camera'), $this);?>
" alt="有照片" /><?php endif; ?></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_bookmark_diary_blog_list'), $this);?>
">更多</a></li>
</ul></div>
</td></tr>
<?php endif; ?>
<?php if ($this->_tpl_vars['bookmark_blog_list']): ?>
<tr class="bookmarkRecentBlog"><th>收藏夹<br />最新Blog</th><td>
<ul class="articleList">
<?php $_from = $this->_tpl_vars['bookmark_blog_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<li><span class="date"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span><a href="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['link']); ?>
" target="_blank"><?php echo ((is_array($_tmp=((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['subject']))) ? $this->_run_mod_handler('default', true, $_tmp, "&nbsp;") : smarty_modifier_default($_tmp, "&nbsp;")))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 30) : smarty_modifier_t_truncate($_tmp, 30)); ?>
</a> (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
)</li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_bookmark_diary_blog_list'), $this);?>
#blog">更多</a></li>
</ul></div>
</td></tr>
<?php endif; ?>
</table>
</div></div>
<?php endif; ?>

<?php if ($this->_tpl_vars['inc_entry_point'][10]): ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['inc_entry_point'][10])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_url2cmd($_tmp, 'entry_point')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_cmd($_tmp, 'entry_point')); ?>
<?php endif; ?>

<div class="dparts homeMainTable"><div class="parts">
<div class="partsHeading"><h3><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_member']['nickname']); ?>
的最新动态</h3></div>
<table>
<?php if ($this->_tpl_vars['c_diary_list']): ?>
<tr class="myRecentDiary"><th><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
</th><td>
<ul class="articleList">
<?php $_from = $this->_tpl_vars['c_diary_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<li><span class="date"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_diary'), $this);?>
&amp;target_c_diary_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_diary_id']); ?>
&amp;comment_count=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['comment_count']); ?>
"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['subject']))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 30) : smarty_modifier_t_truncate($_tmp, 30)); ?>
 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['comment_count']); ?>
)</a> <?php if ($this->_tpl_vars['item']['image_filename_1'] || $this->_tpl_vars['item']['image_filename_2'] || $this->_tpl_vars['item']['image_filename_3']): ?><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_camera'), $this);?>
" alt="有照片" /><?php endif; ?></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_diary_list'), $this);?>
">更多</a></li>
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_diary_add'), $this);?>
">写<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
</a></li>
</ul></div>
</td></tr>
<?php endif; ?>
<?php if ($this->_tpl_vars['c_blog_list']): ?>
<tr class="myRecentBlog"><th>Blog</th><td>
<ul class="articleList">
<?php $_from = $this->_tpl_vars['c_blog_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<li><span class="date"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span><a href="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['link']); ?>
" target="_blank"><?php echo ((is_array($_tmp=((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['subject']))) ? $this->_run_mod_handler('default', true, $_tmp, "&nbsp;") : smarty_modifier_default($_tmp, "&nbsp;")))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 30) : smarty_modifier_t_truncate($_tmp, 30)); ?>
</a></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_diary_list'), $this);?>
#blog">更多</a></li>
</ul></div>
</td></tr>
<?php endif; ?>

<?php if ($this->_tpl_vars['c_album_list']): ?>
<tr class="myRecentAlbum"><th>相册</th><td>
<ul class="articleList">
<?php $_from = $this->_tpl_vars['c_album_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<li><span class="date"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['u_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_album'), $this);?>
&amp;target_c_album_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_album_id']); ?>
"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['subject']))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 30) : smarty_modifier_t_truncate($_tmp, 30)); ?>
</a></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_album_list'), $this);?>
">更多</a></li>
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_album_add'), $this);?>
">添加相册</a></li>
</ul></div>
</td></tr>
<?php endif; ?>
<?php if (! $this->_tpl_vars['c_diary_list'] || ! $this->_tpl_vars['c_review_list'] || ( ! $this->_tpl_vars['c_album_list'] && @OPENPNE_USE_ALBUM )): ?>
<tr><td class="halfway" colspan="2"><ul class="moreInfo">
<?php if (! $this->_tpl_vars['c_diary_list']): ?><li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_diary_add'), $this);?>
">写<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
</a></li><?php endif; ?>

<?php if (! $this->_tpl_vars['c_album_list'] && @OPENPNE_USE_ALBUM): ?><li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_album_add'), $this);?>
">添加相册</a></li><?php endif; ?>
</ul>
</td></tr>
<?php endif; ?>
</table>
</div></div>

<?php if ($this->_tpl_vars['inc_entry_point'][11]): ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['inc_entry_point'][11])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_url2cmd($_tmp, 'entry_point')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_cmd($_tmp, 'entry_point')); ?>
<?php endif; ?>

<?php if ($this->_tpl_vars['c_friend_intro_list']): ?>
<div class="dparts friendIntroList"><div class="parts">
<div class="partsHeading"><h3><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_MY_FRIEND']); ?>
对我的印象</h3></div>
<table>
<?php $_from = $this->_tpl_vars['c_friend_intro_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<tr>
<th><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
"><img src="<?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['image_filename']),'w' => 76,'h' => 76,'noimg' => 'no_image'), $this);?>
" alt="" /><br /><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
</a></th>
<td><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['intro']))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 36, "", 3) : smarty_modifier_t_truncate($_tmp, 36, "", 3)); ?>
</td>
</tr>
<?php endforeach; endif; unset($_from); ?>
</table>
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_fh_intro'), $this);?>
">浏览全部</a></li>
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_manage_friend'), $this);?>
">印象管理</a></li>
</ul>
</div>
</div></div>
<?php endif; ?>

<?php if ($this->_tpl_vars['inc_entry_point'][12]): ?><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['inc_entry_point'][12])) ? $this->_run_mod_handler('t_url2cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_url2cmd($_tmp, 'entry_point')))) ? $this->_run_mod_handler('t_cmd', true, $_tmp, 'entry_point') : smarty_modifier_t_cmd($_tmp, 'entry_point')); ?>
<?php endif; ?>

</div><!-- Center -->
</div><!-- LayoutA -->