({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})
({capture name=page_name_temp})({$item_str})每月页面访问量统计({/capture})
({assign var="page_name" value=$smarty.capture.page_name_temp})
({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2>({$item_str})每月页面访问量统计</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<h3 class="item">会员访问数（ＰＣ＋手机版7天以内的登录会员数）：({$active_num}) 人</h3>

<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_diary')})&ktai_flag=({if $item_str=='PC版'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">本月获得最多访问量的({$WORD_DIARY})显示</a>
</li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_member')})&ktai_flag=({if $item_str=='PC版'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">本月获得最多访问量的用户显示</a>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_commu')})&ktai_flag=({if $item_str=='PC版'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">本会月获得最多访问量的({$WORD_COMMUNITY})显示</a>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&ktai_flag=({if $item_str=='PC版'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">本月获得最多访问量的帖子显示</a>
</ul>

<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&ktai_flag=({if $item_str=='PC版'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">本月获得最多访问量的用户显示</a></li>
</ul>

<h3 class="item">按月次被访问用户数</h3>

<table class="basicType2">
<tbody>
({foreach from=$access_analysis_month item=item})
<tr>
<th>
({$item.ym|date_format:"%Y年%m月"})
</th>
<td>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_page')})&ymd=({$item.ym})&month_flag=1&ktai_flag=({$ktai_flag})">
({$item.count})
</a>
</td>
<td>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_day')})&ymd=({$item.ym})&ktai_flag=({$ktai_flag})">按日合计</a>
</td>
</tr>
({/foreach})
</tbody>
</table>

({$inc_footer|smarty:nodefaults})