<div class="subNavi">
({strip})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config')})">SNS网站信息设定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config_word')})">网站各功能名称设定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})">用户个人资料项目增减设定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_category')})">圈子分类设定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('manage_c_commu')})">初始圈子设定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_holiday')})">节日设定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail_send')})">发送邮件频率设定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})">邮件文字内容设定</a>&nbsp;|&nbsp;
({if $smarty.const.OPENPNE_USE_POINT_RANK})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})">积分、等级变更设定</a>&nbsp;|&nbsp;
({/if})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('limit_domain')})">邀请邮件域名限定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})">CMD设定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd_caster')})">CMD管理者设定</a>&nbsp;|&nbsp;
({if $smarty.const.OPENPNE_USE_API})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})">API设定</a>&nbsp;|&nbsp;
({/if})
({if $smarty.const.OPENPNE_USE_DECORATION})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_deco')})">文字装饰设定</a>&nbsp;|&nbsp;
({/if})
({if $smarty.const.OPENPNE_USE_ALBUM})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_limit')})">用户相册容量限制设定</a>&nbsp;|&nbsp;
({/if})
({/strip})
</div>
