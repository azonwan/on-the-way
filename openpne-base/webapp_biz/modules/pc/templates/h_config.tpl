<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>PC 系统设定</h3></div>
({t_form_block m=pc a=do_h_config_1})
<table><tr>
<th>新的邮件地址</th>
<td>
<input type="text" class="input_text" name="pc_address" value="" size="40" />
<p class="caution">
※邮件地址将不被公开
({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne' && !$smarty.const.IS_SLAVEPNE_EMAIL_REGIST})
<br />※在这里填写你的邮箱地址，可以获得本社区的最新信息通知。
({/if})
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
({/t_form_block})
</div></div>
({* }}} *})

({if $smarty.const.OPENPNE_AUTH_MODE != 'slavepne'})
({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>密码更改</h3></div>
({t_form_block m=pc a=do_h_config_2})
<table><tr>
<th>当前密码</th>
<td>
<input type="password" class="input_password" name="old_password" value="" size="20" />
</td>
</tr><tr>
<th>新密码</th>
<td>
<input type="password" class="input_password" name="new_password" value="" size="20" />
<p class="caution">※密码请输入6～12位半角英文数字。</p>
</td>
</tr><tr>
<th>密码确认</th>
<td>
<input type="password" class="input_password" name="new_password2" value="" size="20" />
</td>
</tr></table>
<div class="operation">
<ul class="moreInfo button">
<li>
<input type="submit" class="input_submit" value="密码变更" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})
({/if})

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>个性設定変更</h3></div>
({t_form_block m=pc a=do_h_config_3})
<table>
({if $smarty.const.OPENPNE_ENABLE_KTAI})
<tr>
<th>手机邮件地址</th>
<td>
<a href="({t_url m=pc a=page_h_config_ktai})">手机邮件地址登陆</a><br />

