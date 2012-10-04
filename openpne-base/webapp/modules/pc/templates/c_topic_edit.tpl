<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>编辑投稿话题</h3></div>
({t_form_block _enctype=file m=pc a=do_c_topic_edit_update_c_commu_topic})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})" />
<table>
<tr><th>标　　题</th><td><input type="text" class="input_text" name="title" value="({$c_topic.name})" size="50" /></td></tr>s
<tr><th>内　　容</th><td>({ext_include file="inc_tinymce_textarea.tpl" _name="body" _rows="15" _cols="50" _body=$c_topic.body|smarty:nodefaults})</td></tr>
<tr>
<th>照　片 1</th>
<td>
({if $c_topic.image_filename1})
<p>
<img src="({t_img_url filename=$c_topic.image_filename1 w=76 h=76})" alt="" /><br />
<a href="({t_url m=pc a=do_c_topic_edit_delete_c_commu_topic_comment_image})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;pic_delete=1&amp;sessid=({$PHPSESSID})">削除</a>
</p>
({/if})
<input type="file" class="input_file" name="image_filename1" size="40" />
</td>
</tr>
<tr>
<th>照　片 2</th>
<td>
({if $c_topic.image_filename2})
<p>
<img src="({t_img_url filename=$c_topic.image_filename2 w=76 h=76})" alt="" /><br />
<a href="({t_url m=pc a=do_c_topic_edit_delete_c_commu_topic_comment_image})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;pic_delete=2&amp;sessid=({$PHPSESSID})">削除</a>
</p>
({/if})
<input type="file" class="input_file" name="image_filename2" size="40" />
</td>
</tr>
<tr>
<th>照　片 3</th>
<td>
({if $c_topic.image_filename3})
<p>
<img src="({t_img_url filename=$c_topic.image_filename3 w=76 h=76})" alt="" /><br />
<a href="({t_url m=pc a=do_c_topic_edit_delete_c_commu_topic_comment_image})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;pic_delete=3&amp;sessid=({$PHPSESSID})">删除</a>
</p>
({/if})
<input type="file" class="input_file" name="image_filename3" size="40" />
</td>
</tr>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<tr>
<th>文件</th>
<td>
({if $c_topic.filename})
<p>
({$c_topic.original_filename})<br />
<a href="({t_url m=pc a=do_c_topic_edit_delete_c_commu_topic_comment_file})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;sessid=({$PHPSESSID})">删除</a>
</p>
({/if})
<input type="file" class="input_file" name="filename4" size="40" />
<p class="caution">※文件大小在({$smarty.const.FILE_MAX_FILESIZE})KB以内({if $allowed_extensions})、文件种类为(({$allowed_extensions}))({/if})的文件可以上传。</p>
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="编辑" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>删掉上述的话题投稿</h3></div>
({t_form_block m=pc a=page_c_topic_delete_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})" />
<div class="block">
<p><input type="submit" class="input_submit" value="删　除" /></p>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
