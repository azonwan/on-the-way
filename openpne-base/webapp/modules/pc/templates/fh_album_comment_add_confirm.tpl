<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>相册留言</h3></div>
<div class="partsInfo">
<p>发表以下留言吗？</p>
</div>
<table>
<tr>
<th>内容</th>
<td>({$form_val.body|nl2br|t_url2cmd:'diary':$member.c_member_id|t_cmd:'diary'|t_decoration})</td>
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
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_fh_album_comment_add_insert_c_album_comment})
<input type="hidden" name="body" value="({$form_val.body})" />
<input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})" />
<input type="hidden" name="tmpfile_2" value="({$form_val.tmpfile_2})" />
<input type="hidden" name="tmpfile_3" value="({$form_val.tmpfile_3})" />
<input type="hidden" name="target_c_album_id" value="({$form_val.target_c_album_id})" />

<input type="submit" class="input_submit" value="发表" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_fh_album target_c_album_id=$form_val.target_c_album_id})
<input type="hidden" name="body" value="({$form_val.body})" />
<input type="submit" class="input_submit" value="取消" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
