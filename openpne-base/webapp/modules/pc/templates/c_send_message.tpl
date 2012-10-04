<div id="LayoutC">
<div id="Center">

({if $c_commu.member_count!=1})
({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>向参加({$WORD_COMMUNITY})的全体成员发送短信</h3></div>

({t_form_block m=pc a=do_c_send_message})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />

<div class="partsInfo">
<p>向({$WORD_COMMUNITY})参加者发送短信。<br />※请注意：有的圈子成员可能把“管理人发来的短信”设定为“拒收”状态，此时不能对此成员发送短信。</p>
</div>

<table>
<tr><th>({$WORD_COMMUNITY})名</th><td>({$c_commu.name})</td></tr>
<tr><th>标题</th><td><input type="text" class="text" name="subject" size="50" /></td></tr>
<tr><th>短信</th><td><textarea name="body" rows="6" cols="50">({$body})</textarea></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　送　　信　" /></li>
</ul>
</div>

({/t_form_block})
</div></div>
({* }}} *})

({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>向参加({$WORD_COMMUNITY})全体成员发送短信</h3></div>
<div class="block">
<p>发送消息的成员不存在。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
