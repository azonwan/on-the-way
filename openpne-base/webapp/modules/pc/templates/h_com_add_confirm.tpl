<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>新建({$WORD_COMMUNITY})</h3></div>

<table>
<tr><th>({$WORD_COMMUNITY})名称</th><td>({$form_val.name})</td></tr>
<tr><th>分类</th><td>({$c_commu_category_value})<br /></td></tr>
<tr><th>参加条件<br />公开范围</th><td>({$public_flag_value})<br /></td></tr>
<tr><th>({$WORD_COMMUNITY})说明</th><td>({$form_val.info|nl2br|t_url2cmd:'community':$u|t_cmd:'community'})</td></tr>
<tr><th>照片</th><td>({$form_val.image_filename})<br /></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_com_add_insert_c_commu})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　创   建　" />
({/t_form_block})
</li><li>
({t_form_block m=pc a=page_h_com_add})
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
