<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>发送概要短信</h3></div>
<table>
<tr><th>姓  名</th><td>
<div class="checkList">
({foreach from=$c_mail_member item=item})
({counter assign=_cnt})
({if $_cnt % 3 == 1})<ul>({/if})
<li>({$item.nickname})</li>
({if $_cnt % 3 == 0})</ul>({/if})
({/foreach})
({if $_cnt % 3 != 0})</ul>({/if})
</div>
</td></tr>
<tr><th>短  信</th><td>({$body|nl2br|t_url2cmd:'message':$u|t_cmd:'message'})</td></tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_event_mail})
<input type="hidden" name="c_commu_id" value="({$c_commu_id})" />
<input type="hidden" name="c_commu_topic_id" value="({$c_commu_topic_id})" />
<input type="hidden" name="c_member_ids" value="({$c_member_ids})" />
<input type="hidden" name="body" value="({$body})" />
({foreach from=$c_mail_member item=c_member})
<input type="hidden" name="c_member_ids[]" value="({$c_member.c_member_id})" />
({/foreach})
<input type="submit" class="input_submit" value="送  信" />
({/t_form_block})
</li>
<li>
({t_form_block _method=get m=pc a=page_c_event_mail})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})" />
<input type="submit" class="input_submit" value="取  消" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_commu_topic_id})">返回圈子首页</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
