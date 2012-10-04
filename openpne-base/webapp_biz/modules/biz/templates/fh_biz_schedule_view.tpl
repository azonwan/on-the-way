<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>计划内容确认</h3></div>

<table>
<tr>
<th>标题</th><td>({$schedule.title})</td>
</tr>
<tr>
<th>计划时间</th><td>
({strip})
({if $schedule.rep_type_loc})
	毎周 ({$schedule.rep_type_loc}) 
({else})
	({$schedule.begin_date})
({/if})

({if $schedule.begin_date != $schedule.finish_date})
	～({$schedule.finish_date})
({/if})
({/strip})
({strip})
({$schedule.begin_time})
({if $schedule.begin_time || $schedule.finish_time})～({/if})
({$schedule.finish_time})
({/strip})
</td>
</tr>
({if $schedule.rep_first})<tr>
<th>开始日期</th>
<td>({$repeat_begin_date|date_format:"%Y年%m月%d日"})</td>
</tr>
<tr>
<th>期限</th>
<td>({$repeat_term})周</td>
</tr>({/if})
<tr>
<th>计划内容</th>
<td>({$schedule.value|nl2br})</td>
</tr>
({if $is_h})<tr>
<th>计划人</th>
<td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$schedule.c_member_id})">({$schedule.writer_name})</a><br /></td>
</tr>({/if})
<tr>
<th>参加者</th>
<td>
({foreach item=name key=id from=$jmembers})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$id})">({$name})</a><br />
({/foreach})
</td>
</tr>
<tr>
<th>公开范围</th>
<td>
({if $schedule.public_flag == 'private'})
对参加者公开
({else})
对全体公开
({/if})
</td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block _method=get m=biz a=page_fh_biz_schedule_calendar})
<input type="hidden" name="target_id" value="({$target_c_member_id})" />
<input type="hidden" name="year" value="({$schedule.begin_date|date_format:'%Y'})" />
<input type="hidden" name="month" value="({$schedule.begin_date|date_format:'%m'})" />
<input value="确定" type="submit" class="input_submit" />
({/t_form_block})
</li>
<li>
({t_form_block m=biz a=page_fh_biz_schedule_edit})
<input type="hidden" name="rep_type" value="({$schedule.rep_type})" />
<input type="hidden" name="begin_date" value="({$schedule.begin_date})" />
<input type="hidden" name="begin_time" value="({$schedule.begin_time})" />
<input type="hidden" name="finish_date" value="({$schedule.finish_date})" />
<input type="hidden" name="finish_time" value="({$schedule.finish_time})" />
<input type="hidden" name="title" value="({$schedule.title})" />
<input type="hidden" name="value" value="({$schedule.value})" />
<input type="hidden" name="members" value="({$jmembers_enc})" />
<input type="hidden" name="schedule_id" value="({$schedule_id})" />
<input type="hidden" name="target_id" value="({$target_c_member_id})" />
<input type="hidden" name="sc_bn" value="({$sc_bn})" />
<input value="修改" type="submit" class="input_submit" />
({/t_form_block})
</li>
<li>
({t_form_block m=biz a=page_h_biz_schedule_delete})
<input type="hidden" name="schedule_id" value="({$schedule_id})" />
<input value="删除" type="submit" class="input_submit" />
({if $schedule.rep_first})<br />
<input value="1" type="checkbox" name="is_rep" checked="checked" />如果有重复的计划，将以最新的计划为准，删除以前的。
({/if})
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
