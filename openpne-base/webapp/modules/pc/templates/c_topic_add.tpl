<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>发表新帖</h3></div>
({t_form_block _enctype=file m=pc a=page_c_topic_add_confirm})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<table>
<tr><th>标　　题</th><td><input type="text" class="input_text" name="title" value="({$title})" size="50" /></td></tr>
<tr><th>内　　容</th><td>({ext_include file="inc_tinymce_textarea.tpl" _name="body" _rows="15" _cols="50" _body=$body})</textarea></td></tr>
<tr><th>照　片 1</th><td><input type="file" class="input_file" name="image_filename1" size="40" /></td></tr>
<tr><th>照　片 2</th><td><input type="file" class="input_file" name="image_filename2" size="40" /></td></tr>
<tr><th>照　片 3</th><td><input type="file" class="input_file" name="image_filename3" size="40" /></td></tr>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<tr>
<th>文件</th>
<td>
<input type="file" class="input_file" name="uploadfile" size="40" />
<p class="caution">※文件大小在({$smarty.const.FILE_MAX_FILESIZE})KB以内({if $allowed_extensions})、文件种类为(({$allowed_extensions}))({/if})的文件可以上传。</p>
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="确 认" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
