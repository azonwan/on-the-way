<div class="subNavi">
({strip})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_generation')})">各年龄段用户一览显示</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_date_month')})">注册用户一览显示（按月统计）</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_date_day')})">注册用户一览显示（按日统计）</a>&nbsp;|&nbsp;
({foreach from=$profile_list item=item})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_profile')})&target_c_profile_id=({$item.c_profile_id})">({$item.caption})各用户ー显示</a>&nbsp;|&nbsp;
({/foreach})
({if $smarty.const.LOG_C_ACCESS_LOG})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=0">PC页面访问按月统计</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=1">手机页面访问按月统计</a>&nbsp;|&nbsp;
({/if})
({/strip})
</div>
