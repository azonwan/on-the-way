<div id="LayoutC">
({ext_include file="inc_c_com_topic_find.tpl"})

<div id="Center">

({if $is_warning})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>イベント</h3></div>
<div class="block">
<p>此({$WORD_COMMUNITY})为非公开圈子，不参加({$WORD_COMMUNITY})无法浏览圈子活动。</p>
</div>
</div></div>
({* }}} *})

({else})

({if ($c_commu.topic_authority == 'public' && $is_c_commu_member) || ($c_commu.topic_authority == 'admin_only' && $is_c_commu_admin)})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>发表活动</h3></div>
<div class="block">
({t_form_block m=pc a=page_c_topic_add})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<ul class="check">
<li><input type="radio" class="input_radio" name="event_flag" id="event_flag_0" value="0" /><label for="event_flag_0">发表帖子</label></li>
<li><input type="radio" class="input_radio" name="event_flag" id="event_flag_1" value="1" checked="checked" /><label for="event_flag_1">发起活动</label></li>
<li><input type="submit" class="input_submit" value="发 表" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})
({/if})

({if $c_topic_list })
({* {{{ commentList *})
<div class="dparts commentList"><div class="parts">
<div class="partsHeading"><h3>活动一览</h3></div>
<div class="pagerRelativeMulti">
<p>按最近发表的活动的留言更新时间显示。</p>
<p><a href="({t_url m=pc a=page_c_topic_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})">帖子一览请浏览这里</a></p>
<div class="pager">
({strip})
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page-1})">上一页</a></p>({/if})
<p class="number">({$start_num})条～({$end_num})条 记录</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page+1})">下一页</a></p>({/if})
({/strip})
</div>
</div>
({foreach from=$c_topic_list item=item})
<dl>
<dt>({$item.u_datetime|date_format:"%m月%d日<br />%H:%M"})</dt>
<dd>
<div class="title">
<p class="heading"><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})">({$item.name})</a></p>
</div>
<div class="body">
({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})
<ul class="photo">
({if $item.image_filename1})<li><a href="({t_img_url filename=$item.image_filename1})" target="_blank"><img src="({t_img_url filename=$item.image_filename1 w=120 h=120})" alt="" /></a></li>({/if})
({if $item.image_filename2})<li><a href="({t_img_url filename=$item.image_filename2})" target="_blank"><img src="({t_img_url filename=$item.image_filename2 w=120 h=120})" alt="" /></a></li>({/if})
({if $item.image_filename3})<li><a href="({t_img_url filename=$item.image_filename3})" target="_blank"><img src="({t_img_url filename=$item.image_filename3 w=120 h=120})" alt="" /></a></li>({/if})
</ul>
({/if})
<p class="text">({$item.body|t_truncate:48:"":3})</p>
</div>
<div class="footer">
<p>
({if $item.is_c_topic_admin || $is_c_commu_admin})
({if ($c_commu.topic_authority == 'public')||($c_commu.topic_authority == 'admin_only' && $is_c_commu_admin)})
<a href="({t_url m=pc a=page_c_topic_edit})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})">编辑</a> |
({/if})
({/if})
<a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})">更多(({$item.write_num}))</a>
</p>
</div>
</dd>
</dl>
({/foreach})
<div class="pagerRelative">
({strip})
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page-1})">上一页</a></p>({/if})
<p class="number">({$start_num})条～({$end_num})条 记录</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page+1})">下一页</a></p>({/if})
({/strip})
</div>
</div></div>
({* }}} *})
({/if})

({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
