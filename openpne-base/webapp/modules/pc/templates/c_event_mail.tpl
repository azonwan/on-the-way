<div id="LayoutC">
<div id="Center">

({if !$c_event_member_list})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>发送概要邮件</h3></div>
<div class="block">
<p>发送对象不存在。</p>
</div>
</div></div>
({* }}} *})
({else})
({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>发送概要邮件</h3></div>
({t_form_block m=pc a=page_c_event_mail_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})" />
<table>
<tr><th>姓  名</th><td>
<div class="checkList">
({foreach from=$c_event_member_list item=item})
({counter assign=_cnt})
({if $_cnt % 3 == 1})<ul>({/if})
<li><input type="checkbox" class="input_checkbox" id="m({$item.c_member_id})" name="c_member_id[]" value="({$item.c_member_id})" checked="checked" /><label for="m({$item.c_member_id})">({$item.nickname})</label></li>
({if $_cnt % 3 == 0})</ul>({/if})
({/foreach})
({if $_cnt % 3 != 0})</ul>({/if})
</div>
</td></tr>
<tr><th>短  信</th><td><textarea name="body" rows="8" cols="50"></textarea></td></tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="确认" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})
({/if})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_commu_topic_id})">返回活动首页</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
