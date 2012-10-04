<div id="LayoutC">
<div id="Center">

({capture name="keyword_url"})({$keyword|escape:url|smarty:nodefaults})({/capture})

({* {{{ searchFormBox *})
<div class="dparts searchFormBox"><div class="parts">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})排序搜索</h3></div>
<div class="item">

({t_form_block _method=get m=pc a=page_h_com_find_all})
<p class="form">
<span class="label">排列顺序</span>
<a href="({t_url m=pc a=page_h_com_find_all})&amp;val_order=count&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;category_id=({$search_val_list.category_id})">成员数</a>
|
<a href="({t_url m=pc a=page_h_com_find_all})&amp;val_order=r_datetime&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;category_id=({$search_val_list.category_id})">创建时间</a>
</p>

<p class="form">
<label for="keyword">关键字</label>
<input type="text" class="input_text" name="keyword" id="keyword" value="({$keyword})" size="15" />
<label for="category_id">分类</label>
<select name="category_id" id="category_id">
<option value="0">无指定</option>
({foreach from=$c_commu_category_list item=parent})
({foreach from=$parent item=item})
<option value="({$item.c_commu_category_id})"({if $item.c_commu_category_id == $search_val_list.category_id}) selected="selected"({/if})>({$item.name})</option>
({/foreach})
({/foreach})
</select>
<input type="submit" class="input_submit" value=" 检 索" />
</p>
({/t_form_block})

<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_com_add})">创建圈子</a>(({$WORD_COMMUNITY})创建之前，请确认是否有类似圈子)</li>
<li><a href="({t_url m=pc a=page_h_com_topic_find_all})">圈子检索</a></li>
</ul>

<div class="block">
<dl class="categories">
<dt><span class="label">分类</span></dt>
<dd>
<table class="category">
({foreach from=$c_commu_category_parent_list item=item_parent})
<tr>
<th>({$item_parent.name})</th>
<td>
({foreach name=cccl from=$c_commu_category_list[$item_parent.c_commu_category_parent_id] item=item_cat})
({if !$smarty.foreach.cccl.first}) - ({/if})
<a href="({t_url m=pc a=page_h_com_find_all})&amp;order=r_datetime&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;category_id=({$item_cat.c_commu_category_id})">({$item_cat.name})(({$item_cat.count_commu_category}))</a>
({/foreach})
</td>
</tr>
({/foreach})
</table>
</dd>
</dl>
</div>

</div>
</div></div>
({* }}} *})

({if $c_commu_search_list})
({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})一览</h3><p>*** ({$total_num|default:'0'})条符合条件。</p></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_com_find_all})&amp;page=({$page-1})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">上一页</a></p>({/if})
<p class="number">({$start_num})条～({$end_num})条 记录</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_com_find_all})&amp;page=({$page+1})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<div class="block">
({foreach from=$c_commu_search_list item=c_commu_search})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu_search.c_commu_id})"><img src="({t_img_url filename=$c_commu_search.image_filename w=76 h=76 noimg=no_logo_small})" alt="" /></a></td>
<th>({$WORD_COMMUNITY})名称</th><td>({$c_commu_search.name})</td>
</tr><tr>
<th>成员人数</th><td>({$c_commu_search.count_commu_member})人</td>
</tr><tr>
<th>说明</th><td>({$c_commu_search.info|t_truncate:36:"":3})</td>
</tr><tr class="operation">
<th>类别</th><td><span class="text">({$c_commu_search.c_commu_category_name})</span> <span class="moreInfo"><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu_search.c_commu_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="查看详细" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
