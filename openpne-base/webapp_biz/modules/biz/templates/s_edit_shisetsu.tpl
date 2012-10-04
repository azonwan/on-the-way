<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>设施编辑</h3></div>

({t_form_block _enctype=file m=biz a=do_s_edit_shisetsu})
<input name="image_filename" type="hidden" value="({$list.image_filename})" />
<input name="target_id" type="hidden" value="({$id})" />

<table>
<tr>
<th>设施名称</th><td><input type="text" class="text" name="name" size="50" value="({$list.name})" /></td>
</tr>
<tr>
<th>内容</th><td><input type="text" class="text" name="info" size="50" value="({$list.info})" /></td>
</tr>
<tr>
<th>主题图片</th>
<td>
({if $list.image_filename})
<img src="({t_img_url filename=$list.image_filename w=76 h=76})" alt="" /><br />
<a href="({t_url m=biz a=do_h_biz_shisetsu_delete})&amp;id=({$list.biz_shisetsu_id})&amp;filename=({$list.image_filename})&amp;sessid=({$PHPSESSID})">删除主题图片</a><br />
({/if})
<input type="file" size="40" name="image_filename" /><br />
</td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　编　辑　" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
