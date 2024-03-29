<div id="LayoutB">

({if $type == 'h'})
({* {{{ searchFormLine *})
<div class="parts searchFormLine">
({t_form_block _method=get m=pc a=page_fh_diary_list})
<ul>
<li><img src="({t_img_url_skin filename=icon_search})" alt="search" /></li>
<li><input type="text" class="input_text" name="keyword" value="({$keyword})" size="30" /></li>
<li><input type="submit" class="input_submit" value="({$WORD_DIARY})检索" /></li>
</ul>
({/t_form_block})
</div>
({* }}} *})
({/if})

<div id="Left">

({* {{{ sideNav *})
<div class="parts sideNav">
<div class="item calendar">
<div class="partsHeading"><h3>
({if $ym.prev_month})<a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$ym.prev_year})&amp;month=({$ym.prev_month})">＜</a>({/if})
({$date_val.month})月的日历
({if $ym.next_month})<a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$ym.next_year})&amp;month=({$ym.next_month})">＞</a>({/if})
</h3></div>
<table class="calendar">
<tr>
<th class="sun">日</th>
<th class="mon">一</th>
<th class="tue">二</th>
<th class="wed">三</th>
<th class="thu">四</th>
<th class="fri">五</th>
<th class="sat">六</th>
</tr>({foreach from=$calendar item=week})<tr>
({foreach from=$week item=item name="calendar_days"})
<td>({strip})
({if $item.day})
({if $item.is_diary})
<a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$date_val.year})&amp;month=({$date_val.month})&amp;day=({$item.day})">({$item.day})</a>
({else})
({$item.day})
({/if})
({else})
({/if})
({/strip})</td>
({/foreach})
</tr>
({/foreach})
</table>
</div>

<div class="item recentlyComment">
<div class="partsHeading"><h3>最近的留言</h3></div>
<ul class="list">
<li><a href="({t_url m=pc a=page_fh_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})">留言一览</a></li>
</ul>
</div>

({if $date_list})
<div class="item monthlyDiary">
<div class="partsHeading"><h3>各月的({$WORD_DIARY})</h3></div>
<ul class="list">
({foreach from=$date_list item=date})
<li><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$date.year})&amp;month=({$date.month})">({$date.year})年({$date.month})月的一览</a></li>
({/foreach})
</ul>
</div>
({/if})

({if $category_list})
<div class="item listCategory">
<div class="partsHeading"><h3>日记分类</h3></div>
<ul class="list">
({foreach from=$category_list item=category})
<li><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;category_id=({$category.c_diary_category_id})">({$category.category_name})</a></li>
({/foreach})
</ul>
</div>
({/if})
</div>
({* }}} *})

</div><!-- Left -->
<div id="Center">

({if $type == "h"})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>写({$WORD_DIARY})</h3></div>
<div class="block">
({t_form_block _method=get m=pc a=page_h_diary_add})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="写({$WORD_DIARY})" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})
({/if})

({if $target_diary_list})
({* {{{ commentList *})
<div class="dparts commentList"><div class="parts">
<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})({/if})的({$WORD_DIARY})({if !$all})({if !$category}) ({$date_val.year})年({$date_val.month})月({if $date_val.day})({$date_val.day})日({/if})({/if})({$category_name})({/if})</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page-1})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if $category_id})&amp;category_id=({$category_id})({elseif !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">上一页</a></p>({/if})
<p class="number">
共({$total_num})条 ({$page*$page_size-$page_size+1})条～

({if $page_size > $diary_list_count})
({$diary_list_count+$page*$page_size-$page_size})
({else})
({$page*$page_size})
({/if})
条 记录
</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page+1})({if $url_keyword})&amp;keyword=({$url_keyword})({/if})({if $category_id})&amp;category_id=({$category_id})({elseif !$all})({if $date_val.year})&amp;year=({$date_val.year})({/if})({if $date_val.month})&amp;month=({$date_val.month})({/if})({if $date_val.day})&amp;day=({$date_val.day})({/if})({/if})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$target_diary_list item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%m月%d日<br />%H:%M"})</dt>
<dd>
<div class="title">
<p class="heading">({$item.subject})</p>
<p class="public">
({if $item.public_flag == "public"})
（对全体公开）
({elseif $item.public_flag == "friend"})
（对({$WORD_MY_FRIEND})公开）
({elseif $item.public_flag == "private"})
（不公开）
({/if})
</p>
</div>
<div class="body">
({if $item.image_filename_1||$item.image_filename_2||$item.image_filename_3})
<ul class="photo">
({if $item.image_filename_1})<li><a href="({t_img_url filename=$item.image_filename_1})" target="_blank"><img src="({t_img_url filename=$item.image_filename_1 w=120 h=120})" alt="" /></a></li>({/if})
({if $item.image_filename_2})<li><a href="({t_img_url filename=$item.image_filename_2})" target="_blank"><img src="({t_img_url filename=$item.image_filename_2 w=120 h=120})" alt="" /></a></li>({/if})
({if $item.image_filename_3})<li><a href="({t_img_url filename=$item.image_filename_3})" target="_blank"><img src="({t_img_url filename=$item.image_filename_3 w=120 h=120})" alt="" /></a></li>({/if})
</ul>
({/if})
<p class="text">({$item.body|t_decoration:1|t_truncate:48:"":3})</p>
</div>
<div class="footer">
<p><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.num_comment})">留言(({$item.num_comment}))</a>
 | <a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})">详细内容</a>
({if $type == "h"})
 | <a href="({t_url m=pc a=page_h_diary_edit})&amp;target_c_diary_id=({$item.c_diary_id})&amp;target_c_member_id=({$target_member.c_member_id})">编辑</a>
({/if})
</p>
</div>
</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({/if})

({if $c_rss_cache_list})
({* {{{ recentList *})
<div class="dparts recentList" id="blog"><div class="parts">
<div class="partsHeading"><h3>({strip})
({if !$all})
({$target_member.nickname})({if $type == "f"})({/if})({$date_val.year})年({$date_val.month})月({if $date_val.day})({$date_val.day})日({/if})的博客
({else})
({$target_member.nickname})({if $type == "f"})({/if})的博客
({/if})
({/strip})</h3></div>
({foreach from=$c_rss_cache_list item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%m月%d日 %H:%M"})</dt>
<dd><a href="({$item.link})" target="_blank">({$item.subject})</a></dd>
</dl>
({/foreach})
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutB -->
