<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>发送短信</h3></div>
<div class="partsInfo">
<p>以下内容可以吗？</p>
</div>
<table>
<tr>
<th>照  片</th>
<td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
</tr>
<tr>
<th>送信地址</th>
<td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})">({$target_member.nickname})</a></td>
</tr>
<tr>
<th>主  题</th>
<td>({$form_val.subject})</td>
</tr>
<tr>
<th>短信息</th>
<td>({$form_val.body|nl2br|t_url2cmd:'message':$u|t_cmd:'message'})</td>
</tr>
({if $form_val.upfile_1.name})
<tr>
<th>照片1</th>
<td>({$form_val.upfile_1.name})</td>
</tr>
({/if})
({if $form_val.upfile_2.name})
<tr>
<th>照片2</th>
<td>({$form_val.upfile_2.name})</td>
</tr>
({/if})
({if $form_val.upfile_3.name})
<tr>
<th>照片3</th>
<td>({$form_val.upfile_3.name})</td>
</tr>
({/if})
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
({if $form_val.upfile_4.name})
<tr><th>文件</th><td>({$form_val.upfile_4.name})</td></tr>
({/if})
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_f_message_send_insert_c_message})
<input type="hidden" name="c_member_id_to" value="({$target_member.c_member_id})" />
<input type="hidden" name="subject" value="({$form_val.subject})" />
<input type="hidden" name="body" value="({$form_val.body})" />
<input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})" />
<input type="hidden" name="tmpfile_2" value="({$form_val.tmpfile_2})" />
<input type="hidden" name="tmpfile_3" value="({$form_val.tmpfile_3})" />
<input type="hidden" name="tmpfile_4" value="({$form_val.tmpfile_4})" />
<input type="hidden" name="tmpfile_4_original_filename" value="({$form_val.upfile_4.name})" />
<input type="hidden" name="target_c_message_id" value="({$form_val.target_c_message_id})" />
<input type="hidden" name="jyusin_c_message_id" value="({$form_val.jyusin_c_message_id})" />
<input type="submit" class="input_submit" name="yes" value="送信" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_f_message_send})
<input type="hidden" name="is_syusei" value="1" />
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})" />
<input type="hidden" name="subject" value="({$form_val.subject})" />
<input type="hidden" name="body" value="({$form_val.body})" />
<input type="hidden" name="target_c_message_id" value="({$form_val.target_c_message_id})" />
<input type="hidden" name="jyusin_c_message_id" value="({$form_val.jyusin_c_message_id})" />
<input type="submit" class="input_submit" name="no" value="修改" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
