<div class="subNavi">
({strip})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})">上传图像列表</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_image')})">图像上传、删除</a>&nbsp;|&nbsp;
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_file')})">上传文件列表</a>&nbsp;|&nbsp;
({/if})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_list')})">日记管理</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_comment_list')})">日记留言管理</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('commu_list')})">圈子管理</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('topic_list')})">帖子・活动管理</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('topic_comment_list')})">帖子・活动留言管理</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('review_list')})">点评管理</a>&nbsp;|&nbsp;
({if $smarty.const.OPENPNE_USE_ALBUM})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_list')})">相册管理</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_image_list')})">照片管理</a>&nbsp;|&nbsp;
({/if})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('download_xml')})">数据下载</a>&nbsp;|&nbsp;
({/strip})
</div>
