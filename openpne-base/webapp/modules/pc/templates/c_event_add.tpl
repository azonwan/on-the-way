<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>发起新活动</h3><p>(加<strong>※</strong>的符号为必填项。)</p></div>
({t_form_block _enctype=file m=pc a=page_c_event_add_confirm})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<table>
<tr>
<th>标  题 <strong>※</strong></th>
<td><input type="text" class="input_text" name="title" value="({$event.title})" size="40" /></td>
</tr>
<tr>
<th>举办时间 <strong>※</strong></th>
<td>
<select name="open_date_year">
<option value="">----</option>
({html_options values=$year selected=$event.open_date_year output=$year})
</select> 年
<select name="open_date_month">
<option value="">----</option>
({html_options values=$month selected=$event.open_date_month output=$month})
</select> 月
<select name="open_date_day">
<option value="">----</option>
({html_options values=$day selected=$event.open_date_day output=$day})
</select> 日
（补充：<input type="text" class="input_text" name="open_date_comment" value="({$event.open_date_comment})" />）
</td>
</tr>
<tr>
<th>举办场地</th>
<td>
<select name="open_pref_id">
<option value="0">请选择</option>
({html_options options=$pref selected=$event.open_pref_id})
</select>
（补充：<input type="text" class="input_text" name="open_pref_comment" value="({$event.open_pref_comment})" />）
</td>
</tr>
<tr>
<th>详  细<strong>※</strong></th>
<td>
<textarea name="detail" rows="6" cols="50">({$event.detail})</textarea>
</td>
</tr>
<tr>
<th>报名期限</th>
<td>
<select name="invite_period_year">
<option value="">----</option>
({html_options values=$year selected=$event.invite_period_year output=$year})
</select> 年
<select name="invite_period_month">
<option value="">--</option>
({html_options values=$month selected=$event.invite_period_month output=$month})
</select> 月
<select name="invite_period_day">
<option value="">--</option>
({html_options values=$day selected=$event.invite_period_day output=$day})
</select> 日
</td>
</tr>
<tr>
<th>募集人数</th>
<td>
<input type="text" class="input_text" name="capacity" value="({if $event.capacity})({$event.capacity})({/if})" />
</td>
</tr>
<tr><th>照 片 1</th><td><input type="file" name="image_filename1" size="40" /></td></tr>
<tr><th>照 片 2</th><td><input type="file" name="image_filename2" size="40" /></td></tr>
<tr><th>照 片 3</th><td><input type="file" name="image_filename3" size="40" /></td></tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="确认" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
