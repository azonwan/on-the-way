({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})
({assign var="page_name" value="显示注册的用户数（按日统计）"})
({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2>显示注册的用户数（按日统计）</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<h3 class="item">({$date})</h3>
<table class="basicType2">
<thead>
({****})
<tr>
<th>
日
</th>
<th>
人数
</th>
</tr>
({****})
</thead>
<tbody>
({****})
({foreach from=$analysis_date_day key=key item=item})
<tr>
	<th>({$key})</th>
	<td>({$item})人</td>
</tr>
({/foreach})
({****})
</tbody>
<tfoot>
({****})
<tr>
	<th width="100">合计</th>
	<td>({$analysis_date_day_sum})人</td>
</tr>
({****})
</tfoot>
</table>

({$inc_footer|smarty:nodefaults})
