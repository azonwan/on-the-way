<div id="LayoutC">
<div id="Center">

({capture name="keyword_url"})({$keyword|escape:url|smarty:nodefaults})({/capture})

({* {{{ searchFormBox *})
<div class="dparts searchFormBox"><div class="parts">
<div class="partsHeading"><h3>团队检索</h3></div>
<div class="item">

({t_form_block _method=get m=biz a=page_h_biz_group_find_all})
<p class="form">
<label for="keyword">关键字</label><input type="text" class="input_text" name="keyword" id="keyword" size="15" value="({$keyword})" />
<input type="submit" class="input_submit" value="　检 索　" />
<a href="({t_url m=pc a=page_h_diary_list_all})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">({$WORD_DIARY})检索</a>
 | <a href="({t_url m=pc a=page_h_com_find_all})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">({$WORD_COMMUNITY})检索</a>
({if $smarty.const.USE_EXTRA_SERVICE})
 | <a href="http://www.google.com/search?hl=ja&amp;lr=lang_ja&amp;q=({$smarty.capture.keyword_url|smarty:nodefaults})" target="_blank">WEB検索</a>
({/if})
</p>
({/t_form_block})

<ul class="moreInfo">
<li><a href="({t_url m=biz a=page_h_biz_group_add})">创建团队</a> (创建前，请确认下是否有相同类型的团队)</li>
</ul>

</div>
</div></div>
({* }}} *})

({if $total_num})

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>检索一览</h3><p>*** ({$total_num})条检索结果符合要求</p></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=biz a=page_h_biz_group_find_all})&amp;page=({$page-1})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">前一页</a></p>({/if})
<p class="number">({$start_num})条～({$end_num})条 记录</p>
({if $is_next})<p class="next"><a href="({t_url m=biz a=page_h_biz_group_find_all})&amp;page=({$page+1})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<div class="block">
({foreach from=$c_commu_search_list item=c_commu_search})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$c_commu_search.biz_group_id})"><img src="({t_img_url filename=$c_commu_search.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>团体名称</th><td>({$c_commu_search.name})</td>
</tr><tr>
<th>参加人数</th><td>({$c_commu_search.count})人</td>
</tr><tr>
<th>团队简介</th><td>({$c_commu_search.info})</td>
</tr><tr class="operation">
<th></th><td><span class="moreInfo"><a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$c_commu_search.biz_group_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>

({$smarty.capture.pager|smarty:nodefaults})
</div></div>
({* }}} *})

({else})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>检索一览</h3></div>
<div class="block">
<p>没有符合条件的团队记录</p>
</div>
</div></div>
({* }}} *})

({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
