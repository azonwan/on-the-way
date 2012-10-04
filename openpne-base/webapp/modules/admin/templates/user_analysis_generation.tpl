({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})
({assign var="page_name" value="注册用户年龄分布显示"})
({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2>各年龄段注册用户分布</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p>显示网站内用户的年龄分布状况</p>
<table class="basicType2">
({****})
<thead>
<tr>
<th>
年龄
</th>
<th>
人数
</th>
</tr>
</thead>
({****})
<tbody>
({****})
({foreach from=$analysis_generation key=key item=item})
<tr>
	<th>({$key})</th>
	<td>({$item})人</td>
</tr>
({/foreach})
</tbody>
<tfoot>
<tr>
	<th width="100">合计</th>
	<td>({$analysis_generation_sum})人</td>
</tr>
</tfoot>
</table>

({$inc_footer|smarty:nodefaults})
