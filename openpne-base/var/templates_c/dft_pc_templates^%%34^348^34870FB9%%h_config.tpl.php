<?php /* Smarty version 2.6.18, created on 2012-10-04 20:16:45
         compiled from file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_config.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 't_form_block', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_config.tpl', 7, false),array('function', 't_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_config.tpl', 76, false),array('modifier', 't_escape', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_config.tpl', 77, false),)), $this); ?>
<div id="LayoutC">
<div id="Center">

<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>邮件地址更改</h3></div>
<?php $this->_tag_stack[] = array('t_form_block', array('m' => 'pc','a' => 'do_h_config_1')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<table><tr>
<th>邮件地址</th>
<td>
<input type="text" class="input_text" name="pc_address" value="" size="40" />
<p class="caution">
※邮件地址不被公开。
<?php if (@OPENPNE_AUTH_MODE == 'slavepne' && ! @IS_SLAVEPNE_EMAIL_REGIST): ?>
<br />※初期设定时没有记录邮件地址。如果您希望受到新消息，请在这里申请。
<?php endif; ?>
</p>
</td>
</tr><tr>
<th>邮件地址确认</th>
<td>
<input type="text" class="input_text" name="pc_address2" value="" size="40" />
</td>
</tr></table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="邮箱地址更改" /></li>
</ul>
</div>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</div></div>

<?php if (@OPENPNE_AUTH_MODE != 'slavepne'): ?>
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>密码更改</h3></div>
<?php $this->_tag_stack[] = array('t_form_block', array('m' => 'pc','a' => 'do_h_config_2')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<table><tr>
<th>当前密码</th>
<td>
<input type="password" class="input_password" name="old_password" value="" size="20" />
</td>
</tr><tr>
<th>新秘密</th>
<td>
<input type="password" class="input_password" name="new_password" value="" size="20" />
<p class="caution">※密码请输入6～12位半角英文数字。</p>
</td>
</tr><tr>
<th>新密码确认</th>
<td>
<input type="password" class="input_password" name="new_password2" value="" size="20" />
</td>
</tr></table>
<div class="operation">
<ul class="moreInfo button">
<li>
<input type="submit" class="input_submit" value="密码更改" /></li>
</ul>
</div>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</div></div>
<?php endif; ?>

<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>设定变更<a name="blog"></h3></div>
<?php $this->_tag_stack[] = array('t_form_block', array('m' => 'pc','a' => 'do_h_config_3')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<table>
<?php if (@OPENPNE_ENABLE_KTAI): ?>
<tr>
<th>手机邮件地址</th>
<td>
<a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_config_ktai'), $this);?>
">登陆后也可使用手机版。登陆请按</a><br />
※手机信箱登陆后，也可以使用手机访问「<?php echo smarty_modifier_t_escape(@SNS_NAME); ?>
」。
</td>
</tr>
<?php endif; ?>
<?php if (@OPENPNE_AUTH_MODE != 'slavepne'): ?>
<tr>
<th>密码提示问题</th>
<td>
<select name="c_password_query_id">
<?php $_from = $this->_tpl_vars['password_query_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
?>
<option value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['key']); ?>
"<?php if ($this->_tpl_vars['c_member']['c_password_query_id'] == $this->_tpl_vars['key']): ?> selected="selected"<?php endif; ?>><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']); ?>
</option>
<?php endforeach; endif; unset($_from); ?>
</select>
</td>
</tr>
<tr>
<th>密码提示答案</th>
<td>
<input type="text" class="input_text" name="c_password_query_answer" value="" size="30" />
<p class="caution">※要修改回答内容时，请输入新内容。</p>
</td>
</tr>
<?php endif; ?>
<tr>
<th>博客的URL</th>
<td>
<input type="text" class="input_text input_text_long" name="rss" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_member']['rss']); ?>
" size="60" />
<p>※拥有外部博客(BLOG)时请输入其RSS地址，本网站会自动更新数据。<br />例： http://blog.example.com/</p>
</td>
</tr>
<?php if (! $this->_tpl_vars['is_unused_daily_news']): ?>
<tr>
<th>每日新闻</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="is_receive_daily_news" id="is_receive_daily_news_1" value="1"<?php if ($this->_tpl_vars['c_member']['is_receive_daily_news'] == 1): ?> checked="checked"<?php endif; ?> /><label for="is_receive_daily_news_1">每日</label></li>
<?php if ($this->_tpl_vars['daily_news_day_num']): ?>
<li><input type="radio" class="input_radio" name="is_receive_daily_news" id="is_receive_daily_news_2" value="2"<?php if ($this->_tpl_vars['c_member']['is_receive_daily_news'] == 2): ?> checked="checked"<?php endif; ?> /><label for="is_receive_daily_news_2">周<?php echo smarty_modifier_t_escape($this->_tpl_vars['daily_news_day_num']); ?>
次 (<?php echo smarty_modifier_t_escape($this->_tpl_vars['daily_news_day_str']); ?>
)</label></li>
<?php endif; ?>
<li><input type="radio" class="input_radio" name="is_receive_daily_news" id="is_receive_daily_news_0" value="0"<?php if ($this->_tpl_vars['c_member']['is_receive_daily_news'] == 0): ?> checked="checked"<?php endif; ?> /><label for="is_receive_daily_news_0">不接收</label></li>
</ul>
<p>※接受<?php echo smarty_modifier_t_escape($this->_tpl_vars['SNS_NAME']); ?>
最新情报。</p>
</td>
</tr>
<?php endif; ?>
<?php if (@DISPLAY_SCHEDULE_HOME): ?>
<tr>
<th>每周日历</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="schedule_start_day" id="schedule_start_day_0" value="0"<?php if ($this->_tpl_vars['c_member']['schedule_start_day'] == 0): ?> checked="checked"<?php endif; ?> /><label for="schedule_start_day_0">周日开始</label></li>
<li><input type="radio" class="input_radio" name="schedule_start_day" id="schedule_start_day_1" value="1"<?php if ($this->_tpl_vars['c_member']['schedule_start_day'] == 1): ?> checked="checked"<?php endif; ?> /><label for="schedule_start_day_1">周一开始</label></li>
<li><input type="radio" class="input_radio" name="schedule_start_day" id="schedule_start_day_2" value="2"<?php if ($this->_tpl_vars['c_member']['schedule_start_day'] == 2): ?> checked="checked"<?php endif; ?> /><label for="schedule_start_day_2">本日开始</label></li>
</ul>
</td>
</tr>
<?php endif; ?>
<tr>
<th>邮件接收设定 </th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="is_receive_mail" id="is_receive_mail_1" value="1"<?php if ($this->_tpl_vars['c_member']['is_receive_mail']): ?> checked="checked"<?php endif; ?> /><label for="is_receive_mail_1">接收</label></li>
<li><input type="radio" class="input_radio" name="is_receive_mail" id="is_receive_mail_0"value="0"<?php if (! $this->_tpl_vars['c_member']['is_receive_mail']): ?> checked="checked"<?php endif; ?> /><label for="is_receive_mail_0">不接收</label></li>
</ul>
<p>※如果有人发短信给你，会向登陆的邮件地址中发送通知。<br />
※请对手机的邮件接收进行设定。</p>
</td>
</tr>
<?php if (! $this->_tpl_vars['is_unused_ashiato']): ?>
<tr>
<th>足迹通知邮件</th>
<td>
<input type="text" class="input_text" name="ashiato_mail_num" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['c_member']['ashiato_mail_num']); ?>
" size="12" /> 进入邮件箱
<p>※当朋友足迹达到这里指定的访问数目时，系统自动发送通知。</p>
</td>
</tr>
<?php endif; ?>
<tr>
<th><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
公开范围</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="public_flag_diary" id="public_flag_diary_public" value="public"<?php if ($this->_tpl_vars['c_member']['public_flag_diary'] == 'public'): ?> checked="checked"<?php endif; ?> /><label for="public_flag_diary_public">对全体公开</label></li>
<li><input type="radio" class="input_radio" name="public_flag_diary" id="public_flag_diary_friend" value="friend"<?php if ($this->_tpl_vars['c_member']['public_flag_diary'] == 'friend'): ?> checked="checked"<?php endif; ?> /><label for="public_flag_diary_friend">对<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_MY_FRIEND']); ?>
公开</label></li>
<li><input type="radio" class="input_radio" name="public_flag_diary" id="public_flag_diary_private" value="private"<?php if ($this->_tpl_vars['c_member']['public_flag_diary'] == 'private'): ?> checked="checked"<?php endif; ?> /><label for="public_flag_diary_private">不公开</label></li>
</ul>
<p>※在这里指定的值将被作为日记做成时的预选值。<br />
以前发表的日记公开范围将不被更改。</p>
</td>
</tr>
<tr>
<th>拒绝访问</th>
<td>
<ul>
<?php $_from = $this->_tpl_vars['c_member_id_block']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<li>ID: <input type="text" class="input_text" name="c_member_id_block[]" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']); ?>
" size="12" /></li>
<?php endforeach; endif; unset($_from); ?>
<li>ID: <input type="text" class="input_text" name="c_member_id_block[]" value="" size="12" /></li>
</ul>
<p>※拒绝特定用户的访问。<br />
对方首页的URL末尾显示的数字作为ID。<br />
例：(○的部分为ID)<br />
<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=○</p>
</td>
</tr>
<?php if (@USE_SHINOBIASHI == 1): ?>
<tr>
<th>隐身模式</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="is_shinobiashi" id="is_shinobiashi_0" value="0"<?php if ($this->_tpl_vars['is_shinobiashi'] == 0): ?> checked="checked"<?php endif; ?> /><label for="is_shinobiashi_0">留下足迹</label></li>
<li><input type="radio" class="input_radio" name="is_shinobiashi" id="is_shinobiashi_1" value="1"<?php if ($this->_tpl_vars['is_shinobiashi'] == 1): ?> checked="checked"<?php endif; ?> /><label for="is_shinobiashi_1">不留足迹</label></li>
</ul>
<p>※可设定浏览其他人时是否留下你的足迹。</p>
</td>
</tr>
<?php endif; ?>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="设定变更" /></li>
</ul>
</div>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</div></div>

<?php if (@DISPLAY_NEWDIARYTOPIC_HOME || @USE_BOOKMARK_FEED || @DISPLAY_SCHEDULE_HOME): ?>
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>其他设置变更</h3></div>
<?php $this->_tag_stack[] = array('t_form_block', array('m' => 'pc','a' => 'do_h_member_config_update_display_home')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<table>
<?php if (@DISPLAY_SCHEDULE_HOME): ?>
<tr>
<th>日程表</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_SCHEDULE_HOME" id="is_display_schedule_home_0" value="1"<?php if ($this->_tpl_vars['C_MEMBER_CONFIG']['IS_DISPLAY_SCHEDULE_HOME']): ?> checked="checked"<?php endif; ?> /><label for="is_display_schedule_home_0">显示</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_SCHEDULE_HOME" id="is_display_schedule_home_1" value="0"<?php if (! $this->_tpl_vars['C_MEMBER_CONFIG']['IS_DISPLAY_SCHEDULE_HOME']): ?> checked="checked"<?php endif; ?> /><label for="is_display_schedule_home_1">不显示</label></li>
</ul>
<p>※在我的个人页面上是否显示日程表。</p>
</td>
</tr>
<?php endif; ?>
<?php if (@DISPLAY_NEWDIARYTOPIC_HOME): ?>
<tr>
<th>全部最新<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_NEWDIARY_HOME" id="is_display_newdiary_home_0" value="1"<?php if ($this->_tpl_vars['C_MEMBER_CONFIG']['IS_DISPLAY_NEWDIARY_HOME']): ?> checked="checked"<?php endif; ?> /><label for="is_display_newdiary_home_0">显示</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_NEWDIARY_HOME" id="is_display_newdiary_home_1" value="0"<?php if (! $this->_tpl_vars['C_MEMBER_CONFIG']['IS_DISPLAY_NEWDIARY_HOME']): ?> checked="checked"<?php endif; ?> /><label for="is_display_newdiary_home_1">不显示</label></li>
</ul>
<p>※是否在我的首页显示全部最新<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
。</p>
</td>
</tr>
<tr>
<th><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
最新帖子、活动</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_NEWTOPIC_HOME" id="is_display_newtopic_home_0" value="1"<?php if ($this->_tpl_vars['C_MEMBER_CONFIG']['IS_DISPLAY_NEWTOPIC_HOME']): ?> checked="checked"<?php endif; ?> /><label for="is_display_newtopic_home_0">显示</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_NEWTOPIC_HOME" id="is_display_newtopic_home_1" value="0"<?php if (! $this->_tpl_vars['C_MEMBER_CONFIG']['IS_DISPLAY_NEWTOPIC_HOME']): ?> checked="checked"<?php endif; ?> /><label for="is_display_newtopic_home_1">不显示</label></li>
</ul>
<p>※在我的首页显示全部最新<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
信息。</p>
</td>
</tr>
<?php endif; ?>
<?php if (@USE_BOOKMARK_FEED): ?>
<tr>
<th>收藏的最新<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_DIARY_HOME" id="is_display_bookmark_diary_home_0" value="1"<?php if ($this->_tpl_vars['C_MEMBER_CONFIG']['IS_DISPLAY_BOOKMARK_DIARY_HOME']): ?> checked="checked"<?php endif; ?> /><label for="is_display_bookmark_diary_home_0">显示</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_DIARY_HOME" id="is_display_bookmark_diary_home_1" value="0"<?php if (! $this->_tpl_vars['C_MEMBER_CONFIG']['IS_DISPLAY_BOOKMARK_DIARY_HOME']): ?> checked="checked"<?php endif; ?> /><label for="is_display_bookmark_diary_home_1">不显示</label></li>
</ul>
<p>※在我的首页显示收藏夹中全部的最新<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
。</p>
</td>
</tr>
<tr>
<th>收藏的最新blog</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_BLOG_HOME" id="is_display_bookmark_blog_home_0" value="1"<?php if ($this->_tpl_vars['C_MEMBER_CONFIG']['IS_DISPLAY_BOOKMARK_BLOG_HOME']): ?> checked="checked"<?php endif; ?> /><label for="is_display_bookmark_blog_home_0">显示</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_BLOG_HOME" id="is_display_bookmark_blog_home_1" value="0"<?php if (! $this->_tpl_vars['C_MEMBER_CONFIG']['IS_DISPLAY_BOOKMARK_BLOG_HOME']): ?> checked="checked"<?php endif; ?> /><label for="is_display_bookmark_blog_home_1">不显示</label></li>
</ul>
<p>※在我的首页显示最新博客。</p>
</td>
</tr>
<?php endif; ?>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="设定变更" /></li>
</ul>
</div>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</div></div>
<?php endif; ?>


<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
公开范围变更一览</h3></div>
<?php $this->_tag_stack[] = array('t_form_block', array('m' => 'pc','a' => 'page_h_set_public_flag_all_confirm')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<table><tr>
<th><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
公开范围</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="public_flag_diary_all" id="public_flag_diary_all_public" value="public" checked="checked" /><label for="public_flag_diary_all_public">对全体公开</label></li>
<li><input type="radio" class="input_radio" name="public_flag_diary_all" id="public_flag_diary_all_friend" value="friend" /><label for="public_flag_diary_all_friend">对<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_MY_FRIEND']); ?>
公开</label></li>
<li><input type="radio" class="input_radio" name="public_flag_diary_all" id="public_flag_diary_all_private" value="private" /><label for="public_flag_diary_all_private">不公开</label></li>
</ul>
<p>※<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
可以选择你要的公开范围。</p>
</td>
</tr></table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="确认" /></li>
</ul>
</div>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</div></div>

<?php if ($this->_tpl_vars['c_member']['c_member_id'] == 1): ?>
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3><?php echo smarty_modifier_t_escape(@SNS_NAME); ?>
退会</h3></div>
<div class="block">
<p>本站站长不能退会。</p>
</div>
</div></div>
<?php else: ?>
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3><?php echo smarty_modifier_t_escape(@SNS_NAME); ?>
退会</h3></div>
<div class="block">
<?php $this->_tag_stack[] = array('t_form_block', array('m' => 'pc','a' => 'page_h_taikai_confirm')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="确定退会" /></li>
</ul>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</div>
</div></div>
<?php endif; ?>

</div><!-- Center -->
</div><!-- LayoutC -->