<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$WORD_DIARY})编辑</h3></div>
<div class="partsInfo">
<p>确认内容，如果可以请单击“确定”按钮。</p>
</div>
<table>
<tr><th>标题</th><td>({$form_val.subject})</td></tr>
<tr><th>内容</th><td>({$form_val.body|nl2br|t_url2cmd:'diary':$member.c_member_id|t_cmd:'diary'|t_decoration})</td></tr>
({if $form_val.upfile_1.name})
<tr><th>照片1</th><td>({$form_val.upfile_1.name})</td></tr>
({/if})
({if $form_val.upfile_2.name})
<tr><th>照片2</th><td>({$form_val.upfile_2.name})</td></tr>
({/if})
({if $form_val.upfile_3.name})
<tr><th>照片3</th><td>({$form_val.upfile_3.name})</td></tr>
({/if})
({if $form_val.category})
<tr><th>分类</th><td>({$form_val.category})</td></tr>
({/if})
<tr><th>公开范围</th><td>
({if $form_val.public_flag == "public"})
对全体公开
({elseif $form_val.public_flag == "friend"})
对({$WORD_MY_FRIEND})公开
({elseif $form_val.public_flag == "private"})
不公开
({/if})
</td></tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_diary_edit_insert_c_diary})
<input type="hidden" name="target_c_diary_id" value="({$form_val.target_c_diary_id})" />
<input type="hidden" name="subject" value="({$form_val.subject})" />
<input type="hidden" name="body" value="({$form_val.body})" />
<input type="hidden" name="public_flag" value="({$form_val.public_flag})" />
<input type="hidden" name="tmpfile_1" value="({$form_val.tmpfile_1})" />
<input type="hidden" name="tmpfile_2" value="({$form_val.tmpfile_2})" />
<input type="hidden" name="tmpfile_3" value="({$form_val.tmpfile_3})" />
<input type="hidden" name="category" value="({$form_val.category})" />
<input type="submit" class="input_submit" value="确定" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_h_diary_edit})
<input type="hidden" name="target_c_diary_id" value="({$form_val.target_c_diary_id})" />
<input type="hidden" name="del_img" value="({$form_val.del_img})" />
<input type="hidden" name="subject" value="({$form_val.subject})" />
<input type="hidden" name="body" value="({$form_val.body})" />
<input type="hidden" name="public_flag" value="({$form_val.public_flag})" />
<input type="hidden" name="category" value="({$form_val.category})" />
<input type="submit" class="input_submit" value="修改" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
