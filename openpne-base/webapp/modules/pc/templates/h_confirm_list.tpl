<div id="LayoutC">
<div id="Center">

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>向您申请({$WORD_FRIEND})链接请求的成员</h3></div>

<div class="pagerAbsolute">
({if $anatani_c_friend_confirm_list})
<p>下列会员向您申请({$WORD_FRIEND})友情链接。<br />请选择同意或者拒绝。</p>
({else})
<p>目前没有人提出({$WORD_FRIEND})友情链接请求。</p>
({/if})
</div>

({if $anatani_c_friend_confirm_list})
<div class="block">
({foreach from=$anatani_c_friend_confirm_list item=item})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="3"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_from})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_from})">({$item.nickname})</a></td>
</tr><tr>
<th>短信</th><td>({$item.message|nl2br})</td>
</tr><tr class="operation">
<th>&nbsp;</th><td><span class="text"></span> <span class="moreInfo"><a href="({t_url m=pc a=do_h_confirm_list_insert_c_friend})&amp;target_c_friend_confirm_id=({$item.c_friend_confirm_id})&amp;sessid=({$PHPSESSID})"><img src="({t_img_url_skin filename=button_shonin})" alt="同意" /></a> <a href="({t_url m=pc a=do_h_confirm_list_delete_c_friend_confirm})&amp;target_c_friend_confirm_id=({$item.c_friend_confirm_id})&amp;sessid=({$PHPSESSID})" ><img src="({t_img_url_skin filename=button_kyohi})" alt="拒绝" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>
({/if})

</div></div>
({* }}} *})

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>推荐您参加管理({$WORD_COMMUNITY})的成员</h3></div>

<div class="pagerAbsolute">
({if $anatani_c_commu_member_confirm_list})
<p>以下会员推荐加入您管理的({$WORD_COMMUNITY})。<br />请选择同意或者拒绝。</p>
({else})
<p>您管理的({$WORD_COMMUNITY})现在没有申请加入的请求。</p>
({/if})
</div>

({if $anatani_c_commu_member_confirm_list})
<div class="block">
({foreach from=$anatani_c_commu_member_confirm_list item=item})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a></td>
</tr><tr>
<th>参加希望<br />({$WORD_COMMUNITY})</th><td><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.c_commu_name})</a></td>
</tr><tr>
<th>短信</th><td>({$item.message|nl2br})</td>
</tr><tr class="operation">
<th>&nbsp;</th><td><span class="text"></span> <span class="moreInfo"><a href="({t_url m=pc a=do_h_confirm_list_insert_c_commu_member})&amp;target_c_commu_member_confirm_id=({$item.c_commu_member_confirm_id})&amp;sessid=({$PHPSESSID})"><img src="({t_img_url_skin filename=button_shonin})" alt="同意" /></a> <a href="({t_url m=pc a=do_h_confirm_list_delete_c_commu_member_confirm})&amp;target_c_commu_member_confirm_id=({$item.c_commu_member_confirm_id})&amp;sessid=({$PHPSESSID})" ><img src="({t_img_url_skin filename=button_kyohi})" alt="拒绝" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>
({/if})

</div></div>
({* }}} *})

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>推荐您接替({$WORD_COMMUNITY})管理者的成员</h3></div>

<div class="pagerAbsolute">
({if $anatani_c_commu_admin_confirm_list})
<p>以下会员推荐您接替他(她)管理({$WORD_COMMUNITY})。<br />请选择同意或者拒绝。</p>
({else})
<p>现在没有成员推荐您作为接替({$WORD_COMMUNITY})管理员。</p>
({/if})
</div>

({if $anatani_c_commu_admin_confirm_list})
<div class="block">
({foreach from=$anatani_c_commu_admin_confirm_list item=item})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})">({$item.nickname})</a></td>
</tr><tr>
<th>({$WORD_COMMUNITY})</th><td><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.c_commu_name})</a></td>
</tr><tr>
<th>短信</th><td>({$item.message|nl2br})</td>
</tr><tr class="operation">
<th>&nbsp;</th><td><span class="text"></span> <span class="moreInfo"><a href="({t_url m=pc a=do_h_confirm_list_update_c_commu_admin_confirm})&amp;target_c_commu_admin_confirm_id=({$item.c_commu_admin_confirm_id})&amp;sessid=({$PHPSESSID})"><img src="({t_img_url_skin filename=button_shonin})" alt="同意" /></a> <a href="({t_url m=pc a=do_h_confirm_list_delete_c_commu_admin_confirm})&amp;target_c_commu_admin_confirm_id=({$item.c_commu_admin_confirm_id})&amp;sessid=({$PHPSESSID})"><img src="({t_img_url_skin filename=button_kyohi})" alt="拒绝" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>
({/if})

</div></div>
({* }}} *})

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>推荐您成为({$WORD_COMMUNITY})副管理员的成员</h3></div>

<div class="pagerAbsolute">
({if $anatani_c_commu_sub_admin_confirm_list})
<p>以下的人推荐您成为({$WORD_COMMUNITY})副管理员。<br />请选择同意或者拒绝。</p>
({else})
<p>现在没有成员推荐您作为({$WORD_COMMUNITY})副管理员。</p>
({/if})
</div>

({if $anatani_c_commu_sub_admin_confirm_list})
<div class="block">
({foreach from=$anatani_c_commu_sub_admin_confirm_list item=item})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_sub_admin})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_sub_admin})">({$item.nickname})</a></td>
</tr><tr>
<th>({$WORD_COMMUNITY})</th><td><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.c_commu_name})</a></td>
</tr><tr>
<th>短信</th><td>({$item.message|nl2br})</td>
</tr><tr class="operation">
<th>&nbsp;</th><td><span class="text"></span> <span class="moreInfo"><a href="({t_url m=pc a=do_h_confirm_list_update_c_commu_sub_admin_confirm})&amp;target_c_commu_sub_admin_confirm_id=({$item.c_commu_sub_admin_confirm_id})&amp;sessid=({$PHPSESSID})"><img src="({t_img_url_skin filename=button_shonin})" alt="同意" /></a> <a href="({t_url m=pc a=do_h_confirm_list_delete_c_commu_sub_admin_confirm})&amp;target_c_commu_sub_admin_confirm_id=({$item.c_commu_sub_admin_confirm_id})&amp;sessid=({$PHPSESSID})"><img src="({t_img_url_skin filename=button_kyohi})" alt="拒绝" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>
({/if})

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
