<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>发送短信</h3></div>
<div class="partsInfo">
<p>※垃圾信息、骚扰信息等禁止发送。</p>
</div>
({t_form_block _enctype=file m=pc a=page_f_message_send_confirm})
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})" />
<input type="hidden" name="target_c_message_id" value="({$form_val.target_c_message_id})" />
<input type="hidden" name="jyusin_c_message_id" value="({$form_val.jyusin_c_message_id})" />
<input type="hidden" name="box" value="({$box})" />
<table>
<tr>
<th>照  片</th>
<td>
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})"><img src="({t_img_url filename=$target_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a>
</td>
</tr>
<tr>
<th>送信地址</th>
<td>
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})">({$target_member.nickname})</a>
</td>
</tr>
<tr>
<th>主  题</th>
<td>
<input type="text" class="input_text" name="subject" value="({$form_val.subject})" size="60" />
</td>
</tr>
<tr>
<th>短  息</th>
<td>
<textarea name="body" rows="10" cols="50">({$form_val.body})</textarea>
</td>
</tr>
<tr>
<th>照片1</th>
<td>
<input type="file" class="input_file" name="upfile_1" size="40" />
</td>
</tr>
<tr>
<th>照片2</th>
<td>
<input type="file" class="input_file" name="upfile_2" size="40" />
</td>
</tr>
<tr>
<th>照片3</th>
<td>
<input type="file" class="input_file" name="upfile_3" size="40" />
</td>
</tr>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<tr>
<th>文件</th>
<td>
<input type="file" class="input_file" name="uploadfile" size="40" />
<p class="caution">※文件大小在({$smarty.const.FILE_MAX_FILESIZE})KB以内({if $allowed_extensions})、文件种类为(({$allowed_extensions}))({/if})的文件能上传。</p>
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="确认" /></li>
<li><input type="submit" class="input_submit" name="save" value="保存草稿" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
