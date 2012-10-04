<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>编辑相册</h3></div>
<div class="partsInfo"><p>以下内容可以吗？</p></div>
<table>
<tr>
<th>标题</th>
<td>({$form_val.subject})</td>
</tr>
<tr>
<th>说明</th>
<td>({$form_val.description|nl2br|t_url2a})</td>
</tr>
<tr>
<th>封面</th>
<td>({$form_val.upfile_1.name})</td>
</tr>
<tr>
<th>公开范围</th>
<td>
({if $form_val.public_flag == "public"})
全体公开
({elseif $form_val.public_flag == "friend"})
对({$WORD_MY_FRIEND})公开
({elseif $form_val.public_flag == "private"})
不公开
({/if})
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_album_cover_edit_insert_c_album})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　发 　表　" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_h_album_cover_edit})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　修 　改　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
