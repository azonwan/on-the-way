<?php /* Smarty version 2.6.18, created on 2012-10-04 20:16:08
         compiled from file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_message_box.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 't_form_block', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_message_box.tpl', 7, false),array('modifier', 't_escape', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_message_box.tpl', 8, false),array('modifier', 'date_format', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_message_box.tpl', 201, false),array('function', 't_img_url_skin', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_message_box.tpl', 10, false),array('function', 't_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_message_box.tpl', 74, false),)), $this); ?>
<div id="LayoutB">

<?php if ($this->_tpl_vars['box'] == 'inbox' || ! $this->_tpl_vars['box']): ?>

<div class="parts searchFormLine">
<?php $this->_tag_stack[] = array('t_form_block', array('_method' => 'get','m' => 'pc','a' => 'page_h_message_box')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<input type="hidden" name="box" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['box']); ?>
" />
<ul>
<li><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_search'), $this);?>
" alt="search" /></li>
<li><label for="keyword">关键词</label><input type="text" class="input_text" name="keyword" id="keyword" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['keyword']); ?>
" size="20" /></li>
<li><label for="target_c_member_id">送信人</label><select name="target_c_member_id" id="target_c_member_id">
<option value="">无指定</option>
<?php $_from = $this->_tpl_vars['c_message_sender_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<option value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id_from']); ?>
"<?php if ($this->_tpl_vars['target_c_member_id'] == $this->_tpl_vars['item']['c_member_id_from']): ?> selected="selected"<?php endif; ?>><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
</option>
<?php endforeach; endif; unset($_from); ?>
</select></li>
<li><input type="submit" class="input_submit" value="检  索" /></li>
</ul>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</div>

<?php elseif ($this->_tpl_vars['box'] == 'outbox'): ?>

<div class="parts searchFormLine">
<?php $this->_tag_stack[] = array('t_form_block', array('_method' => 'get','m' => 'pc','a' => 'page_h_message_box')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<input type="hidden" name="box" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['box']); ?>
" />
<ul>
<li><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_search'), $this);?>
" alt="search" /></li>
<li><label for="keyword">关键字</label><input type="text" class="input_text" name="keyword" id="keyword" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['keyword']); ?>
" size="20" /></li>
<li><label for="target_c_member_id">地址</label><select name="target_c_member_id" id="target_c_member_id">
<option value="">无指定</option>
<?php $_from = $this->_tpl_vars['c_message_receiver_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<option value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id_to']); ?>
"<?php if ($this->_tpl_vars['target_c_member_id'] == $this->_tpl_vars['item']['c_member_id_to']): ?> selected="selected"<?php endif; ?>><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
</option>
<?php endforeach; endif; unset($_from); ?>
</select></li>
<li><input type="submit" class="input_submit" value="检  索" /></li>
</ul>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</div>

<?php endif; ?>

<div id="Left">

<script type="text/javascript">
//<![CDATA[
function checkAll() {
    var sm = document.h_message_box_delete_message;
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = true;
    }
    return false;
}
function clearAll() {
    var sm = document.h_message_box_delete_message;
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = false;
    }
    return false;
}
//]]>
</script>

<div class="parts sideNav">

<div class="item pageNav"><ul>
<?php if ($this->_tpl_vars['box'] != 'inbox'): ?><li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?>
&amp;box=inbox">收信箱</a></li>
<?php else: ?><li class="looking">收信箱</li>
<?php endif; ?>
<?php if ($this->_tpl_vars['box'] != 'outbox'): ?><li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?>
&amp;box=outbox">发信箱</a></li>
<?php else: ?><li class="looking">发信箱</li>
<?php endif; ?>
<?php if ($this->_tpl_vars['box'] != 'savebox'): ?><li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?>
&amp;box=savebox">草稿箱</a></li>
<?php else: ?><li class="looking">草稿箱</li>
<?php endif; ?>
<?php if ($this->_tpl_vars['box'] != 'trash'): ?><li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?>
&amp;box=trash">回收站</a></li>
<?php else: ?><li class="looking">回收站</li>
<?php endif; ?>
</ul></div>

<?php if ($this->_tpl_vars['calendar']): ?>
<div class="item calendar">
<div class="partsHeading"><h3>
<?php if ($this->_tpl_vars['ym']['prev_month']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['target_member']['c_member_id']); ?>
&amp;box=<?php echo smarty_modifier_t_escape($this->_tpl_vars['box']); ?>
&amp;year=<?php echo smarty_modifier_t_escape($this->_tpl_vars['ym']['prev_year']); ?>
&amp;month=<?php echo smarty_modifier_t_escape($this->_tpl_vars['ym']['prev_month']); ?>
">＜</a><?php endif; ?>
<?php echo smarty_modifier_t_escape($this->_tpl_vars['date_val']['month']); ?>
月的日历
<?php if ($this->_tpl_vars['ym']['next_month']): ?><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['target_member']['c_member_id']); ?>
&amp;box=<?php echo smarty_modifier_t_escape($this->_tpl_vars['box']); ?>
&amp;year=<?php echo smarty_modifier_t_escape($this->_tpl_vars['ym']['next_year']); ?>
&amp;month=<?php echo smarty_modifier_t_escape($this->_tpl_vars['ym']['next_month']); ?>
">＞</a><?php endif; ?>
</h3></div>
<table class="calendar">
<tr>
<th class="sun">日</th>
<th class="mon">一</th>
<th class="tue">二</th>
<th class="wed">三</th>
<th class="thu">四</th>
<th class="fri">五</th>
<th class="sat">六</th>
</tr><?php $_from = $this->_tpl_vars['calendar']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['week']):
?><tr>
<?php $_from = $this->_tpl_vars['week']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['calendar_days'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['calendar_days']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['item']):
        $this->_foreach['calendar_days']['iteration']++;
?>
<td><?php echo ''; ?><?php if ($this->_tpl_vars['item']['day']): ?><?php echo ''; ?><?php if ($this->_tpl_vars['item']['is_message']): ?><?php echo '<a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?><?php echo '&amp;target_c_member_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['target_member']['c_member_id']); ?><?php echo '&amp;year='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['date_val']['year']); ?><?php echo '&amp;month='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['date_val']['month']); ?><?php echo '&amp;day='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['day']); ?><?php echo '&amp;box='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['box']); ?><?php echo '" class="s_ss">'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['day']); ?><?php echo '</a>'; ?><?php else: ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['day']); ?><?php echo ''; ?><?php endif; ?><?php echo ''; ?><?php else: ?><?php echo ''; ?><?php endif; ?><?php echo ''; ?>
</td>
<?php endforeach; endif; unset($_from); ?>
</tr>
<?php endforeach; endif; unset($_from); ?>
</table>
</div>
<?php endif; ?>

<?php if ($this->_tpl_vars['date_list']): ?>
<div class="item monthlyMessage">
<div class="partsHeading"><h3>各月短信</h3></div>
<ul class="list">
<?php $_from = $this->_tpl_vars['date_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['date']):
?>
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?>
&amp;box=<?php echo smarty_modifier_t_escape($this->_tpl_vars['box']); ?>
&amp;year=<?php echo smarty_modifier_t_escape($this->_tpl_vars['date']['year']); ?>
&amp;month=<?php echo smarty_modifier_t_escape($this->_tpl_vars['date']['month']); ?>
&amp;box=<?php echo smarty_modifier_t_escape($this->_tpl_vars['box']); ?>
"><?php echo smarty_modifier_t_escape($this->_tpl_vars['date']['year']); ?>
年<?php echo smarty_modifier_t_escape($this->_tpl_vars['date']['month']); ?>
月一览</a></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
</div>
<?php endif; ?>

</div>

</div><!-- Left -->
<div id="Center">

<?php if ($this->_tpl_vars['box'] == 'inbox' || ! $this->_tpl_vars['box']): ?>

<?php if ($this->_tpl_vars['count_c_message_ru_list']): ?>
<div class="dparts messageList"><div class="parts">
<div class="partsHeading"><h3>收信箱</h3>
<?php if (! $this->_tpl_vars['all']): ?>
<p class="date"><?php echo smarty_modifier_t_escape($this->_tpl_vars['date_val']['year']); ?>
年<?php echo smarty_modifier_t_escape($this->_tpl_vars['date_val']['month']); ?>
月<?php if ($this->_tpl_vars['date_val']['day']): ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['date_val']['day']); ?>
日<?php endif; ?></p>
<?php endif; ?>
</div>

<div class="pagerRelativeMulti">
<p class="icons">
<span><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_mail_4'), $this);?>
" alt="已回复" />已回复</span>
</p>
<div class="pager">
<?php ob_start(); ?><?php echo ''; ?><?php if ($this->_tpl_vars['ru_data']['is_ru_prev']): ?><?php echo '<p class="prev"><a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?><?php echo '&amp;ru_page='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['ru_data']['ru_page']-1); ?><?php echo '&amp;box=inbox&amp;keyword='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['url_keyword']); ?><?php echo '&amp;target_c_member_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['target_c_member_id']); ?><?php echo '&amp;year='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['requests']['year']); ?><?php echo '&amp;month='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['requests']['month']); ?><?php echo '&amp;day='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['requests']['day']); ?><?php echo '">上一页</a></p>'; ?><?php endif; ?><?php echo '<p class="number">共'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['total_num']); ?><?php echo '条 '; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['ru_data']['ru_page']*$this->_tpl_vars['page_size']-$this->_tpl_vars['page_size']+1); ?><?php echo '条～'; ?><?php if ($this->_tpl_vars['ru_data']['ru_page'] * $this->_tpl_vars['page_size'] > $this->_tpl_vars['count_c_message_ru_list']): ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['count_c_message_ru_list']+$this->_tpl_vars['ru_data']['ru_page']*$this->_tpl_vars['page_size']-$this->_tpl_vars['page_size']); ?><?php echo ''; ?><?php else: ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['ru_data']['ru_page']*$this->_tpl_vars['page_size']); ?><?php echo ''; ?><?php endif; ?><?php echo '条 记录</p>'; ?><?php if ($this->_tpl_vars['ru_data']['is_ru_next']): ?><?php echo '<p class="next"><a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?><?php echo '&amp;ru_page='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['ru_data']['ru_page']+1); ?><?php echo '&amp;box=inbox&amp;keyword='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['url_keyword']); ?><?php echo '&amp;target_c_member_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['target_c_member_id']); ?><?php echo '&amp;year='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['requests']['year']); ?><?php echo '&amp;month='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['requests']['month']); ?><?php echo '&amp;day='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['requests']['day']); ?><?php echo '">下一页</a></p>'; ?><?php endif; ?><?php echo ''; ?>
<?php $this->_smarty_vars['capture']['pager'] = ob_get_contents(); ob_end_clean(); ?>
<?php echo $this->_smarty_vars['capture']['pager']; ?>

</div>
</div>

<?php $this->_tag_stack[] = array('t_form_block', array('m' => 'pc','a' => 'do_h_message_box_delete_message','_attr' => 'name="h_message_box_delete_message"')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<input type="hidden" name="box" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['box']); ?>
" />

<table>
<col class="status" />
<col class="delete" />
<col class="target" />
<col class="title" />
<col class="date" />
<tr>
<th></th>
<th class="delete">删除</th>
<th>送信人</th>
<th>题目</th>
<th>日期</th>
</tr>
<?php $_from = $this->_tpl_vars['c_message_ru_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['c_message_ru']):
?>
<tr<?php if (! $this->_tpl_vars['c_message_ru']['is_read']): ?> class="unread"<?php endif; ?>>
<td class="status"><span><?php echo ''; ?><?php if ($this->_tpl_vars['c_message_ru']['is_hensin']): ?><?php echo '<img src="'; ?><?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_mail_4'), $this);?><?php echo '" alt="已回复" />'; ?><?php elseif ($this->_tpl_vars['c_message_ru']['is_read']): ?><?php echo '<img src="'; ?><?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_mail_2'), $this);?><?php echo '" alt="已读" />'; ?><?php else: ?><?php echo '<img src="'; ?><?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_mail_1'), $this);?><?php echo '" alt="未读" />'; ?><?php endif; ?><?php echo ''; ?>
</span></td>
<td><span><input type="checkbox" class="input_checkbox" name="c_message_id[]" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_ru']['c_message_id']); ?>
" /></span></td>
<td><span><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_ru']['nickname']); ?>
</span></td>
<td><span><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message'), $this);?>
&amp;target_c_message_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_ru']['c_message_id']); ?>
&amp;jyusin_c_message_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_ru']['c_message_id']); ?>
"><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_ru']['subject']); ?>
</a></span></td>
<td><span><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['c_message_ru']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span></td>
</tr>
<?php endforeach; endif; unset($_from); ?>
</table>

<div class="pagerRelative">
<?php echo $this->_smarty_vars['capture']['pager']; ?>

</div>

<div class="operation">
<p><a href="#" onclick="return checkAll();" onkeypress="return checkAll();">全部选中</a> / <a href="#" onclick="return clearAll();" onkeypress="return clearAll();">全部取消</a></p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="删 除" /></li>
</ul>
</div>

<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>

</div></div>
<?php else: ?>
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>收信箱</h3></div>
<div class="block">
<p>没有消息。</p>
</div>
</div></div>
<?php endif; ?>

<?php elseif ($this->_tpl_vars['box'] == 'outbox'): ?>

<?php if ($this->_tpl_vars['count_c_message_s_list']): ?>
<div class="dparts messageList"><div class="parts">
<div class="partsHeading"><h3>已发送的短信</h3>
<?php if (! $this->_tpl_vars['all']): ?>
<p class="date"><?php echo smarty_modifier_t_escape($this->_tpl_vars['date_val']['year']); ?>
年<?php echo smarty_modifier_t_escape($this->_tpl_vars['date_val']['month']); ?>
月<?php if ($this->_tpl_vars['date_val']['day']): ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['date_val']['day']); ?>
日<?php endif; ?></p>
<?php endif; ?>
</div>

<?php ob_start(); ?><?php echo '<div class="pagerRelative">'; ?><?php if ($this->_tpl_vars['s_data']['is_s_prev']): ?><?php echo '<p class="prev"><a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?><?php echo '&amp;s_page='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['s_data']['s_page']-1); ?><?php echo '&amp;box=outbox&amp;keyword='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['url_keyword']); ?><?php echo '&amp;target_c_member_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['target_c_member_id']); ?><?php echo '&amp;year='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['requests']['year']); ?><?php echo '&amp;month='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['requests']['month']); ?><?php echo '&amp;day='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['requests']['day']); ?><?php echo '">上一页</a></p>'; ?><?php endif; ?><?php echo '<p class="number">共'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['total_num']); ?><?php echo '条 '; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['s_data']['s_page']*$this->_tpl_vars['page_size']-$this->_tpl_vars['page_size']+1); ?><?php echo '条～'; ?><?php if ($this->_tpl_vars['s_data']['s_page'] * $this->_tpl_vars['page_size'] > $this->_tpl_vars['count_c_message_s_list']): ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['count_c_message_s_list']+$this->_tpl_vars['s_data']['s_page']*$this->_tpl_vars['page_size']-$this->_tpl_vars['page_size']); ?><?php echo ''; ?><?php else: ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['s_data']['s_page']*$this->_tpl_vars['page_size']); ?><?php echo ''; ?><?php endif; ?><?php echo '条 记录</p>'; ?><?php if ($this->_tpl_vars['s_data']['is_s_next']): ?><?php echo '<p class="next"><a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?><?php echo '&amp;s_page='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['s_data']['s_page']+1); ?><?php echo '&amp;box=outbox&amp;keyword='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['url_keyword']); ?><?php echo '&amp;target_c_member_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['target_c_member_id']); ?><?php echo '&amp;year='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['requests']['year']); ?><?php echo '&amp;month='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['requests']['month']); ?><?php echo '&amp;day='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['requests']['day']); ?><?php echo '">下一页</a></p>'; ?><?php endif; ?><?php echo '</div>'; ?>
<?php $this->_smarty_vars['capture']['pager'] = ob_get_contents(); ob_end_clean(); ?>
<?php echo $this->_smarty_vars['capture']['pager']; ?>


<?php $this->_tag_stack[] = array('t_form_block', array('m' => 'pc','a' => 'do_h_message_box_delete_message','_attr' => 'name="h_message_box_delete_message"')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<input type="hidden" name="box" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['box']); ?>
" />

<table>
<col class="status" />
<col class="delete" />
<col class="target" />
<col class="title" />
<col class="date" />
<tr>
<th></th>
<th class="delete">删除</th>
<th>地   址</th>
<th>题   目</th>
<th>日   期</th>
</tr>
<?php $_from = $this->_tpl_vars['c_message_s_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['c_message_s']):
?>
<tr>
<td class="status"><span><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_mail_3'), $this);?>
" alt="" /></span></td>
<td><span><input type="checkbox" class="input_checkbox" name="c_message_id[]" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_s']['c_message_id']); ?>
" /></span></td>
<td><span><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_s']['nickname']); ?>
</span></td>
<td><span><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message'), $this);?>
&amp;target_c_message_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_s']['c_message_id']); ?>
&amp;box=outbox"><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_s']['subject']); ?>
</a></span></td>
<td><span><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['c_message_s']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span></td>
</tr>
<?php endforeach; endif; unset($_from); ?>
</table>

<?php echo $this->_smarty_vars['capture']['pager']; ?>


<div class="operation">
<p><a href="#" onclick="return checkAll();" onkeypress="return checkAll();">全部选中</a> / <a href="#" onclick="return clearAll();" onkeypress="return clearAll();">全部取消</a></p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="删 除" /></li>
</ul>
</div>

<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>

</div></div>
<?php else: ?>
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>已发送的消息</h3></div>
<div class="block">
<p>没有消息。</p>
</div>
</div></div>
<?php endif; ?>

<?php elseif ($this->_tpl_vars['box'] == 'savebox'): ?>

<?php if ($this->_tpl_vars['count_c_message_save_list']): ?>
<div class="dparts messageList"><div class="parts">
<div class="partsHeading"><h3>草稿箱</h3>
<?php if (! $this->_tpl_vars['all']): ?>
<p class="date"><?php echo smarty_modifier_t_escape($this->_tpl_vars['date_val']['year']); ?>
年<?php echo smarty_modifier_t_escape($this->_tpl_vars['date_val']['month']); ?>
月<?php if ($this->_tpl_vars['date_val']['day']): ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['date_val']['day']); ?>
日<?php endif; ?></p>
<?php endif; ?>
</div>

<?php ob_start(); ?><?php echo '<div class="pagerRelative">'; ?><?php if ($this->_tpl_vars['save_data']['is_save_prev']): ?><?php echo '<p class="prev"><a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?><?php echo '&amp;save_page='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['save_data']['save_page']-1); ?><?php echo '&amp;box=savebox">上一页</a></p>'; ?><?php endif; ?><?php echo '<p class="number">共'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['total_num']); ?><?php echo '条 '; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['save_data']['save_page']*$this->_tpl_vars['page_size']-$this->_tpl_vars['page_size']+1); ?><?php echo '条～'; ?><?php if ($this->_tpl_vars['save_data']['save_page'] * $this->_tpl_vars['page_size'] > $this->_tpl_vars['count_c_message_save_list']): ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['count_c_message_save_list']+$this->_tpl_vars['save_data']['save_page']*$this->_tpl_vars['page_size']-$this->_tpl_vars['page_size']); ?><?php echo ''; ?><?php else: ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['save_data']['save_page']*$this->_tpl_vars['page_size']); ?><?php echo ''; ?><?php endif; ?><?php echo '条 记录</p>'; ?><?php if ($this->_tpl_vars['save_data']['is_save_next']): ?><?php echo '<p class="next"><a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?><?php echo '&amp;save_page='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['save_data']['save_page']+1); ?><?php echo '&amp;box=savebox">下一页</a></p>'; ?><?php endif; ?><?php echo '</div>'; ?>
<?php $this->_smarty_vars['capture']['pager'] = ob_get_contents(); ob_end_clean(); ?>
<?php echo $this->_smarty_vars['capture']['pager']; ?>


<?php $this->_tag_stack[] = array('t_form_block', array('m' => 'pc','a' => 'do_h_message_box_delete_message','_attr' => 'name="h_message_box_delete_message"')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<input type="hidden" name="box" value="savebox" />

<table>
<col class="status" />
<col class="delete" />
<col class="target" />
<col class="title" />
<col class="date" />
<tr>
<th></th>
<th class="delete">删除</th>
<th>地址</th>
<th>题目</th>
<th>日期</th>
</tr>
<?php $_from = $this->_tpl_vars['c_message_save_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['c_message_save']):
?>
<tr>
<td class="status"><span><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_mail_1'), $this);?>
" alt="" /></span></td>
<td><span><input type="checkbox" class="input_checkbox" name="c_message_id[]" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_save']['c_message_id']); ?>
" /></span></td>
<td><span><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_save']['nickname']); ?>
</span></td>
<td><span><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_message_send'), $this);?>
&amp;target_c_message_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_save']['c_message_id']); ?>
&amp;jyusin_c_message_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_save']['hensinmoto_c_message_id']); ?>
&amp;box=savebox"><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_save']['subject']); ?>
</a></span></td>
<td><span><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['c_message_save']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span></td>
</tr>
<?php endforeach; endif; unset($_from); ?>
</table>

<?php echo $this->_smarty_vars['capture']['pager']; ?>


<div class="operation">
<p><a href="#" onclick="return checkAll();" onkeypress="return checkAll();">全部选中</a> / <a href="#" onclick="return clearAll();" onkeypress="return clearAll();">全部取消</a></p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="删 除" /></li>
</ul>
</div>

<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>

</div></div>
<?php else: ?>
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>草稿箱</h3></div>
<div class="block">
<p>没有消息。</p>
</div>
</div></div>
<?php endif; ?>

<?php elseif ($this->_tpl_vars['box'] == 'trash'): ?>

<?php if ($this->_tpl_vars['count_c_message_trash_list']): ?>
<div class="dparts messageList"><div class="parts">
<div class="partsHeading"><h3>回收站的消息</h3></div>

<div class="pagerRelativeMulti">
<p class="icons">
<span><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_mail_2'), $this);?>
" alt="收信" />收信</span>
<span><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_mail_3'), $this);?>
" alt="送信" />送信</span>
<span><img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_mail_1'), $this);?>
" alt="草稿" />草稿</span>
</p>
<div class="pager">
<?php ob_start(); ?><?php echo ''; ?><?php if ($this->_tpl_vars['trash_data']['is_trash_prev']): ?><?php echo '<p class="prev"><a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?><?php echo '&amp;trash_page='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['trash_data']['trash_page']-1); ?><?php echo '&amp;box=trash">上一页</a></p>'; ?><?php endif; ?><?php echo '<p class="number">共'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['total_num']); ?><?php echo '条 '; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['trash_data']['trash_page']*$this->_tpl_vars['page_size']-$this->_tpl_vars['page_size']+1); ?><?php echo '条～'; ?><?php if ($this->_tpl_vars['trash_data']['trash_page'] * $this->_tpl_vars['page_size'] > $this->_tpl_vars['count_c_message_trash_list']): ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['count_c_message_trash_list']+$this->_tpl_vars['trash_data']['trash_page']*$this->_tpl_vars['page_size']-$this->_tpl_vars['page_size']); ?><?php echo ''; ?><?php else: ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['trash_data']['trash_page']*$this->_tpl_vars['page_size']); ?><?php echo ''; ?><?php endif; ?><?php echo '条< 记录/p>'; ?><?php if ($this->_tpl_vars['trash_data']['is_trash_next']): ?><?php echo '<p class="next"><a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message_box'), $this);?><?php echo '&amp;trash_page='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['trash_data']['trash_page']+1); ?><?php echo '&amp;box=trash">下一页</a></p>'; ?><?php endif; ?><?php echo ''; ?>
<?php $this->_smarty_vars['capture']['pager'] = ob_get_contents(); ob_end_clean(); ?>
<?php echo $this->_smarty_vars['capture']['pager']; ?>

</div>
</div>

<?php $this->_tag_stack[] = array('t_form_block', array('m' => 'pc','a' => 'do_h_message_box_delete_message','_attr' => 'name="h_message_box_delete_message"')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<input type="hidden" name="box" value="trash" />

<table>
<col class="status" />
<col class="delete" />
<col class="target" />
<col class="title" />
<col class="date" />
<tr>
<th></th>
<th class="delete"></th>
<th>对象</th>
<th>题目</th>
<th>日期</th>
</tr>
<?php $_from = $this->_tpl_vars['c_message_trash_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['c_message_trash']):
?>
<tr>
<td class="status"><span><?php echo ''; ?><?php if ($this->_tpl_vars['c_message_trash']['c_member_id_to'] == $this->_tpl_vars['u']): ?><?php echo ''; ?><?php echo '<img src="'; ?><?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_mail_2'), $this);?><?php echo '" alt="收信" />'; ?><?php else: ?><?php echo ''; ?><?php if ($this->_tpl_vars['c_message_trash']['is_send']): ?><?php echo ''; ?><?php echo '<img src="'; ?><?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_mail_3'), $this);?><?php echo '" alt="送信" />'; ?><?php else: ?><?php echo ''; ?><?php echo '<img src="'; ?><?php echo smarty_function_t_img_url_skin(array('filename' => 'icon_mail_1'), $this);?><?php echo '" alt="草稿" />'; ?><?php endif; ?><?php echo ''; ?><?php endif; ?><?php echo ''; ?>
</span></td>
<td><span><input type="checkbox" class="input_checkbox" name="c_message_id[]" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_trash']['c_message_id']); ?>
" /></span></td>
<td><span><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_trash']['nickname']); ?>
</span></td>
<td><span><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_message'), $this);?>
&amp;target_c_message_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_trash']['c_message_id']); ?>
&amp;box=trash"><?php echo smarty_modifier_t_escape($this->_tpl_vars['c_message_trash']['subject']); ?>
</a></span></td>
<td><span><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['c_message_trash']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m月%d日") : smarty_modifier_date_format($_tmp, "%m月%d日")); ?>
</span></td>
</tr>
<?php endforeach; endif; unset($_from); ?>
</table>

<div class="pagerRelative">
<?php echo $this->_smarty_vars['capture']['pager']; ?>

</div>

<div class="operation">
<p><a href="#" onclick="return checkAll();" onkeypress="return checkAll();">全部选中</a> / <a href="#" onclick="return clearAll();" onkeypress="return clearAll();">全部取消</a></p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" name="move" value="还原" /></li>
<li><input type="submit" class="input_submit" name="remove" value="删除" /></li>
</ul>
</div>

<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>

<div class="partsInfo">
</div>
</div></div>
<?php else: ?>
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>回收站</h3></div>
<div class="block">
<p>没有消息。</p>
</div>
</div></div>
<?php endif; ?>

<?php endif; ?>

</div><!-- Center -->
</div><!-- LayoutB -->