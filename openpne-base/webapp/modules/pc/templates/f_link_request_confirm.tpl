<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>发送朋友链接请求？</h3></div>

<div class="partsInfo">
<p>
({$target_member.nickname}) 是朋友？或者是认识他（她）吗？<br />
对({$WORD_MY_FRIEND})发送链接请求短信前， 请慎重考虑一下。<br />
※对没有过来往的人突然发送链接请求，可能会有些不礼貌。请在有足够把握的情况下申请链接。
</p>
</div>

<table>
<tr><th>照片</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td></tr>
<tr><th>送信地址</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})">({$target_member.nickname})</a></td></tr>
<tr><th>短信内容(任何)</th><td>({$form.body|nl2br})</td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_f_link_request_insert_c_friend_confirm})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})" />
<input type="hidden" name="body" value="({$form.body})" />
<input type="submit" class="input_submit" value="　送　信　" />
({/t_form_block})
</li><li>
({t_form_block m=pc a=page_f_link_request})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})" />
<input type="hidden" name="body" value="({$form.body})" />
<input type="submit" class="input_submit" value="　修　改　" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
