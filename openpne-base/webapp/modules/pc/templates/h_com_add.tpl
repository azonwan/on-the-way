<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>新建({$WORD_COMMUNITY})</h3></div>
({t_form_block _enctype=file m=pc a=page_h_com_add_confirm})
<table>
<tr>
<th>({$WORD_COMMUNITY})名称</th>
<td>
<input type="text" class="input_text" name="name" value="({$form_val.name})" size="50" />
</td>
</tr>
<tr>
<th>类别</th>
<td>
<select name="c_commu_category_id">
<option value="">请选择</option>
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})"({if $item.c_commu_category_id == $form_val.c_commu_category_id}) selected="selected"({/if})>({$item.name})</option>
({/foreach})
</select>
</td>
</tr>
<tr>
<th>参加条件公开范围</th>
<td>
<ul>
({foreach from=$public_flag_list item=item key=key})
<li><input type="radio" class="input_radio" name="public_flag" id="public_flag_({$key})" value="({$key})"({if $key==$form_val.public_flag||($key=="public"&&!$form_val.public_flag)}) checked="checked"({/if}) /><label for="public_flag_({$key})">({$item})</label></li>
({/foreach})
</ul>
</td>
</tr>
<tr>
<th>({$WORD_COMMUNITY})说明</th>
<td>
<textarea name="info" rows="6" cols="50">({$form_val.info})</textarea>
</td>
</tr>
<tr>
<th>照片</th>
<td>
<input type="file" class="input_file" name="image_filename" size="40" />
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="确认" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
