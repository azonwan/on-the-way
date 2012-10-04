<div id="LayoutC">
<div id="Center">

({if $c_invite_list})
({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>把此({$WORD_COMMUNITY})推荐给({$WORD_MY_FRIEND})参加</h3></div>

<div class="partsInfo">
<p>请从({$WORD_MY_FRIEND})列表中选择要推荐的人选,写下您的推荐短信。<br />另外，如果是({$WORD_COMMUNITY})管理人发来的介绍时，即使({$WORD_COMMUNITY})为不公开制也可以无条件加入。</p>
</div>

({t_form_block m=pc a=do_c_invite_insert_c_message_commu_invite})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<table>
<tr><th>({$WORD_COMMUNITY})名</th><td>({$c_commu.name})</td></tr>
<tr><th>推荐给</th><td>
<table><tr><td>
({foreach from=$c_invite_list item=c_invite})
({counter assign=_cnt})
({if $_cnt % 3 == 1})<div class="checkList"><ul>({/if})
<li><input type="checkbox" class="input_checkbox" id="m({$c_invite.c_member_id})" name="c_member_id_list[]" value="({$c_invite.c_member_id})" alt="" /><label for="m({$c_invite.c_member_id})">({$c_invite.nickname})</label></li>
({if $_cnt % 3 == 0})</ul></div>({/if})
({/foreach})
({if $_cnt % 3 != 0})</ul></div>({/if})
</td></tr></table>
</td></tr>
<tr><th>短信</th><td><textarea name="body" rows="6" cols="50">({$body})</textarea></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　送信　" /></li>
</ul>
</div>

({/t_form_block})
</div></div>
({* }}} *})

({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>把此({$WORD_COMMUNITY})推荐给({$WORD_MY_FRIEND})参加</h3></div>
<div class="block">
<p>没有可推荐的朋友（也许你的朋友已经参加了此圈子）</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
