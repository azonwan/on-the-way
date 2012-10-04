<div id="LayoutB">

<div id="Left">

({* {{{ sideNav *})
<div class="parts sideNav">
<div class="item calendar">
<div class="partsHeading"><h3>
({if $ym.prev_month})<a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$ym.prev_year})&amp;month=({$ym.prev_month})">＜</a>({/if})
({$date_val.month})月日历
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

<div class="item recentlyDiary">
<div class="partsHeading"><h3>最近的({$WORD_DIARY})</h3></div>
<ul class="list">
({foreach from=$new_diary_list item=item})
<li><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})">({$item.subject})</a></li>
({/foreach})
</ul>
</div>

<div class="item recentlyComment">
<div class="partsHeading"><h3>最近的留言</h3></div>
<ul class="list">
<li><a href="({t_url m=pc a=page_fh_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})">留言一览</a></li>
</ul>
</div>

({if $date_list})
<div class="item monthlyDiary">
<div class="partsHeading"><h3>各月({$WORD_DIARY})</h3></div>
<ul class="list">
({foreach from=$date_list item=item})
<li><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$item.year})&amp;month=({$item.month})">({$item.year})年({$item.month})月一览</a></li>
({/foreach})
</ul>
</div>
({/if})

({if $category})
<div class="item listCategory">
<div class="partsHeading"><h3>日记分类</h3></div>
<ul class="list">
({foreach from=$category item=category_item})
<li><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;category_id=({$category_item.c_diary_category_id})">({$category_item.category_name})</a></li>
({/foreach})
</ul>
</div>
({/if})
</div>
({* }}} *})

</div><!-- Left -->
<div id="Center">

({* {{{ diaryDetailBox *})
<div class="dparts diaryDetailBox"><div class="parts">
<div class="partsHeading"><h3>({$target_member.nickname})({if $type == "f"})({/if})的({$WORD_DIARY})</h3>
<p class="public">
({if $target_diary.public_flag == "public"})（对全体公开）
({elseif $target_diary.public_flag == "friend"})（对({$WORD_MY_FRIEND})公开）
({elseif $target_diary.public_flag == "private"})（不公开）({/if})
</p></div>
({if $c_diary_id_prev || $c_diary_id_next})
<div class="block prevNextLinkLine">
({if $c_diary_id_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_prev})">«上一篇({$WORD_DIARY})</a></p>({/if})
({if $c_diary_id_next})<p class="next"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_next})">下一篇({$WORD_DIARY})»</a></p>({/if})
</div>
({/if})
<dl>
<dt>({$target_diary.r_datetime|date_format:"%Y年<br />%m月%d日<br />%H:%M"})</dt>
<dd>
<div class="title">
<p class="heading">({$target_diary.subject})</p>
</div>
<div class="body">
({if $target_diary.image_filename_1 || $target_diary.image_filename_2 || $target_diary.image_filename_3})
<ul class="photo">
({if $target_diary.image_filename_1})<li><a href="({t_img_url filename=$target_diary.image_filename_1})" target="_blank"><img src="({t_img_url filename=$target_diary.image_filename_1 w=120 h=120})" alt="" /></a></li>({/if})
({if $target_diary.image_filename_2})<li><a href="({t_img_url filename=$target_diary.image_filename_2})" target="_blank"><img src="({t_img_url filename=$target_diary.image_filename_2 w=120 h=120})" alt="" /></a></li>({/if})
({if $target_diary.image_filename_3})<li><a href="({t_img_url filename=$target_diary.image_filename_3})" target="_blank"><img src="({t_img_url filename=$target_diary.image_filename_3 w=120 h=120})" alt="" /></a></li>({/if})
</ul>
({/if})
({$target_diary.body|nl2br|t_url2cmd:'diary':$target_diary.c_member_id|t_cmd:'diary'|t_decoration|t_tag2imgtag})
</div>
</dd>
</dl>
({if $category_list})
<div class="block category">
<ul>
({foreach from=$category_list item=category})
<li>({$category.category_name})</li>
({/foreach})
</ul>
</div>
({/if})
({if $type == "h"})
<div class="operation">
({t_form_block _method=get m=pc a=page_h_diary_edit})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})" />
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="编辑" /></li>
</ul>
({/t_form_block})
</div>
({/if})
</div></div>
({* }}} *})

({if $target_diary_comment_list})
({* {{{ commentList *})
<div class="dparts commentList" id="commentList"><div class="parts">
<div class="partsHeading"><h3>留言</h3></div>
({t_form_block m=pc a=page_fh_delete_comment})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})" />

({if $total_num > 20 || $total_page_num > 1})
({strip})
<div class="pagerRelative">

({if $total_num > 20})
({if $requests.page_size == 100})
<p><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})({if $requests.order == 'asc'})&amp;order=asc({/if})#commentList">各显示20条</a></p>
({else})
<p><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})({if $requests.order == 'asc'})&amp;order=asc({/if})&amp;page_size=100#commentList">各显示100条</a></p>
({/if})
({/if})

