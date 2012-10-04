<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>删除以下照片吗？</h3></div>

<table>
<tr>
<td>
<img src="({t_img_url filename=$target_c_album_image.image_filename w=180 h=180})" alt="photo" vspace="4" />
<br />
({$target_c_album_image.image_description|nl2br|default:"&nbsp;"})<br />
</td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_album_edit_delete_image})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value=" 是 " />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=page_h_album_image_edit})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value=" 否 " />
({/t_form_block})
</li>
</ul>
</div> <!-- operation -->

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
