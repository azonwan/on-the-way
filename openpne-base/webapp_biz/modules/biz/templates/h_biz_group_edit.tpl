<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>团队信息编辑</h3></div>

({t_form_block _enctype=file m=biz a=do_h_biz_group_edit})
<input name="admin" type="hidden" value="({$group.admin_id})" />
<input name="target_id" type="hidden" value="({$group.biz_group_id})" />
<input name="image_filename" type="hidden" value="({$group.image_filename})" />
<table><tr>
<th>团队名称</th><td><input type="text" class="input_text" name="name" size="50" value="({$group.name})" /></td>
</tr><tr>
<th>团队简介/说明</th><td><textarea name="info" rows="6" cols="50">({$group.info})</textarea></td>
</tr><tr>
<th>主题图片</th><td>
({if $group.image_filename})
<img src="({t_img_url filename=$group.image_filename w=76 h=76})" alt="" /><br />
<a href="({t_url m=biz a=do_h_biz_group_image_delete})&amp;id=({$group.biz_group_id})&amp;filename=({$group.image_filename})&amp;sessid=({$PHPSESSID})">删除主题图片</a><br />
({/if})
<input type="file" name="image_filename" size="40" />
</td>
</tr><tr>
<th>参加者</th><td>
<div class="checkList">
({foreach from=$c_invite_list name=mem item=c_invite})
({counter assign=_cnt})
({if $_cnt % 3 == 1})<ul>({/if})
({if $c_invite.c_member_id == $c_member_id})
<li><input type="hidden" name="member_list[]" value="({$c_invite.c_member_id})" />({$c_invite.nickname})</li>
({else})
<li><input type="checkbox" class="input_checkbox" id="m({$c_invite.c_member_id})" name="member_list[]" value="({$c_invite.c_member_id})"({if $c_invite.joined}) checked="checked"({/if}) /><label for="m({$c_invite.c_member_id})">({$c_invite.nickname})</label></li>
({/if})
({if $_cnt % 3 == 0})</ul>({/if})
({/foreach})
({if $_cnt % 3 != 0})</ul>({/if})
</div>
</td>
</tr></table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="更改确定" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>删除团队</h3></div>
<div class="block">
<p>如果你决定解散此团队，可以点击下面的确定按钮。</p>
({t_form_block m=biz a=page_h_biz_group_delete})
<input name="target_id" type="hidden" value="({$group.biz_group_id})" />
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="确定" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