({if $total_page_num > 1})
({if $requests.order == 'asc'})
<p><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})({if $requests.page_size == 100})&amp;page_size=100({/if})#commentList">查看最新</a></p>
({else})
<p><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})({if $requests.page_size == 100})&amp;page_size=100({/if})&amp;order=asc#commentList">从最初查看</a></p>
({/if})
({/if})

</div>
({/strip})
({/if})

({capture name=pager})({strip})
<div class="pagerRelative">
({if $pager.page_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;page=({$pager.page_prev})({if $requests.page_size == 100})&amp;page_size=100({/if})({if $requests.order == 'asc'})&amp;order=asc({/if})#commentList">上一页</a></p>({/if})
<p class="number">({$pager.start})条～({$pager.end})条 记录</p>
({if $pager.page_next})<p class="next"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;page=({$pager.page_next})({if $requests.page_size == 100})&amp;page_size=100({/if})({if $requests.order == 'asc'})&amp;order=asc({/if})#commentList">下一页</a></p>({/if})
</div>
({/strip})({/capture}) 
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$target_diary_comment_list item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年<br />%m月%d日<br />%H:%M"})({if $type == "h"})<br /><input type="checkbox" class="input_checkbox" name="target_c_diary_comment_id[]" value="({$item.c_diary_comment_id})" />({/if})</dt>
<dd>
<div class="title">
<p class="heading"><strong>({$item.number})</strong>:({if $item.nickname}) <a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a>({/if})({if $type == 'f' && $item.c_member_id == $member.c_member_id}) <a href="({t_url m=pc a=page_fh_delete_comment})&amp;target_c_diary_id=({$target_diary.c_diary_id})&amp;target_c_diary_comment_id=({$item.c_diary_comment_id})">删除</a>({/if})</p>
</div>
<div class="body">
({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})
<ul class="photo">
({if $item.image_filename_1})<li><a href="({t_img_url filename=$item.image_filename_1})" target="_blank"><img src="({t_img_url filename=$item.image_filename_1 w=120 h=120})" alt="" /></a></li>({/if})
({if $item.image_filename_2})<li><a href="({t_img_url filename=$item.image_filename_2})" target="_blank"><img src="({t_img_url filename=$item.image_filename_2 w=120 h=120})" alt="" /></a></li>({/if})
({if $item.image_filename_3})<li><a href="({t_img_url filename=$item.image_filename_3})" target="_blank"><img src="({t_img_url filename=$item.image_filename_3 w=120 h=120})" alt="" /></a></li>({/if})
</ul>
({/if})
<p class="text">({$item.body|nl2br|t_url2cmd:'diary':$item.c_member_id|t_cmd:'diary'})</p>
</div>
</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

({if $type == 'h'})
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　删 除　" /></li>
</ul>
</div>
({/if})
({/t_form_block})
</div></div>
({* }}} *})
({/if})

({if $c_diary_id_prev || $c_diary_id_next})
({* {{{ prevNextLinkLine *})
<div class="parts prevNextLinkLine">
({if $c_diary_id_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_prev})">«上一篇({$WORD_DIARY})</a></p>({/if})
({if $c_diary_id_next})<p class="next"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$c_diary_id_next})">下一篇({$WORD_DIARY})»</a></p>({/if})
</div>
({* }}} *})
({/if})

({if $is_writable_comment})
({* {{{ formTable *})
<div class="dparts formTable" id="commentForm"><div class="parts">
<div class="partsHeading"><h3>发表留言</h3></div>
({t_form_block _enctype=file m=pc a=page_fh_diary_comment_confirm})
<input type="hidden" name="target_c_diary_id" value="({$target_diary.c_diary_id})" />
<table><tr>
<th>本文</th><td><textarea name="body" rows="8" cols="40">({$requests.body})</textarea></td>
</tr><tr>
<th>照片1</th><td><input type="file" class="input_file" name="upfile_1" size="40" /></td>
</tr><tr>
<th>照片2</th><td><input type="file" class="input_file" name="upfile_2" size="40" /></td>
</tr><tr>
<th>照片3</th><td><input type="file" class="input_file" name="upfile_3" size="40" /></td>
</tr></table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="确认" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>留言</h3></div>
<div class="block">
<p>留言达到1000条之后，这篇({$WORD_DIARY})就不能再留言。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutB -->