</td>
</tr>
({/if})
({if $smarty.const.OPENPNE_AUTH_MODE != 'slavepne'})
<tr>
<th>密码提示问题</th>
<td>
<select name="c_password_query_id">
({foreach from=$password_query_list key=key item=item})
<option value="({$key})"({if $c_member.c_password_query_id==$key}) selected="selected"({/if})>({$item})</option>
({/foreach})
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
({/if})
<tr>
<th>博客的URL</th>
<td>
<input type="text" class="input_text input_text_long" name="rss" value="({$c_member.rss})" size="60" />
<p>※拥有外部博客(BLOG)时请输入其RSS地址，本网站会自动更新数据。
例： http://blog.example.com/</p>
</td>
</tr>
({if !$is_unused_daily_news})
<tr>
<th>每日新闻</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="is_receive_daily_news" id="is_receive_daily_news_1" value="1"({if $c_member.is_receive_daily_news == 1}) checked="checked"({/if}) /><label for="is_receive_daily_news_1">毎日</label></li>
({if $daily_news_day_num})
<li><input type="radio" class="input_radio" name="is_receive_daily_news" id="is_receive_daily_news_2" value="2"({if $c_member.is_receive_daily_news == 2}) checked="checked"({/if}) /><label for="is_receive_daily_news_2">週({$daily_news_day_num})回 (({$daily_news_day_str}))</label></li>
({/if})
<li><input type="radio" class="input_radio" name="is_receive_daily_news" id="is_receive_daily_news_0" value="0"({if $c_member.is_receive_daily_news == 0}) checked="checked"({/if}) /><label for="is_receive_daily_news_0">不接收</label></li>
</ul>
<p>※接收({$SNS_NAME})的最新网站动态新闻。</p>
</td>
</tr>
({/if})
({if $smarty.const.DISPLAY_SCHEDULE_HOME})
<tr>
<th>每周日历</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="schedule_start_day" id="schedule_start_day_0" value="0"({if $c_member.schedule_start_day == 0}) checked="checked"({/if}) /><label for="schedule_start_day_0">每周日开始</label></li>
<li><input type="radio" class="input_radio" name="schedule_start_day" id="schedule_start_day_1" value="1"({if $c_member.schedule_start_day == 1}) checked="checked"({/if}) /><label for="schedule_start_day_1">周一开始</label></li>
<li><input type="radio" class="input_radio" name="schedule_start_day" id="schedule_start_day_2" value="2"({if $c_member.schedule_start_day == 2}) checked="checked"({/if}) /><label for="schedule_start_day_2">今天开始</label></li>
</ul>
</td>
</tr>
({/if})
<tr>
<th>邮件接收设定 </th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="is_receive_mail" id="is_receive_mail_1" value="1"({if $c_member.is_receive_mail}) checked="checked"({/if}) /><label for="is_receive_mail_1">接收</label></li>
<li><input type="radio" class="input_radio" name="is_receive_mail" id="is_receive_mail_0"value="0"({if !$c_member.is_receive_mail}) checked="checked"({/if}) /><label for="is_receive_mail_0">不接收</label></li>
</ul>
<p>※如果有人发短信给你，会向登陆的邮件地址中发送通知。<br />
※请对手机的邮件接收进行设定。</p>
</td>
</tr>
({if !$is_unused_ashiato})
<tr>
<th>足迹通知邮件</th>
<td>
<input type="text" class="input_text" name="ashiato_mail_num" value="({$c_member.ashiato_mail_num})" size="12" /> 进入邮件箱 
<p>※当朋友足迹达到这里指定的访问数目时，系统自动发送通知。</p>
</td>
</tr>
({/if})
<tr>
<th>({$WORD_DIARY})公开范围</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="public_flag_diary" id="public_flag_diary_public" value="public"({if $c_member.public_flag_diary == "public"}) checked="checked"({/if}) /><label for="public_flag_diary_public">对全体公开</label></li>
<li><input type="radio" class="input_radio" name="public_flag_diary" id="public_flag_diary_friend" value="friend"({if $c_member.public_flag_diary == "friend"}) checked="checked"({/if}) /><label for="public_flag_diary_friend">对({$WORD_MY_FRIEND})公开</label></li>
<li><input type="radio" class="input_radio" name="public_flag_diary" id="public_flag_diary_private" value="private"({if $c_member.public_flag_diary == "private"}) checked="checked"({/if}) /><label for="public_flag_diary_private">不公开</label></li>
</ul>
<p>※在这里指定的值将被作为写日记时的预选值。<br />
※但对以前发表的日记公开范围不起作用。</p>
</td>
</tr>
<tr>
<th>拒绝访问</th>
<td>
<ul>
({foreach from=$c_member_id_block item=item})
<li>ID: <input type="text" class="input_text" name="c_member_id_block[]" value="({$item})" size="12" /></li>
({/foreach})
<li>ID: <input type="text" class="input_text" name="c_member_id_block[]" value="" size="12" /></li>
</ul>
<p>※拒绝特定用户的访问。<br />
※对方首页的URL末尾显示的数字作为ID。<br />
例：(○的部分为ID)
http://demo.openpne.org.cn/?m=pc&a=page_f_home&target_c_member_id=○<br />
({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=○</p>
</td>
</tr>
({if $smarty.const.USE_SHINOBIASHI == 1})
<tr>
<th>隐身模式</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="is_shinobiashi" id="is_shinobiashi_0" value="0"({if $is_shinobiashi == 0}) checked="checked"({/if}) /><label for="is_shinobiashi_0">留下足迹</label></li>
<li><input type="radio" class="input_radio" name="is_shinobiashi" id="is_shinobiashi_1" value="1"({if $is_shinobiashi == 1}) checked="checked"({/if}) /><label for="is_shinobiashi_1">不留足迹</label></li>
</ul>
<p>※可设定浏览其他人时是否留下你的足迹。</p>
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="更改确定" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({if $smarty.const.DISPLAY_NEWDIARYTOPIC_HOME || $smarty.const.USE_BOOKMARK_FEED})
({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>首页显示大家的最新信息</h3></div>
({t_form_block m=pc a=do_h_member_config_update_display_home})
<table>
({if $smarty.const.DISPLAY_NEWDIARYTOPIC_HOME})
<tr>
<th>大家的最新({$WORD_DIARY})</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_NEWDIARY_HOME" id="is_display_newdiary_home_0" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_NEWDIARY_HOME}) checked="checked"({/if}) /><label for="is_display_newdiary_home_0">显示</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_NEWDIARY_HOME" id="is_display_newdiary_home_1" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_NEWDIARY_HOME}) checked="checked"({/if}) /><label for="is_display_newdiary_home_1">不显示</label></li>
</ul>
<p>※全体最新({$WORD_DIARY})的显示设定。</p>
</td>
</tr>
<tr>
<th>全体的最新({$WORD_COMMUNITY})留言显示</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_NEWTOPIC_HOME" id="is_display_newtopic_home_0" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_NEWTOPIC_HOME}) checked="checked"({/if}) /><label for="is_display_newtopic_home_0">显示</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_NEWTOPIC_HOME" id="is_display_newtopic_home_1" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_NEWTOPIC_HOME}) checked="checked"({/if}) /><label for="is_display_newtopic_home_1">不显示</label></li>
</ul>
<p>※显示所有的({$WORD_COMMUNITY})留言</p>
</td>
</tr>
({/if})
({if $smarty.const.USE_BOOKMARK_FEED})
<tr>
<th>最新热门({$WORD_DIARY})显示</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_DIARY_HOME" id="is_display_bookmark_diary_home_0" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_BOOKMARK_DIARY_HOME}) checked="checked"({/if}) /><label for="is_display_bookmark_diary_home_0">显示</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_DIARY_HOME" id="is_display_bookmark_diary_home_1" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_BOOKMARK_DIARY_HOME}) checked="checked"({/if}) /><label for="is_display_bookmark_diary_home_1">不显示</label></li>
</ul>
<p>※在个人首页显示最热门的最新({$WORD_DIARY})</p>
</td>
</tr>
<tr>
<th>热门最新blog</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_BLOG_HOME" id="is_display_bookmark_blog_home_0" value="1"({if $C_MEMBER_CONFIG.IS_DISPLAY_BOOKMARK_BLOG_HOME}) checked="checked"({/if}) /><label for="is_display_bookmark_blog_home_0">显示</label></li>
<li><input type="radio" class="input_radio" name="IS_DISPLAY_BOOKMARK_BLOG_HOME" id="is_display_bookmark_blog_home_1" value="0"({if !$C_MEMBER_CONFIG.IS_DISPLAY_BOOKMARK_BLOG_HOME}) checked="checked"({/if}) /><label for="is_display_bookmark_blog_home_1">不显示</label></li>
</ul>
<p>※在个人首页显示最热门的BLOG</p>
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="更改确定" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})
({/if})


