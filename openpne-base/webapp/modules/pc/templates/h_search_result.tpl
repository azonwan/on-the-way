<div id="LayoutC">
<div id="Center">

({if $pager.total_num})

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>检索结果一览</h3><p>*** ({$pager.total_num})向后显示</p></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $pager.page_prev})<p class="prev"><a href="({t_url m=pc a=page_h_search_result})&amp;page=({$pager.page_prev})&amp;({$search_condition})">上一页</a></p>({/if})
<p class="number">({$pager.disp_start})条～({$pager.disp_end})条 记录</p>
({if $pager.page_next})<p class="next"><a href="({t_url m=pc a=page_h_search_result})&amp;page=({$pager.page_next})&amp;({$search_condition})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<div class="block">
({foreach from=$target_friend_list item=item})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="3"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td>({$item.nickname})</td>
</tr><tr>
<th>自我介绍</th><td>({$item.profile.self_intro.value|t_truncate:36:"":3})</td>
</tr><tr class="operation">
<th>最终登录</th><td><span class="text">({if $item.last_login=='5分以内' || $item.last_login=='3分以内'})<img src="({t_img_url_skin filename=ico_online})" alt="online" />({else})({$item.last_login})({/if})</span> <span class="moreInfo"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="查看详细" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})

({else})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>成员检索</h3></div>
<div class="block">
<p>没有符合条件的成员。</p>
</div>
</div></div>
({* }}} *})

({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
