({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})

({if $item_str == "PC版"})
({assign var="parent_page_name" value="PC页面按月统计"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=0({/capture})
({else})
({assign var="parent_page_name" value="手机页面按月统计"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=1({/capture})
({/if})


({capture name=page_name_temp})({$item_str}) 日次页面浏览统计({/capture})
({assign var="page_name" value=$smarty.capture.page_name_temp})
({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2>({$item_str}) 日次页面浏览统计</h2>
<div class="contents">
({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})


<table class="basicType2">
<tbody>
({foreach from=$access_analysis_day item=item})
<tr>
<th>
({$item.ymd|date_format:"%d日"})
</th>
<td>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_page')})&ymd=({$item.ymd})&month_flag=0&ktai_flag=({$ktai_flag})">({$item.count})</a>
</td>
</tr>
({/foreach})
</tbody>
</table>
({$inc_footer|smarty:nodefaults})