({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_DIARY})公开范围设定</h3></div>
({t_form_block m=pc a=page_h_set_public_flag_all_confirm})
<table><tr>
<th>({$WORD_DIARY})公开范围</th>
<td>
<ul>
<li><input type="radio" class="input_radio" name="public_flag_diary_all" id="public_flag_diary_all_public" value="public" checked="checked" /><label for="public_flag_diary_all_public">对所有人公开</label></li>
<li><input type="radio" class="input_radio" name="public_flag_diary_all" id="public_flag_diary_all_friend" value="friend" /><label for="public_flag_diary_all_friend">只对({$WORD_MY_FRIEND})公开</label></li>
<li><input type="radio" class="input_radio" name="public_flag_diary_all" id="public_flag_diary_all_private" value="private" /><label for="public_flag_diary_all_private">不公开</label></li>
</ul>
<p>※日记可以选择你要的公开范围。</p>
</td>
</tr></table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="更改确定" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({if $c_member.c_member_id == 1})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$smarty.const.SNS_NAME})站退会</h3></div>
<div class="block">
<p>ID 为1 的会员（站长）不能够退会</p>
</div>
</div></div>
({* }}} *})
({else})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>({$smarty.const.SNS_NAME})退会</h3></div>
<div class="block">
({t_form_block m=pc a=page_h_taikai_confirm})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="到退会确认页面" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
