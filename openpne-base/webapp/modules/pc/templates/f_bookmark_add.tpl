<div id="LayoutC">
<div id="Center">

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>添加以下的成员吗？</h3></div>

<div class="block">
<div class="ditem"><div class="item">
<table><tr>
<td class="photo" rowspan="3"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})"><img src="({t_img_url filename=$c_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td>({$c_member.nickname})</td>
</tr><tr>
<th>自我介绍</th><td>({$c_member.profile.self_intro.value|t_truncate:36:"":3})</td>
</tr><tr>
<th>上次登录</th><td>({$c_member.last_login})</td>
</tr></table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_f_bookmark_add})
<input type="hidden" name="c_member_id" value="({$c_member.c_member_id})" />
<input type="submit" class="input_submit" value="　是　" />
({/t_form_block})
</li>
<li>
({t_form_block _method=get m=pc a=page_f_home})
<input type="hidden" name="target_c_member_id" value="({$c_member.c_member_id})" />
<input type="submit" class="input_submit" value="　否   " />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
