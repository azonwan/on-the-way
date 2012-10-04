<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>发起活动</h3></div>
<div class="partsInfo">
<p>以下内容，可以发表吗？</p>
</div>
<table>
<tr><th>标  题</th><td>({$event.title})</td></tr>
<tr><th>举办时间</th><td>({$event.open_date_year})年({$event.open_date_month})月({$event.open_date_day})日 ({$event.open_date_comment})</td></tr>
<tr><th>举办场地</th><td>({$event.open_pref_value}) ({$event.open_pref_comment})</td></tr>
<tr><th>详  细</th><td>({$event.detail|nl2br|t_url2cmd:'community':$u|t_cmd:'community'})</td></tr>
<tr><th>报名期限</th><td>
({if $event.invite_period_year&&$event.invite_period_month&&$event.invite_period_day})
({$event.invite_period_year})年({$event.invite_period_month})月({$event.invite_period_day})日
({/if})
</td></tr>
<tr><th>募集人数</th><td>({if $event.capacity})({$event.capacity})人({else})无限制({/if})</td></tr>
({if $event.image_filename1})
<tr><th>照  片 1</th><td>({$event.image_filename1})</td></tr>
({/if})
({if $event.image_filename2})
<tr><th>照  片 2</th><td>({$event.image_filename2})</td></tr>
({/if})
({if $event.image_filename3})
<tr><th>照  片 3</th><td>({$event.image_filename3})</td></tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_event_add_insert_c_commu_topic})
<input type="hidden" name="target_c_commu_id" value="({$event.c_commu_id})" />
({foreach from=$event key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="发　表" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_c_event_add})
<input type="hidden" name="target_c_commu_id" value="({$event.c_commu_id})" />
({foreach from=$event key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="修　改" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
