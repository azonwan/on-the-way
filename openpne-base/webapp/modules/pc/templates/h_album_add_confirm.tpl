<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>创建相册</h3></div>
<div class="partsInfo">
<p>以下内容可以吗？</p>
</div>
<table>
<tr>
<th>标  题</th>
<td>({$form_val.subject})</td>
</tr>
<tr>
<th>说  明</th>
<td>({$form_val.description|nl2br|t_url2a})</td>
</tr>
<tr>
<th>封  面</th>
<td>({$form_val.image_filename})</td>
</tr>
<tr>
<th>公开范围</th>
<td>
({if $form_val.public_flag == "public"})
对全体公开
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
({t_form_block m=pc a=do_h_album_add_insert_c_album})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　创  建　" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_h_album_add})
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
