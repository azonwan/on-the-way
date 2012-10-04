<div id="LayoutC">
<div id="Center">

({if $type == "h"})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>发表点评</h3></div>
<div class="block">
({t_form_block _method=get m=pc a=page_h_review_add})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="发表点评" /></li>

</ul>
({/t_form_block})
<ul class="moreInfo">

<li><a href="({t_url m=pc a=page_h_review_search})">浏览全部点评</a></li>
<li><a href="({t_url m=pc a=page_h_review_clip_list})">浏览剪辑</a></li>

</ul>
</div>
</div></div>
({* }}} *})
({/if})

({if $c_review_list})

({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>({$c_member.nickname})的点评一览</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_fh_review_list_member})&amp;target_c_member_id=({$c_member.c_member_id})&amp;page=({$page-1})">上一页</a></p>({/if})

<p class="number">({$start_num})条～({$end_num})条 记录</p>


({if $is_next})<p class="next"><a href="({t_url m=pc a=page_fh_review_list_member})&amp;target_c_member_id=({$c_member.c_member_id})&amp;page=({$page+1})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$c_review_list item=review})
<dl>
<dt>
<a href="({$review.url})" target="_blank"><img src="({if $review.image_medium})({$review.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" /></a>
<span><a href="({$review.url})" target="_blank">查看详细</a></span>
</dt>
<dd>
<table><tr class="title">
<th>标题</th>
<td>({$review.title})</td>
</tr><tr>
<th>说明</th>
<td>
({if $review.release_date})({$review.release_date})<br />({/if})
({if $review.manufacturer})({$review.manufacturer})<br />({/if})
({if $review.author})({$review.author})({/if})
</td>
</tr><tr>
<th>评论</th>
<td>
({$review.body|nl2br})
<p class="operation">

<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$review.c_review_id})">浏览全部点评 (({$review.write_num}))</a>


({if $type == "h"}) | <a href="({t_url m=pc a=page_h_review_add_write})&amp;category_id=({$review.c_review_category_id})&amp;asin=({$review.asin})">编辑</a>({/if})
</p>
</td>
</tr><tr>
<th>创建日期</th>
<td>({$review.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</td>
</tr><tr>
<th>满意度</th>
<td><img src="({t_img_url_skin filename=satisfaction_level_`$review.satisfaction_level`})" alt="" /></td>
</tr><tr>
<th>分类</th>
<td>({$review.category_disp})</td>
</tr>
</table>
</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})

({else})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$c_member.nickname})的点评一览</h3></div>
<div class="block">
<p>目前还没有点评。</p>
</div>
</div></div>
({* }}} *})

({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
