<div id="LayoutC">
<div id="Center">

({* {{{ photoUploadFormBox *})
<div class="dparts photoUploadFormBox"><div class="parts">
<div class="partsHeading"><h3>编辑照片</h3></div>
<table>
<tr>
<td>
({if $c_member.image_filename_1})
<img src="({t_img_url filename=$c_member.image_filename_1 w=180 h=180})" alt="" /><br />
[ <a href="({t_url m=pc a=do_h_config_image_delete_c_member_image})&amp;img_num=1&amp;sessid=({$PHPSESSID})">删除</a> |
({if $c_member.image_filename_1==$c_member.image_filename})
显示照片 
({else})
<a href="({t_url m=pc a=do_h_config_image_change_main_c_member_image})&amp;img_num=1&amp;sessid=({$PHPSESSID})">显示照片</a>
({/if}) ]
({else})
<img src="({t_img_url_skin filename=no_image w=180 h=180})" alt="" />
({/if})
</td>
<td>
({if $c_member.image_filename_2})
<img src="({t_img_url filename=$c_member.image_filename_2 w=180 h=180})" alt="" /><br />
[ <a href="({t_url m=pc a=do_h_config_image_delete_c_member_image})&amp;img_num=2&amp;sessid=({$PHPSESSID})">删除</a> |
({if $c_member.image_filename_2==$c_member.image_filename})
显示照片 
({else})
<a href="({t_url m=pc a=do_h_config_image_change_main_c_member_image})&amp;img_num=2&amp;sessid=({$PHPSESSID})">显示照片</a>
({/if}) ]
({else})
<img src="({t_img_url_skin filename=no_image w=180 h=180})" alt="" />
({/if})
</td>
<td>
({if $c_member.image_filename_3})
<img src="({t_img_url filename=$c_member.image_filename_3 w=180 h=180})" alt="" /><br />
[ <a href="({t_url m=pc a=do_h_config_image_delete_c_member_image})&amp;img_num=3&amp;sessid=({$PHPSESSID})">删除</a> |
({if $c_member.image_filename_3==$c_member.image_filename})
显示照片 
({else})
<a href="({t_url m=pc a=do_h_config_image_change_main_c_member_image})&amp;img_num=3&amp;sessid=({$PHPSESSID})">显示照片</a>
({/if}) ]
({else})
<img src="({t_img_url_skin filename=no_image w=180 h=180})" alt="" />
({/if})
</td>
</tr>
</table>

<div class="block">
({t_form_block _enctype=file m=pc a=do_h_config_image})
<p><input name="upfile" type="file" value=" 参 照 " /></p>
<p><input type="submit" class="input_submit" name="submit" value="上传照片" /></p>
({/t_form_block})
<ul>
<li>照片最多能上传3张。</li>
<li>请使用({$smarty.const.IMAGE_MAX_FILESIZE})KB以内的GIF・JPEG・PNG文件。</li>
<li>侵犯著作权・肖像权的、暴力的、卑猥的照片以及其他另一般人感到不快的照片禁止上传。上传者自身应对上传照片负责。。</li>
</ul>
</div>
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_home})">返回首页</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
