({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})

({if $item_str == "PC版"})
({assign var="parent_page_name" value="PC页面按月集计"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&amp;ktai_flag=0({/capture})
({else})
({assign var="parent_page_name" value="手机页面按月集计"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&amp;ktai_flag=1({/capture})
({/if})

({capture name=page_name_temp})({$item_str}) 显示各帖子被访问数 ({if $month_flag})({$ymd|date_format:"%Y年%m月分"})({else})({$ymd|date_format:"%Y年%m月%d日分"})({/if})({/capture})
({assign var="page_name" value=$smarty.capture.page_name_temp})

({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2>({$item_str}) 显示各帖子被访问数 ({if $month_flag})({$ymd|date_format:"%Y年%m月分"})({else})({$ymd|date_format:"%Y年%m月%d日分"})({/if})</h2>
<div class="contents">

<p>[({$page_name})]</p>

({if $target_topic})
({if $is_prev})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&amp;ktai_flag=({$ktai_flag})&amp;ymd=({$ymd})&amp;month_flag=({$month_flag})&amp;page_name=({$requests.page_name})&amp;orderby=({$orderby})&amp;page=({$page-1})">＜上一页</a> 
({/if})
&nbsp;&nbsp;显示({$start_num})条～({$end_num})条&nbsp;&nbsp;
({if $is_next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&amp;ktai_flag=({$ktai_flag})&amp;ymd=({$ymd})&amp;month_flag=({$month_flag})&amp;page_name=({$requests.page_name})&amp;orderby=({$orderby})&amp;page=({$page+1})">下一页＞</a>({/if})
<br />

<table class="basicType2">
	<thead>
		<tr>
		<th><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&amp;ktai_flag=({$ktai_flag})&amp;ymd=({$ymd})&amp;month_flag=({$month_flag})&amp;page_name=({$requests.page_name})&amp;orderby1=({$orderby1})">ID</a></th>
		<th>帖子名</th>
		<th>({$WORD_COMMUNITY})名</th>
		<th><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&amp;ktai_flag=({$ktai_flag})&amp;ymd=({$ymd})&amp;month_flag=({$month_flag})&amp;page_name=({$requests.page_name})&amp;orderby2=({$orderby2})">访问数</a></th>
		</tr>
	</thead>
	<tbody>
({foreach from=$target_topic item=item})
		<tr>
			<th>({$item.target_c_commu_topic_id})</th>
({if $item.is_c_commu_topic_exists})
			<td>({$item.topic_name})</td>
			<td>({$item.commu_name})</td>
({else})
			<td colspan="2">(已删除的帖子)</td>
({/if})
			<td>({$item.count})</td>
		</tr>
({/foreach})
		<tr>
			<td colspan="3">合計</td>
			<td>({$sum})</td>
		</tr>
	</tbody>
</table>
({else})
<p>被访问的帖子不存在</p>
({/if})

({$inc_footer|smarty:nodefaults})
