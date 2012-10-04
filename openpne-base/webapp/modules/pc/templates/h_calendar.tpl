<div id="LayoutC">
<div id="Center">

({* {{{ monthlyCalendarTable *})
<div class="dparts monthlyCalendarTable"><div class="parts">
<div class="partsHeading"><h3>({$ym.year_disp})年({$ym.month_disp})月的日历</h3></div>
<div class="block">
<p class="moreInfo">
({if $smarty.const.USE_EXTRA_SERVICE})
<img src="({t_img_url_skin filename=icon_weather_FC})" alt="天气预报" /> <a href="({$smarty.const.OPENPNE_WEATHER_URL})" target="_blank">查看天气预报</a>
({/if})
 <img src="({t_img_url_skin filename=icon_schedule})" alt="日程" /> <a href="({t_url m=pc a=page_h_schedule_add})">追加日程</a>
</p>
<p class="pager">
<a href="({t_url m=pc a=page_h_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})">&lt;&lt; 上个月</a>
 | <a href="({t_url m=pc a=page_h_calendar})">本月</a>
 | <a href="({t_url m=pc a=page_h_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})">下个月 &gt;&gt;</a>
</p>
</div>

<table class="calendar">
<tr>
<th class="sun">日</th>
<th class="mon">一</th>
<th class="tue">二</th>
<th class="wed">三</th>
<th class="thu">四</th>
<th class="fri">五</th>
<th class="sat">六</th>
</tr>
({foreach from=$calendar item=week})
<tr>
({foreach from=$week item=item name=weekloop})
<td class="day({if $item.now}) today({/if})({if $smarty.foreach.weekloop.first}) sun({/if})({if $item.holiday}) holiday({/if})">({strip})
({if $item.day})
({$item.day})

({if $add_schedule})
<p><a href="({t_url m=pc a=page_h_schedule_add})&amp;year=({$ym.year_disp})&amp;month=({$ym.month_disp})&amp;day=({$item.day})"><img src="({t_img_url_skin filename=icon_schedule})" alt="追加日程 " /></a></p>
({/if})

({* 节日 *})
({if $item.holiday})
({foreach from=$item.holiday item=item_holiday})
<p>({$item_holiday})</p>
({/foreach})
({/if})

({* 生日 *})
({foreach from=$item.birth item=item_birth})
({if $item_birth.public_flag_birth_month_day != "private" || $c_member.c_member_id == $item_birth.c_member_id})
<p><img src="({t_img_url_skin filename=icon_birthday})" alt="生日" /><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})</a></p>
({/if})
({/foreach})

({* 活动 *})
({foreach from=$item.event item=item_event})
<p><img src="({if $item_event.is_join})({t_img_url_skin filename=icon_event_R})({else})({t_img_url_skin filename=icon_event_B})({/if})" alt="イベント" /><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name})</a></p>
({/foreach})

({* 日程 *})
({foreach from=$item.schedule item=item_schedule})
<p><img src="({t_img_url_skin filename=icon_pen})" alt="日程" /><a href="({t_url m=pc a=page_h_schedule})&amp;target_c_schedule_id=({$item_schedule.c_schedule_id})">({$item_schedule.title})</a></p>
({/foreach})

({/if})
({/strip})</td>
({/foreach})
</tr>
({/foreach})
</table>

<div class="block">
<p class="pager">
<a href="({t_url m=pc a=page_h_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})">&lt;&lt; 上个月</a>
 | <a href="({t_url m=pc a=page_h_calendar})">本月</a>
 | <a href="({t_url m=pc a=page_h_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})">下个月 &gt;&gt;</a>
</p>
</div>

<div class="partsInfo">
({if $add_schedule})
<p>※<img src="({t_img_url_skin filename=icon_schedule})" alt="日程追加" />点击图标可输入预定。预定不对他人公开。</p>
({/if})
<p>※<img src="({t_img_url_skin filename=icon_birthday})" alt="生日" />({$WORD_MY_FRIEND})的生日<img src="({t_img_url_skin filename=icon_event_B})" alt="活动" />代表活动<img src="({t_img_url_skin filename=icon_event_R})" alt="参加的活动" />代表参加的活动。</p>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
