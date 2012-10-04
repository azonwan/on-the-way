<div id="LayoutC">
<div id="Center">

({* {{{ monthlyCalendarTable *})
<div class="dparts monthlyCalendarTable"><div class="parts">
<div class="partsHeading"><h3>({$ym.year_disp})年({$ym.month_disp})月</h3></div>

<div class="block">
<p class="moreInfo">
({if $smarty.const.USE_EXTRA_SERVICE})
<img src="({t_img_url_skin filename=icon_weather_FC})" alt="天气预报" /> <a href="({$smarty.const.OPENPNE_WEATHER_URL})" target="_blank">天气预报</a>
({/if})
 <img src="({t_img_url_skin filename=icon_schedule})" alt="时间表" /> <a href="({t_url m=biz a=page_fh_biz_schedule_add})&amp;target_id=({$c_member.c_member_id})">添加计划</a>
</p>
<p class="pager">
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">&lt;&lt;上个月</a>
 | <a href="({t_url m=biz a=page_fh_biz_schedule_calendar})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">本月</a>
 | <a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">下个月&gt;&gt;</a>
</p>
</div>

<table class="calendar">
<tr>
<th class="sun">日</th>
<th class="mon">（一）</th>
<th class="tue">（二）</th>
<th class="wed">（三）</th>
<th class="thu">（四）</th>
<th class="fri">（五）</th>
<th class="sat">（六）</th>
</tr>
({foreach from=$calendar item=week})
<tr>
({foreach from=$week item=item name=weekloop})
<td class="day({if $item.now}) today({/if})({if $smarty.foreach.weekloop.first}) sun({/if})({if $item.holiday}) holiday({/if})">({strip})
({if $item.day})
({$item.day})
<p><a href="({t_url m=biz a=page_fh_biz_schedule_add})&amp;begin_date=({$year})({$month|string_format:'%02d'})({$item.day|string_format:'%02d'})&amp;target_id=({$c_member.c_member_id})"><img src="({t_img_url_skin filename=icon_schedule})" alt="" /></a></p>

({* 生日 *})
({if $item.holiday})
({foreach from=$item.holiday item=item_holiday})
<p>({$item_holiday})</p>
({/foreach})
({/if})

({* 时间表 *})
({foreach from=$item.schedule item=item_schedule name=schedule})
({* 時間指定変数の初期化 *})
({assign var="begin_time_H" value=null})
({assign var="begin_time_M" value=null})
({assign var="finish_time_H" value=null})
({assign var="finish_time_M" value=null})
	({if !$item_schedule.begin_time})
<!-- 時間指定なしの予定 -->
	({elseif $cmd == 's_list'})
({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({if $item_schedule.finish_time})
	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({/if})
<a href="({t_url m=biz a=page_s_view_schedule})&amp;id=({$item_schedule.biz_shisetsu_schedule_id})">
({ext_include file="inc_biz_schedule_week_time.tpl"})
<p>({$item_schedule.c_member_name})</p></a>
	({elseif $item_schedule.begin_date != $item_schedule.finish_date})  <!--バナー予定 -->
({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({if $item_schedule.finish_time})
	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({/if})
({ext_include file="inc_biz_schedule_week_time.tpl"})
<p><a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})">({$item_schedule.title})</a></p>
	({else})
({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({if $item_schedule.finish_time})
	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({/if})
({ext_include file="inc_biz_schedule_week_time.tpl"})
<p><a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})">({$item_schedule.title})</a></p>
({/if})
({/foreach})

({if $item.schedule})
({foreach from=$item.schedule item=item_schedule name=schedule})
	({if !$item_schedule.begin_time})  <!-- 時間指定なしの予定 -->
<p><img src="({t_img_url_skin filename=icon_pen})" alt="时间表" /><a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">({$item_schedule.title})</a></p>
	({/if})
({/foreach})
({/if})

({* Todo *})
({foreach from=$item.todo item=item_todo})
<p><img src="./skin/default/img/biz/todo_icon.gif" alt="Todo" /><a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item_todo.biz_todo_id})&amp;target_id=({$c_member.c_member_id})">({$item_todo.memo|t_truncate:20:".."})</a></p>
({/foreach})

({* 生日 *})
({foreach from=$item.birth item=item_birth})
({if $item_birth.public_flag_birth_month_day != "private" || $c_member.c_member_id == $item_birth.c_member_id})
<p><img src="({t_img_url_skin filename=icon_birthday})" alt="生日" /><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})</a></p>
({/if})
({/foreach})

({* 活动 *})
({foreach from=$item.event item=item_event})
<p><img src="({if $item_event.is_join})({t_img_url_skin filename=icon_event_R})({else})({t_img_url_skin filename=icon_event_B})({/if})" alt="活动" /><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name})</a></p>
({/foreach})

({/if})
({/strip})</td>
({/foreach})
</tr>
({/foreach})
</table>

<div class="partsInfo">
<p>※<img src="({t_img_url_skin filename=icon_schedule})" alt="写计划" />点击图标可输入预定计划。计划内容不会对他人公开。</p>
<p>※<img src="({t_img_url_skin filename=icon_birthday})" alt="生日" />({$WORD_MY_FRIEND})的生日、<img src="({t_img_url_skin filename=icon_event_B})" alt="活动" />代表有活动、<img src="({t_img_url_skin filename=icon_event_R})" alt="参加活动" />代表已经参加的活动</p>
</div>

<div class="block">
<p class="pager">
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">&lt;&lt;上个月</a>
 | <a href="({t_url m=biz a=page_fh_biz_schedule_calendar})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">本月</a>
 | <a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">下个月&gt;&gt;</a>
</p>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->

