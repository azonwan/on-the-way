<div id="LayoutC">
<div id="Center">

({if !$f_invite_list})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>推荐给({$WORD_MY_FRIEND})认识</h3></div>
<div class="block">
<p>目前还没有朋友可以推荐</p>
</div>
</div></div>
({* }}} *})

({else})

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>介绍({$WORD_MY_FRIEND})</h3></div>
<div class="partsInfo">
<p>请写推荐的信息 。</p>
</div>
({t_form_block m=pc a=do_f_invite_insert_c_message_friend_invite})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})" />
<table>
<tr>
<th>相片</th>
<td><img src="({t_img_url filename=$target_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></td>
</tr>
<tr>
<th>({$WORD_NICKNAME})</th>
<td>({$target_member.nickname})</td>
</tr>
<tr>
<th>把他介绍给</th>
<td>
<div class="checkList">
({foreach from=$f_invite_list item=c_invite})
({counter assign=_cnt})
({if $_cnt % 3 == 1})<ul>({/if})
<li><input type="checkbox" class="input_checkbox" id="m({$c_invite.c_member_id})" name="c_member_id_list[]" value="({$c_invite.c_member_id})" /><label for="m({$c_invite.c_member_id})">({$c_invite.nickname})</label></li>
({if $_cnt % 3 == 0})</ul>({/if})
({/foreach})
({if $_cnt % 3 != 0})</ul>({/if})
</div>
</td>
</tr>
<tr>
<th>短信</th>
<td>
<textarea name="body" rows="5" cols="50">({$target_member.nickname})介绍。</textarea>
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="送信" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
