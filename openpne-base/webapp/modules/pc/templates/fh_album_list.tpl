<div id="LayoutB">

({if $type == 'h'})
({* {{{ searchFormLine *})
<div class="parts searchFormLine">
({t_form_block _method=get m=pc a=page_fh_album_list})
<ul>
<li><img src="({t_img_url_skin filename=icon_search})" alt="search" /></li>
<li><input type="text" class="input_text" name="keyword" value="({$keyword})" size="30" /></li>
<li><input type="submit" class="input_submit" value="相册检索" /></li>
</ul>
({/t_form_block})
</div>
({* }}} *})
({/if})

<div id="Left">

({* {{{ sideNav *})
<div class="parts sideNav">
<div class="item listCategory">
<div class="partsHeading"><h3>最新相册</h3></div>
<ul class="list">
({foreach from=$target_album_subject_list item=item})
<li><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject})</a></li>
({/foreach})
</ul>
</div>
</div>
({* }}} *})

</div><!-- Left -->

<div id="Center">

({if $type == "h"})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading">创建相册<h3></h3></div>
<div class="block">
({t_form_block _method=get m=pc a=page_h_album_add})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="创建相册" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})
({/if})

({if $target_album_list})
<div class="dparts albumList"><div class="parts">
<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})的({/if})相册</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})
<p class="prev"><a href="({t_url m=pc a=page_fh_album_list})&amp;page=({$page-1})&amp;target_c_member_id=({$target_member.c_member_id})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">上一页</a></p>
({/if})
<p class="number">
共({$total_num})条记录 ({$page*$page_size-$page_size+1})条～
({if $page_size > $album_list_count})
({$album_list_count+$page*$page_size-$page_size})
({else})
({$page*$page_size})
({/if})
条 记录
</p>
({if $is_next})
<p class="next"><a href="({t_url m=pc a=page_fh_album_list})&amp;page=({$page+1})&amp;target_c_member_id=({$target_member.c_member_id})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})">下一页</a></p>
({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$target_album_list item=item})
<table>
<tr>
<td class="photo" rowspan="5">
<a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({if $item.album_cover_image})({t_img_url filename=$item.album_cover_image w=180 h=180})({else})({t_img_url_skin filename=no_image w=180 h=180})({/if})" alt="" /></a>
</td>
<th>标题</th>
<td colspan="2">({$item.subject})</td>
</tr>
<tr>
<th>说明</th>
<td colspan="2">({$item.description|t_truncate:36:"":3})</td>
</tr>
<tr>
<th>公开范围</th>
<td colspan="2">
({if $item.public_flag == "public"})
全体公开
({elseif $item.public_flag == "friend"})
对({$WORD_MY_FRIEND})公开
({elseif $item.public_flag == "private"})
不公开
({/if})
</td>
</tr>
<tr>
<th>留言</th>
<td colspan="2">	<a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})&amp;comment_count=({$item.num_comment})">
	留言(({$item.num_comment}))
	</a></td>
</tr>
<tr>
<th>发表日期</th>
<td>({$item.r_datetime|date_format:"%m月%d日 %H:%M"})</td>
<td class="operation"><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="浏览详细" /></a></td>
</tr>
</table>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutB -->
