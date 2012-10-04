<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>是否发表以下图片？</h3></div>

<table>
<tr>
<th>标题</th>
<td>({$form_val.subject})</td>
</tr>
<tr>
<th>照片１</th>
<td>({$form_val.upfile_1.name})</td>
</tr>
<tr>
<th>照片１说明</th>
<td>({$form_val.image_description1})</td>
</tr>
<tr>
<th>照片２</th>
<td>({$form_val.upfile_2.name})</td>
</tr>
<tr>
<th>照片２说明</th>
<td>({$form_val.image_description2})</td>
</tr>
<tr>
<th>照片３</th>
<td>({$form_val.upfile_3.name})</td>
</tr>
<tr>
<th>照片３说明</th>
<td>({$form_val.image_description3})</td>
</tr>
<tr>
<th>照片４</th>
<td>({$form_val.upfile_4.name})</td>
</tr>
<tr>
<th>照片４说明</th>
<td>({$form_val.image_description4})</td>
</tr>
<tr>
<th>照片５</th>
<td>({$form_val.upfile_5.name})</td>
</tr>
<tr>
<th>照片5说明</th>
<td>({$form_val.image_description5})</td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_album_image_add_insert_c_album_image})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　添  加　" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_h_album_image_add})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　修 　改  " />
({/t_form_block})
</li>
</ul>
</div> <!-- operation -->

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
