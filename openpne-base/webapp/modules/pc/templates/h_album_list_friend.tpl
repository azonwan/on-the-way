<div id="LayoutC">
<div id="Center">

({if $total_num})
({* {{{ recentList *})
<div class="dparts recentList"><div class="parts">
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})最新相册</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_album_list_friend})&amp;page=({$page-1})">上一页</a></p>({/if})
<p class="number">({$pager.start})条～({$pager.end})条 记录</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_album_list_friend})&amp;page=({$page+1})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$h_album_list_friend item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</dt>
<dd><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject})</a> (({$item.c_member.nickname}))({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" alt="" />({/if})</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})
</div></div>
({* }}} *})

({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})最新相册</h3></div>
<div class="block">
<p>({$WORD_MY_FRIEND})没有相册。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
