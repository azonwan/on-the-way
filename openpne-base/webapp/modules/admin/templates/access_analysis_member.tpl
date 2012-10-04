({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})

({capture name=page_name_temp})
({$item_str}) ({if $month_flag})({$ymd|date_format:"%Y年%m月"})({else})({$ymd|date_format:"%Y年%m月%d日"})({/if})访问过的成员
({/capture})
({assign var="page_name" value=$smarty.capture.page_name_temp})
({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})


<h2>({$item_str})&nbsp;({if $month_flag})({$ymd|date_format:"%Y年%m月"})({else})({$ymd|date_format:"%Y年%m月%d日"})({/if})访问过的成员</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p>[({$page_name})]</p>

({if $access_member})

({if $is_prev})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&amp;ktai_flag=({$ktai_flag})&amp;ymd=({$ymd})&amp;month_flag=({$month_flag})&amp;page_name=({$requests.page_name})&amp;orderby=({$orderby})&amp;page=({$page-1})">＜上一页</a>
({/if})
&nbsp;&nbsp;显示({$start_num})件～({$end_num})件&nbsp;&nbsp;
({if $is_next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&amp;ktai_flag=({$ktai_flag})&amp;ymd=({$ymd})&amp;month_flag=({$month_flag})&amp;page_name=({$requests.page_name})&amp;orderby=({$orderby})&amp;page=({$page+1})">下一页＞</a>({/if})
<br />
<table cellspacing="0" cellpadding="5" class="basicType2">
<tr>
<th><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&amp;ktai_flag=({$ktai_flag})&amp;ymd=({$ymd})&amp;month_flag=({$month_flag})&amp;page_name=({$requests.page_name})&amp;orderby1=({$orderby1})">ID</a></th>
<th>({$WORD_NICKNAME})</th>
<th><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&amp;ktai_flag=({$ktai_flag})&amp;ymd=({$ymd})&amp;month_flag=({$month_flag})&amp;page_name=({$requests.page_name})&amp;orderby2=({$orderby2})">访问数</a></th>
</tr>

({foreach from=$access_member item=item})
<tr>
<td>({$item.c_member_id})</td>
({if $item.is_c_member_exists})
<td>({$item.nickname})</td>
({else})
<td>(已经退会的成员)</td>
({/if})
<td>({$item.count})</td>
</tr>

({/foreach})

<tr>
<td colspan="2">合计</td>
<td>({$sum})</td>
</tr>

</table>
({else})
<p>被访问的成员不存在</p>
({/if})

({$inc_footer|smarty:nodefaults})
