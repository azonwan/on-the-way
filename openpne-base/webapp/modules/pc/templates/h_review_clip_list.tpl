<div id="LayoutC">
<div id="Center">

({* {{{ infoButtonBox  *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>发表点评</h3></div>
<div class="block">
({t_form_block _method=get m=pc a=page_h_review_add})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="  发表点评  " /></li>
</ul>
({/t_form_block})
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_review_search})">全部点评一览</a></li>
<li><a href="({t_url m=pc a=page_fh_review_list_member})">自己点评一览</a></li>
</ul>
</div>
</div></div>
({* }}} *})

({if $c_review_clip_list})
({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>剪辑的点评一览</h3></div>
({t_form_block m=pc a=do_h_review_clip_list_delete_c_review_clip})

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_review_clip_list})&amp;page=({$page-1})">上一页</a></p>({/if})
<p class="number">({$start_num})条～({$end_num})条 记录</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_review_clip_list})&amp;page=({$page+1})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$c_review_clip_list item=review})
<dl>
<dt>
<a href="({$review.url})" target="_blank"><img src="({if $review.image_medium})({$review.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" /></a>
<span><a href="({$review.url})" target="_blank">浏览详细</a></span>
<input type="checkbox" class="input_checkbox" name="c_review_clips[]" value="({$review.c_review_id})" />
</dt>
<dd>
<table><tr class="title">
<th>标  题</th>
<td>({$review.title})</td>
</tr><tr>
<th>追加时间</th>
<td>({$review.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</td>
</tr><tr>
<th>分  类</th>
<td>({$review.category_disp})</td>
</tr><tr>
<td colspan="2"><p class="operation"><a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$review.c_review_id})">浏览全部点评 (({$review.write_num|default:"0"}))</a></p></td>
</tr></table>
</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　删　　除　" /></li>
</ul>
</div>

({/t_form_block})
</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>剪辑点评一览</h3></div>
<div class="block">
<p>没有剪辑的点评。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
