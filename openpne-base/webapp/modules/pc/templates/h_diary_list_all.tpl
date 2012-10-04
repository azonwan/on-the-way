<div id="LayoutC">
<div id="Center">

({* {{{ searchFormBox *})
<div class="dparts searchFormBox"><div class="parts">
<div class="partsHeading"><h3>({$WORD_DIARY})检索</h3></div>
<div class="item">

({t_form_block _method=get m=pc a=page_h_diary_list_all})
<input type="hidden" name="m" value="pc" />
<input type="hidden" name="a" value="page_h_diary_list_all" />
<p class="form">
<label for="keyword">关键字</label> <input type="text" class="input_text" name="keyword" id="keyword" size="15" value="({$keyword})" />
<input type="submit" class="input_submit" value=" 检索 " />
<a href="({t_url m=pc a=page_h_com_find_all})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})">({$WORD_COMMUNITY})检索</a>
({if $smarty.const.USE_EXTRA_SERVICE})
|
<a href="http://www.google.cn/search?hl=ja&amp;q=({$keyword|escape:url|smarty:nodefaults})" target="_blank">web检索</a>
({/if})
</p>
<p class="note">※可根据标题及内容进行检索。用空格区分关键字可进行复数检索。</p>
({/t_form_block})

</div>
</div></div>
({* }}} *})

({if $c_diary_search_list_count})
({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
({if $keyword})
<div class="partsHeading"><h3>({$WORD_DIARY})检索结果一览</h3><p>*** ({$c_diary_search_list_count})条符合条件。</p></div>
({else})
<div class="partsHeading"><h3>最新({$WORD_DIARY})一览</h3></div>
({/if})

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_diary_list_all})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;page=({$page-1})">上一页</a></p>({/if})
<p class="number">({$pager.start})条～({$pager.end})条 记录
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_diary_list_all})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;page=({$page+1})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<div class="block">
({foreach from=$new_diary_list item=diary})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$diary.c_diary_id})"><img src="({t_img_url filename=$diary.c_member.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td>({$diary.c_member.nickname})({if $diary.c_member.profile.sex.value}) (({$diary.c_member.profile.sex.value}))({/if})</td>
</tr><tr>
<th>标题</th><td>({$diary.subject}) (({$diary.num_comment}))({if $diary.image_filename_1 || $diary.image_filename_2 || $diary.image_filename_3}) <img src="({t_img_url_skin filename=icon_camera})" alt="" />({/if})</td>
</tr><tr>
<th>内容</th><td>({$diary.body|t_decoration:1|t_truncate:36:"":3})</td>
</tr><tr class="operation">
<th>创建日期</th><td><span class="text">({$diary.r_datetime|date_format:"%m月%d日 %H:%M"})</span> <span class="moreInfo"><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$diary.c_diary_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="查看详细" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({/if})

({if $c_rss_cache_list})
({* {{{ recentList *})
<div class="dparts recentList"><div class="parts">
<div class="partsHeading"><h3>最新博客一览</h3></div>
({foreach from=$c_rss_cache_list item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</dt>
<dd><a href="({$item.link})" target="_blank">({$item.subject})</a> (({$item.c_member.nickname}))</dd>
</dl>
({/foreach})
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
