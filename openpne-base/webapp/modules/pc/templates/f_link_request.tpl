<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>追加为({$WORD_MY_FRIEND})</h3></div>
<div class="partsInfo">
<p>
({$target_member.nickname}) 是朋友？或者是认识他（她）吗？<br />
对({$WORD_MY_FRIEND})送信链接请求短信前，请慎重考虑一下。<br />
※对没有过来往的人突然发送链接请求，可能会有些不礼貌。请在有足够把握的情况下申请链接。
</p>
</div>
({t_form_block m=pc a=page_f_link_request_confirm})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})" />
<table>
<tr>
<th>相片</th>
<td>
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
</td>
</tr>
<tr>
<th>({$WORD_NICKNAME})</th>
<td>
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})">({$target_member.nickname})</a>
</td>
</tr>
<tr>
<th>短信息(任何)</th>
<td>
<textarea name="body" rows="5" cols="50">({$form.body})</textarea>
</td>
</tr>
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
