<div id="LayoutC">
<div id="Center">

({if $total_num})
({* {{{ recentList *})
<div class="dparts recentList"><div class="parts">
<div class="partsHeading"><h3>({$WORD_DIARY})历史留言记录</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_diary_comment_list})&amp;page=({$page-1})">上一页</a></p>({/if})
<p class="number">({$pager.start})条～({$pager.end})条 记录</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_diary_comment_list})&amp;page=({$page+1})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$h_diary_comment_list item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</dt>
<dd><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;comment_count=({$item.num_comment})">({$item.subject}) (({$item.num_comment}))</a> (({$item.nickname}))</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})

({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$WORD_DIARY})历史留言记录</h3></div>
<div class="block">
<p>({$WORD_DIARY})目前还没有评论。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
