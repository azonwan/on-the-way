({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})

({if $item_str == "PC版"})
({assign var="parent_page_name" value="每月PC页面访问量统计"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=0({/capture})
({else})
({assign var="parent_page_name" value="每月手机页面访问量统计"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=1({/capture})
({/if})

({capture name=page_name_temp})({$item_str}) ({if $month_flag})({$ymd|date_format:"%Y年%m月分"})({else})({$ymd|date_format:"%Y年%m月%d日分"})({/if})　各页面统计({/capture})
({assign var="page_name" value=$smarty.capture.page_name_temp})
({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2>({$item_str}) ({if $month_flag})({$ymd|date_format:"%Y年%m月份"})({else})({$ymd|date_format:"%Y年%m月%d日分"})({/if})　各页面统计</h2>
<div class="contents">

<table class="basicType2">
<thead>
<tr>
<th>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_page')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&orderby1=({$orderby1})">页面</a></th>
<th><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_page')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&orderby2=({$orderby2})">被访问数</a></th>
<th>被访问<br>会员<br>(target_c_member_id)</td>
<th>被访问<br>({$WORD_COMMUNITY})<br>(target_c_commu_id)</td>
<th>被访问<br>帖子<br>(target_c_topic_id)</td>
<th>被访问<br>({$WORD_DIARY})<br>(target_c_diary_id)</td>
<th>访问过的<br>会员<br>(c_member_id)</td>
</tr>
</thead>
<tbody>
({foreach from=$access_analysis_month_page item=item})
<tr>
<th>({$item.page_name})</th>
<td>({$item.count})</td>
({if $item.is_target_c_member_id == 1})
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_member')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$item.page_name})">详细</a></td>
({else})
<td><br></td>
({/if})

({if $item.is_target_c_commu_id == 1})
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_commu')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$item.page_name})">详细</a></td>
({else})
<td><br></td>
({/if})

({if $item.is_target_c_topic_id == 1})
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$item.page_name})">详细</a></td>
({else})
<td><br></td>
({/if})

({if $item.is_target_c_diary_id == 1})
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_diary')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$item.page_name})">详细</a></td>
({else})
<td><br></td>
({/if})

({if $item.is_c_member_id == 1})
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$item.page_name})">详细</a></td>
</tr>
({else})
<td><br></td>
({/if})
({/foreach})

<tr>
<th>合计</th>
<td>({$sum})</td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_member')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=all">详细</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_commu')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=all">详细</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=all">详细</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_diary')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=all">详细</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=all">详细</a></td>
</tr>
</tbody>
</table>

({$inc_footer|smarty:nodefaults})
