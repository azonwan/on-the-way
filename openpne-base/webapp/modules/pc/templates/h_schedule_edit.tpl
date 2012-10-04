<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>编辑预览</h3></div>
({t_form_block m=pc a=page_h_schedule_edit_confirm})
<input type="hidden" name="target_c_schedule_id" value="({$target_c_schedule_id})" />
<table>
<tr>
<th>标   题</th>
<td>
<input type="text" class="input_text" name="title" value="({$input.title})" size="40" />
</td>
</tr>
<tr>
<th>开始时间</th>
<td>
<select name="start_year">
({foreach from=$year_list item=item})
<option value="({$item})"({if $item==$input.start_year}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 年
<select name="start_month">
({foreach from=$month_list item=item})
<option value="({$item})"({if $item==$input.start_month}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 月
<select name="start_day">
({foreach from=$day_list item=item})
<option value="({$item})"({if $item==$input.start_day}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 日
<select name="start_hour"><option value="">--</option>
({foreach from=$hour_list item=item})
<option value="({$item})"({if $item==$input.start_hour}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 时
<select name="start_minute"><option value="">--</option>
({foreach from=$minute_list item=item})
<option value="({$item})"({if $item==$input.start_minute}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 分
</td>
</tr>
<tr>
<th>结束时间</th>
<td>
<select name="end_year"><option value="">----</option>
({foreach from=$year_list item=item})
<option value="({$item})"({if $item==$input.end_year}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 年
<select name="end_month"><option value="">--</option>
({foreach from=$month_list item=item})
<option value="({$item})"({if $item==$input.end_month}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 月
<select name="end_day"><option value="">--</option>
({foreach from=$day_list item=item})
<option value="({$item})"({if $item==$input.end_day}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 日
<select name="end_hour"><option value="">--</option>
({foreach from=$hour_list item=item})
<option value="({$item})"({if $item==$input.end_hour}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 时
<select name="end_minute"><option value="">--</option>
({foreach from=$minute_list item=item})
<option value="({$item})"({if $item==$input.end_minute}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 分
</td>
</tr>
<tr>
<th>详   细</th>
<td>
<textarea name="body" rows="6" cols="50">({$input.body})</textarea>
</td>
</tr>
({if !$is_unused_schedule})
<tr>
<th>通知邮件</th>
<td>
<input type="checkbox" class="input_checkbox" name="is_receive_mail" id="is_receive_mail" value="1"({if $input.is_receive_mail}) checked="checked"({/if}) /><label for="is_receive_mail">接收邮件</label>
<p>※预定当天早晨发通知邮件，送信地址为登录的邮件地址。</p>
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="  确认  " /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_schedule})&amp;target_c_schedule_id=({$target_c_schedule_id})">取   消</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
