<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>以下的内容可以吗？</h3></div>

<table>
<tr><th>标   题</th><td>({$input.title})</td></tr>
<tr><th>开　　始</th><td>
({$input.start_year|string_format:"%04d"}) 年
({$input.start_month|string_format:"%02d"}) 月
({$input.start_day|string_format:"%02d"}) 日
({if is_null($input.start_hour)})
--
({else})
({$input.start_hour|string_format:"%02d"})
({/if}) 时
({if is_null($input.start_minute)})
--
({else})
({$input.start_minute|string_format:"%02d"})
({/if}) 分
</td></tr>
<tr><th>结　　束</th><td>
({$input.end_year|string_format:"%04d"}) 年
({$input.end_month|string_format:"%02d"}) 月
({$input.end_day|string_format:"%02d"}) 日
({if is_null($input.end_hour)})
--
({else})
({$input.end_hour|string_format:"%02d"})
({/if}) 时
({if is_null($input.end_minute)})
--
({else})
({$input.end_minute|string_format:"%02d"})
({/if}) 分
</td></tr>
<tr><th>详　　细</th><td>({$input.body|nl2br})</td></tr>
({if !$is_unused_schedule})
<tr><th>通知邮件</th><td>
({if $input.is_receive_mail})
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
({t_form_block m=pc a=do_h_schedule_add_insert_c_schedule})
<input type="hidden" name="title" value="({$input.title})" />
<input type="hidden" name="body" value="({$input.body})" />
<input type="hidden" name="start_year" value="({$input.start_year})" />
<input type="hidden" name="start_month" value="({$input.start_month})" />
<input type="hidden" name="start_day" value="({$input.start_day})" />
<input type="hidden" name="start_hour" value="({$input.start_hour})" />
<input type="hidden" name="start_minute" value="({$input.start_minute})" />
<input type="hidden" name="end_year" value="({$input.end_year})" />
<input type="hidden" name="end_month" value="({$input.end_month})" />
<input type="hidden" name="end_day" value="({$input.end_day})" />
<input type="hidden" name="end_hour" value="({$input.end_hour})" />
<input type="hidden" name="end_minute" value="({$input.end_minute})" />
<input type="hidden" name="is_receive_mail" value="({$input.is_receive_mail})" />
<input type="submit" class="input_submit" value="　 追　　加 　" />
({/t_form_block})
</li><li>
({t_form_block m=pc a=page_h_schedule_add})
<input type="hidden" name="title" value="({$input.title})" />
<input type="hidden" name="body" value="({$input.body})" />
<input type="hidden" name="start_year" value="({$input.start_year})" />
<input type="hidden" name="start_month" value="({$input.start_month})" />
<input type="hidden" name="start_day" value="({$input.start_day})" />
<input type="hidden" name="start_hour" value="({$input.start_hour})" />
<input type="hidden" name="start_minute" value="({$input.start_minute})" />
<input type="hidden" name="end_year" value="({$input.end_year})" />
<input type="hidden" name="end_month" value="({$input.end_month})" />
<input type="hidden" name="end_day" value="({$input.end_day})" />
<input type="hidden" name="end_hour" value="({$input.end_hour})" />
<input type="hidden" name="end_minute" value="({$input.end_minute})" />
<input type="hidden" name="is_receive_mail" value="({$input.is_receive_mail})" />
<input type="submit" class="input_submit" value="　 修　　改 　" /><br />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
