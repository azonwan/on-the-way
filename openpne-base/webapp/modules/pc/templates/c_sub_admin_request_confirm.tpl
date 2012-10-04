<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>以下内容可以吗？</h3></div>

<div class="partsInfo">
<p>邀请({$target_c_member.nickname})成为圈子副管理员，可以吗？</p>
</div>

<table>
<tr><th>照片</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})"><img src="({t_img_url filename=$target_c_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td></tr>
<tr><th>昵称</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})">({$target_c_member.nickname})</a></td></tr>
<tr><th>内容 (任意)</th><td>({$body|nl2br})</td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_sub_admin_request_insert_c_commu_sub_admin_confirm})
<input type="hidden" name="target_c_member_id" value="({$target_c_member.c_member_id})" />
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})" />
<input type="hidden" name="body" value="({$body})" />
<input type="submit" class="input_submit" value="　送　信　" />
({/t_form_block})
</li><li>
({t_form_block m=pc a=page_c_sub_admin_request})
<input type="hidden" name="target_c_member_id" value="({$target_c_member.c_member_id})" />
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})" />
<input type="hidden" name="body" value="({$body})" />
<input type="submit" class="input_submit" value="　修　改　" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
