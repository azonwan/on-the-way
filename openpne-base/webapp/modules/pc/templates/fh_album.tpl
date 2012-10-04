<div id="LayoutB">
<div id="Left">

({* {{{ sideNav *})
<div class="parts sideNav">
<div class="item listCategory">
<div class="partsHeading"><h3>最新相册</h3></div>
<ul class="list">
({foreach from=$target_album_list item=item})
<li><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject})</a></li>
({/foreach})
</ul>
</div>
</div>

<div class="parts sideNav">
<div class="item listCategory">
<div class="partsHeading"><h3>最新留言</h3></div>
<ul class="list">

<li><a href="({t_url m=pc a=page_fh_album_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})">留言一览</a></li>

</ul>
</div>
</div>


({* }}} *})

</div><!-- Left -->

<div id="Center">

({* {{{ albumDetailBox *})
<div class="dparts albumDetailBox"><div class="parts">
<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})({/if})的相册</h3></div>
<table>
<tr>
<td class="photo" rowspan="({if $type == "h"})5({else})4({/if})">
({if $album_info.album_cover_image})
<a href="({t_img_url filename=$album_info.album_cover_image})" target="_blank"><img src="({t_img_url filename=$album_info.album_cover_image w=180 h=180})" alt="" /></a>
({else})
<img src="({t_img_url filename=$album_info.album_cover_image w=180 h=180})" alt="" />
({/if})
</td>
<th>题目</th>
<td>({$album_info.subject})</td>
</tr>
<tr>
<th>说明</th>
<td>({$album_info.description|nl2br|t_url2a})</td>
</tr>
<tr>
<th>公开范围</th>
<td>
({if $album_info.public_flag == "public"})
全体公开
({elseif $album_info.public_flag == "friend"})
只对({$WORD_MY_FRIEND})公开
({elseif $album_info.public_flag == "private"})
不公开
({/if})
</td>
</tr>
<tr>
<th>发表日期</th>
<td>({$album_info.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</td>
</tr>
({if $type == "h"})
<tr>
<td class="operation" colspan="2">
<a href="({t_url m=pc a=page_h_album_cover_edit})&amp;target_c_album_id=({$album_info.c_album_id})">相册编辑</a>
 | <a href="({t_url m=pc a=page_h_album_image_add})&amp;target_c_album_id=({$album_info.c_album_id})">添加新照片</a>
 | ({if $album_image_list})<a href="#write">留言（({$comment_num}) ）</a></div>({else})留言({/if})
</td>
</tr>
({/if})
</table>
</div></div>
({* }}} *})

({if $album_image_list})
({* {{{ albumImageList *})
<div class="dparts albumImageList"><div class="parts">
<div class="partsHeading"><h3>照片一览</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_album})&amp;page=({$page-1})&amp;target_c_album_id=({$target_c_album_id})">上一页</a></p>({/if})
<p class="number">
({$total_num})条中显示({$page*$page_size-$page_size+1})条～
({if $page_size > $album_list_count})
({$album_list_count+$page*$page_size-$page_size})
({else})
({$page*$page_size})
({/if})
条
</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_fh_album})&amp;page=({$page+1})&amp;target_c_album_id=({$target_c_album_id})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<table>
({foreach from=$album_image_list item=item})
({counter assign=_cnt})
({if $_cnt % 2 == 1})<tr>({/if})
<td>
({if $item.image_filename})
<p class="image">
<a href="({t_url m=pc a=page_fh_album_image_show})&amp;target_c_album_image_id=({$item.c_album_image_id})"><img src="({t_img_url filename=$item.image_filename w=180 h=180})" alt="" /></a><br />({if $type == "h"})<a href="({t_url m=pc a=page_h_album_image_edit})&amp;target_c_album_id=({$item.c_album_id})&amp;target_c_album_image_id=({$item.c_album_image_id})">编辑照片</a>({/if})
</p>
<p class="text">({$item.image_description})</p>
({/if})
</td>
({if $_cnt % 2 == 0})</tr>({/if})
({/foreach})
({if $_cnt % 2 == 1})<td></td></tr>({/if})
</table>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({/if})

({if $target_album_comment_list})
<div class="dparts commentList"><div class="parts">
<div class="partsHeading"><h3>留言列表</h3></div>
<dl>
({foreach from=$target_album_comment_list item=item})
<div style="border-top:1px solid #CCCCCC">
<dt>({$item.r_datetime|date_format:"%m-%d-%Y<br>%H:%M"})<br/>
({if $type == "h"})
			<input type="checkbox" name="target_c_album_comment_id[]" value="({$item.c_album_comment_id})" class="no_bg">
			({/if})
</dt>
<dd>
<div class="title">
({if $item.nickname})
			<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><span class="DOM_fh_album_comment_writer">({$item.nickname|default:"&nbsp;"})</span></a>
			({else})
			&nbsp;
			({/if})

</div>		
<div class="body">({$item.body|nl2br|t_url2cmd:'diary':$item.c_member_id|t_cmd:'diary'|t_decoration})<br/>

			({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})
			({if $item.image_filename_1})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename_1})" target="_blank"><img src="({t_img_url filename=$item.image_filename_1 w=120 h=120})"></a></span>({/if})
			({if $item.image_filename_2})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename_2})" target="_blank"><img src="({t_img_url filename=$item.image_filename_2 w=120 h=120})"></a></span>({/if})
			({if $item.image_filename_3})<span class="padding_s"><a href="({t_img_url filename=$item.image_filename_3})" target="_blank"><img src="({t_img_url filename=$item.image_filename_3 w=120 h=120})"></a></span>({/if})
			<br>
			({/if})

</div>
</dd>
</div>
({/foreach})

<table border="0" cellspacing="0" cellpadding="0" style="height:20px;">
				<tr>
				  <td height="30px">
					<div align="center" style="text-align:center;">
					({if $type == "h" })
			&nbsp;<a  class="input_submit" href="({t_url m=pc a=page_fh_delete_album_comment})&amp;target_c_album_id=({$item.c_album_id})&amp;target_c_album_comment_id=({$item.c_album_comment_id})">删 除</a>
			({/if})<br/>
					</div>
				  </td>
				</tr>
</table>
			
</dl>


</div></div>
({/if})

<div class="dparts albumDetailBox"><div class="parts">
<div class="partsHeading"><h3><a name="write">留言</a></h3></div>
({t_form_block _enctype=file m=pc a=page_fh_album_comment_add_confirm})
<table>
<tr>
<th>内  容</th>
<td>
({if $inc_entry_point[3]})({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({ext_include file="inc_tinymce_textarea.tpl" _name="body" _rows="15" _cols="50" _body=$form_val.body|smarty:nodefaults})

</td>
</tr>
<tr>
<th>照  片 1</th>
<td>
<input type="file" class="input_file" name="upfile_1" size="40" />
</td>
</tr>
<tr>
<th>照  片 2</th>
<td>
<input type="file" class="input_file" name="upfile_2" size="40" />
</td>
</tr>
<tr>
<th>照  片 3</th>
<td>
<input type="file" class="input_file" name="upfile_3" size="40" />
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})">
<li><input type="submit" class="input_submit" value="确认" /></li>
</ul>
</div>
({/t_form_block})
</div></div>

</div><!-- Center -->
</div><!-- LayoutB -->
