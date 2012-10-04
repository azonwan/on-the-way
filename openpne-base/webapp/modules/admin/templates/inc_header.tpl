({assign var="title" value="`$smarty.const.SNS_NAME`管理画面"})
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>({$title})</title>
<meta content="text/css" http-equiv="content-style-type" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<link href="modules/admin/default.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="./js/prototype.js?r7140"></script>
<script type="text/javascript" src="./modules/admin/default.js"></script>
({if $custom_header})
({$custom_header|smarty:nodefaults})
({/if})
<script type="text/javascript" src="./js/pne.js"></script>
</head>
<body id="admin_page_({$CURRENT_ACTION})">

<div class="container">

({*ここから:header*})

<div class="header">
<div class="ttl"><h1><a href="?m=({$module_name})">({$title})</a></h1><span>【<a href="./" target="_blank">网站确认</a>】</span></div>
<div class="naviHelp"></div>
</div>

({*ここまで:header*})

({*ここから:navi*})

({if $display_navi})
<div class="navi">
<div class="naviMain">

({****************})
({****************})

({if $auth_type == 'all' || $auth_type == ''})
<ul class="admin">

<li id="adminSiteMember" onmouseover="menu('adminSiteMember','adminSiteMemberCont')" onmouseout="menu('adminSiteMember','adminSiteMemberCont')"><a class="tab" href="({if $auth_type == 'all'})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})({elseif $auth_type == 'all' || $auth_type == ''})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_invites')})({else})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('csv_download')})({/if})">成员管理</a>
<ul id="adminSiteMemberCont" class="pull">
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})">成员名单</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_invites')})">发送邀请函</a></li>
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('csv_download')})">CSV下载</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('import_c_member')})">CSV上传</a></li>
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist')})">黑名单管理</a></li>
({/if})
</ul>
</li>

({****})

<li id="adminImageKakikomi" onmouseover="menu('adminImageKakikomi','adminImageKakikomiCont')" onmouseout="menu('adminImageKakikomi','adminImageKakikomiCont')">
<a class="tab" href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})">上传*内容管理</a>
<ul id="adminImageKakikomiCont" class="pull">
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})">上传图像名单</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_image')})">图像上传・删除</a></li>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_file')})">上传文件名单</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_list')})">({$WORD_DIARY})管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_comment_list')})">({$WORD_DIARY})留言管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('commu_list')})">({$WORD_COMMUNITY})管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('topic_list')})">帖子・活动管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('topic_comment_list')})">帖子・活动的留言管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('review_list')})">点评管理</a></li>
({if $smarty.const.OPENPNE_USE_ALBUM})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_list')})">相册管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_image_list')})">照片管理</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('download_xml')})">数据下载</a></li>
</ul>
</li>

({****})

<li id="adminStatisticalInformation" onmouseover="menu('adminStatisticalInformation','adminStatisticalInformationCont')" onmouseout="menu('adminStatisticalInformation','adminStatisticalInformationCont')"><a class="tab" href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_generation')})">统计信息</a>
<ul id="adminStatisticalInformationCont" class="pull">
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_generation')})">按成员数显示</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_date_month')})">按成员登录次数显示（月次集计）</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_date_day')})">按成员登录次数显示（日次集计）</a></li>
({foreach from=$profile_list item=item})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_profile')})&amp;target_c_profile_id=({$item.c_profile_id})">({$item.caption})按区别成员数显示</a></li>
({/foreach})
({if $smarty.const.LOG_C_ACCESS_LOG})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&amp;ktai_flag=0">PC版每月总计</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&amp;ktai_flag=1">手机版每月总计</a></li>
({/if})
</ul>
</li>

</ul>
({/if})

({****************})
({****************})

<ul class="design">

<li id="adminDesign" onmouseover="menu('adminDesign','adminDesignCont')" onmouseout="menu('adminDesign','adminDesignCont')"><a class="tab" href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_skin_image')})">设计</a>
<ul id="adminDesignCont" class="pull">
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_skin_image')})">风格管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_sns_config')})">配色・CSS变更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_sns_config_ktai')})">手机版配色变更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_navi')})">导航变更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})">插入HTML</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})">插入模板</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_banner')})">banner设定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})">通知・规则设定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})">自由页面管理</a></li>
</ul>
</li>

</ul>

({****************})
({****************})

<ul class="config">

<li id="adminSNSConfig" onmouseover="menu('adminSNSConfig','adminSNSConfigCont')" onmouseout="menu('adminSNSConfig','adminSNSConfigCont')"><a class="tab" href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config')})">SNS设定</a>
<ul id="adminSNSConfigCont" class="pull">
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config')})">网站基本信息设定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config_word')})">SNS网站内部名称设定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})">会员资料类别设定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_category')})">({$WORD_COMMUNITY})分类设定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('manage_c_commu')})">初始({$WORD_COMMUNITY})设定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_holiday')})">节日设定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail_send')})">邮件送信设定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})">邮件文言变更</a></li>
({if $smarty.const.OPENPNE_USE_POINT_RANK})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})">积分设定</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('limit_domain')})">邀请邮件域名设定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})">CMD设定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd_caster')})">CMD管理者设定</a></li>
({if $smarty.const.OPENPNE_USE_API})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})">API设定</a></li>
({/if})
({if $smarty.const.OPENPNE_USE_DECORATION})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_deco')})">文字装饰设定</a></li>
({/if})
({if $smarty.const.OPENPNE_USE_ALBUM})

<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_limit')})">用户相册容量限制</a></li>

({/if})
</ul>
</li>

</ul>

({****************})
({****************})
<ul class="module">


<li id="adminModule" onmouseover="menu('adminModule','adminModuleCont')" onmouseout="menu('adminModule','adminModuleCont')"><a class="tab" href="#">扩展功能</a>
<ul id="adminModuleCont" class="pull">
({foreach from=$enable_module_list item=item})
<li><a href="?m=({$item.admin_menu.module})&amp;a=({$item.admin_menu.action})">SNS网站创建</a></li>
({/foreach})
({if !$enable_module_list})
<li><a href="#">（无）</a></li>
({/if})
</ul>
</li>

</ul>
({****************})
({****************})


<ul class="adminadmin">

<li id="adminAdminConfig" onmouseover="menu('adminAdminConfig','adminAdminConfigCont')" onmouseout="menu('adminAdminConfig','adminAdminConfigCont')"><a class="tab" href="({if $auth_type == 'all'})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_admin_user')})({else})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_admin_password')})({/if})">管理页面设定</a>
<ul id="adminAdminConfigCont" class="pull">
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_admin_user')})">账号管理</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_admin_password')})">密码变更</a></li>
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_hash_table')})">网页名随即生成</a></li>
({/if})
</ul>
</li>

</ul>

({****************})
({****************})

<p id="logout"><a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('logout','do')})&amp;sessid=({$PHPSESSID})">退出</a></p>

({****************})
({****************})

</div>

({else})
<div>({*naviSubに閉じタグに対応*})
({/if})

({*続く:各ページのnaviSubへ続く*})
