<div class="subNavi">
({strip})
({if $auth_type == 'all'})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})">成员列表</a>&nbsp;|&nbsp;
({/if})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_invites')})">邀请函送信</a>&nbsp;|&nbsp;
({if $auth_type == 'all'})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('csv_download')})">CSV下载</a>&nbsp;|&nbsp;
({/if})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('import_c_member')})">CSV入口</a>&nbsp;|&nbsp;
({if $auth_type == 'all'})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist')})">黑名单管理</a>&nbsp;|&nbsp;
({/if})
({/strip})
</div>
