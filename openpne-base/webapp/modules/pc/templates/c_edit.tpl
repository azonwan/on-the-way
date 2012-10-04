<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>圈子管理设定</h3></div>
({t_form_block _enctype=file m=pc a=do_c_edit_update_c_commu})
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})" />
<table>
<tr><th>圈子名</th><td><input type="text" class="input_text" name="name" value="({$c_commu.name})" size="40" /></td></tr>
<tr><th>圈子分类</th><td>
<select name="c_commu_category_id">
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})"({if $item.c_commu_category_id == $c_commu.c_commu_category_id}) selected="selected"({/if})>({$item.name})</option>
({/foreach})
</select>
</td></tr>
<tr><th>参加条件<br>公开范围</th><td>
<ul>
({foreach from=$public_flag_list key=key item=item})
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_({$key})" value="({$key})"({if $key == $c_commu.public_flag}) checked="checked"({/if}) /><label for="public_flag_({$key})">({$item})</label></li>
({/foreach})
</ul>
</td></tr>
<tr><th>发帖权限</th><td>
<ul>
({foreach from=$topic_authority_list key=key item=item})
<li><input type="radio" class="input_radio" name="topic_authority" id="topic_authority_({$key})" value="({$key})"({if $key == $c_commu.topic_authority}) checked="checked"({/if}) /><label for="topic_authority_({$key})">({$item})</label></li>
({/foreach})
</ul>
</td></tr>
<tr><th>圈子介绍</th><td><textarea name="info" rows="6" cols="50">({$c_commu.info})</textarea></td></tr>
<tr><th>照&nbsp;片</th><td>
({if $c_commu.image_filename})
<p>
<img src="({t_img_url filename=$c_commu.image_filename w=76 h=76})" alt="" /><br />
<a href="({t_url m=pc a=do_c_edit_image_delete_c_commu_image})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;sessid=({$PHPSESSID})">删除</a>
</p>
({/if})
<input type="file" size="40" name="image_filename" />
</td></tr>
({if !$is_unused_join_commu})
<tr><th>参加通知<br>收信设定</th><td>
<ul>
<li><input type="radio" class="input_radio" name="is_send_join_mail" id="is_send_join_mail_1" value="1"({if $c_commu.is_send_join_mail}) checked="checked"({/if}) /><label for="is_send_join_mail_1">收信</label></li>
<li><input type="radio" class="input_radio" name="is_send_join_mail" id="is_send_join_mail_0" value="0"({if !$c_commu.is_send_join_mail}) checked="checked"({/if}) /><label for="is_send_join_mail_0">不收信</label></li>
</ul>
<p>※当圈子有新人加入时，会向管理者您发送通知邮件。</p>
</td></tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="变　更" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({if $c_commu.c_member_id_sub_admin != $u && $c_commu.c_member_id_admin == $u})
({if $is_topic})

({* {{{ descriptionBox *})
<div class="dparts descriptionBox"><div class="parts">
<div class="partsHeading"><h3>删除圈子说明</h3></div>
<div class="block">
<p>要删除({$WORD_COMMUNITY})，必须先要删除圈子内所有话题。<br />
圈子内有话题删除后，请再度访问此页面。<br />
点击（出现的【删除按钮】）<br />
<br />
删除时为避免纠纷，应事先向参加者发送删除通知。</p>
</div>
</div></div>
({* }}} *})

({else})

({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>删除圈子</h3></div>
<div class="block">
<p>删除此圈子。删除时为避免纠纷，应事先向参加者发送删除通知。</p>
({t_form_block m=pc a=page_c_edit_delete_c_commu_confirm})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="删　除" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})

({/if})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
