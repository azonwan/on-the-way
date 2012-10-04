({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})
({assign var="page_name" value="显示注册用户数（按月统计）"})
({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2>注册的用户数（按月统计）</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

({$date})
<table class="basicType2">
<thead>
({****})
<tr>
<th>
月
</th>
<th>
人数
</th>
</tr>
({****})
</thead>
<tbody>
({****})
({foreach from=$analysis_date_month key=key item=item})
<tr>
	({if $key == "合计"})
	<th>({$key})</th>	
	({else})
	<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_date_day')})&date=({$key})">({$key})</a></td>	
	({/if})
	<td>({$item})人</td>
</tr>
({/foreach})
({****})
</tbody>
<tfoot>
({****})
<tr>
	<th>合计</th>
	<td>({$analysis_date_month_sum})人</td>
</tr>
({****})
</tfoot>
</table>

({$inc_footer|smarty:nodefaults})
