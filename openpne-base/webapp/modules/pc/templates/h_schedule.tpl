<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>预定</h3></div>

<table>
<tr><th>标   题</th><td>({$c_schedule.title})</td></tr>
<tr><th>开   始</th><td>
({$c_schedule.start_date|date_format:"%Y"}) 年
({$c_schedule.start_date|date_format:"%m"}) 月
({$c_schedule.start_date|date_format:"%d"}) 日
({if is_null($c_schedule.start_time)})
-- 时
-- 分
({else})
({$c_schedule.start_time|date_format:"%H"}) 時
({$c_schedule.start_time|date_format:"%M"}) 分
({/if})
</td></tr>
<tr><th>结   束</th><td>
({$c_schedule.end_date|date_format:"%Y"}) 年
({$c_schedule.end_date|date_format:"%m"}) 月
({$c_schedule.end_date|date_format:"%d"}) 日
({if is_null($c_schedule.end_time)})
-- 时
-- 分
({else})
({$c_schedule.end_time|date_format:"%H"}) 时
({$c_schedule.end_time|date_format:"%M"}) 分
({/if})
</td></tr>
<tr><th>详   细</th><td>({$c_schedule.body|nl2br})</td></tr>
({if !$is_unused_schedule})
<tr><th>通知邮件</th><td>
({if $c_schedule.is_receive_mail})
接收
({else})
不接收
({/if})
</td></tr>
({/if})
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=page_h_schedule_edit})
<input type="hidden" name="target_c_schedule_id" value="({$c_schedule.c_schedule_id})" />
<input type="submit" class="input_submit" value="　 编　　辑 　" />
({/t_form_block})
</li><li>
({t_form_block m=pc a=page_h_schedule_delete})
<input type="hidden" name="target_c_schedule_id" value="({$c_schedule.c_schedule_id})" />
<input type="submit" class="input_submit" value="　 删　　除 　" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
