<div id="LayoutC">
<div id="Center">

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>圈子成员强制退会</h3></div>
<div class="partsInfo">
<p>让这个人退出({$WORD_COMMUNITY})，没问题吗？</p>
</div>

<div class="block">
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$member.c_member_id})"><img src="({t_img_url filename=$member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td>({$member.nickname})</td>
</tr><tr>
<th>自我介绍</th><td>({$member.profile.self_intro.value|t_truncate:36:"":3})</td>
</tr><tr>
<th>最终登录时间</th>
<td class="operation"><span class="text">({$member.last_login})</span>
<div class="operation">
({t_form_block m=pc a=do_c_edit_member_delete_c_commu_member})
<input type="hidden" name="target_c_member_id" value="({$member.c_member_id})" />
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<input type="submit" class="input_submit" value="　送　信　" />
({/t_form_block})
({t_form_block _method=get m=pc a=page_c_edit_member})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<input type="submit" class="input_submit" value="取 消" />
({/t_form_block})
</div>
</td>
</tr></table></div></div>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
