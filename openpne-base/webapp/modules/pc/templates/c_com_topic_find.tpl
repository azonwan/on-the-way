<div id="LayoutC">
<div id="Center">

({capture name="keyword_url"})({$keyword|escape:url|smarty:nodefaults})({/capture})

({* {{{ searchFormBox *})
<div class="dparts searchFormBox"><div class="parts">
<div class="partsHeading"><h3>({if $c_commu_id})[({$c_commu.name})] ({/if})帖子检索</h3></div>
<div class="item">

({t_form_block _method=get m=pc a=page_c_com_topic_find})
<p class="form">
<label for="keyword">关键词</label>
<input type="text" class="text" name="keyword" id="keyword" size="15" value="({$keyword})" />
({if $c_commu_id})
<select name="target_commu">
<option value="in_commu">({$WORD_COMMUNITY})内部</option>
<option value="all">全部({$WORD_COMMUNITY})</option>
</select>
<input type="hidden" name="c_commu_id" value="({$c_commu_id})" />
({/if})
<input type="submit" class="input_submit" value="　检 索　" />
</p>

<p class="form">
<span class="label">分  类</span>
 <a href="({t_url m=pc a=page_c_com_topic_find})&amp;target_commu=in_commu&amp;c_commu_id=({$c_commu_id})&amp;type=all&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})"全部</a>
 | <a href="({t_url m=pc a=page_c_com_topic_find})&amp;target_commu=in_commu&amp;c_commu_id=({$c_commu_id})&amp;type=topic&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">帖子</a>
 | <a href="({t_url m=pc a=page_c_com_topic_find})&amp;target_commu=in_commu&amp;c_commu_id=({$c_commu_id})&amp;type=event&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">活动</a>
</p>
({/t_form_block})

</div>
</div></div>
({* }}} *})

({if $total_num})
({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>帖子一览</h3><p>*** ({$total_num|default:'0'})件符合条件。</p></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_c_com_topic_find})&amp;target_commu=in_commu&amp;c_commu_id=({$c_commu_id})&amp;page=({$page-1})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;type=({$search_val_list.type})">上一页</a></p>({/if})
<p class="number">({$start_num})条～({$end_num})条 记录</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_c_com_topic_find})&amp;target_commu=in_commu&amp;c_commu_id=({$c_commu_id})&amp;page=({$page+1})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;type=({$search_val_list.type})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<div class="block">
({foreach from=$c_commu_topic_search_list item=item})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})"><img src="({t_img_url filename=$item.commu_image w=76 h=76 noimg=no_logo_small})" alt="" /></a></td>
<th>标  题</th><td>({$item.name}) (({$item.max_number}))</td>
</tr><tr>
<th>内  容</th><td>({$item.body|t_truncate:36:"":3})</td>
</tr><tr>
<th>圈子名</th><td>({$item.commu_name})</td>
</tr><tr class="operation">
<th>发表时间</th><td><span class="text">({$item.max_datetime|date_format:"%m月%d日 %H:%M"})</span> <span class="moreInfo"><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="详细" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
