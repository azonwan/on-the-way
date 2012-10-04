<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>转交管理权</h3></div>
<div class="partsInfo">
<p>邀请({$member.nickname})成为圈子管理员。</p>
</div>
({t_form_block m=pc a=page_c_admin_request_confirm})
<input type="hidden" name="target_c_member_id" value="({$member.c_member_id})" />
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<table>
<tr><th>照片</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$member.c_member_id})"><img src="({t_img_url filename=$member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td></tr>
<tr><th>昵称</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$member.c_member_id})">({$member.nickname})</a></td></tr>
<tr><th>内容 (任意)</th><td><textarea name="body" rows="6" cols="50">({$body})</textarea></td></tr>
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
