<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
({$INC_HEADER_inc_html_head|smarty:nodefaults})
<title>【预览】({$title})</title>
<meta content="text/css" http-equiv="content-style-type" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
({if $meta_description})
<meta name="description" content="({$meta_description})" />
({/if})
({if $meta_keywords})
<meta name="keywords" content="({$meta_keywords})" />
({/if})
<link href="modules/portal/css/master.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="modules/portal/css/layout({$layout_type}).css" type="text/css" media="all" id="layoutStyle" />
<link rel="stylesheet" href="modules/portal/skin/({$color_type})/skin.css" type="text/css" media="all" id="skinStyle" />
<script type="text/javascript" src="js/pne.js"></script>
<style type="text/css">
<!--
#siteTtl{ background: url(({t_img_url_skin filename=skin_before_header})) no-repeat;}
#publication{ background: url(({t_img_url_skin filename=skin_footer})) no-repeat;}
({if $custom_css})
({$custom_css|smarty:nodefaults})
({/if})
-->
</style>
</head>
<body>
({$INC_HEADER_inc_page_top2|smarty:nodefaults})
({if ! $smarty.const.IS_CLOSED_SNS})
<div class="container" id="free">
({else})
<div class="container" id="invite">
({/if})
({$INC_HEADER_inc_page_top|smarty:nodefaults})
   <div class="site">
       <div id="siteTtl"><h1>({$head_text})</h1></div>
       <div class="snsLogin">
           <fieldset>
           <legend>登录</legend>
           <div id="usernameArea"><label for="username"><span>E-mail地址</span></label><input type="text" name="username" tabindex="1" id="username" /></div>
           <div id="passwordArea"><label for="password"><span>密码</span></label><input type="password" name="password" tabindex="2" id="password" /></div>
           <div id="isSaveArea"><input type="checkbox" name="is_save" value="1" tabindex="3" id="isSave" /><label for="isSave"><span>下次自动登录</span></label></div>
           <div id="passwordQueryArea"><a href="#">&gt;忘记密码点这里</a></div>
           <div id="buttonLoginArea"><button type="submit" tabindex="4" id="buttonLogin" onclick="window.alert('不能从预览页面登录。');">登录</button></div>
           ({if ! $smarty.const.IS_CLOSED_SNS})
           <div id="buttonRegiArea"><button type="submit" disabled="disabled">注册</button></div>
           ({/if})
           </fieldset>
       </div>
   </div>

   <div class="contents">
       <div class="frameTop">
           ({foreach from=$top item=data})
               ({ext_include file="inc_portal_Contents_Layout.tpl"})
           ({/foreach})
       </div>

       <div class="frameMiddle">
           <div class="partitionLeft">
               ({foreach from=$left item=data})
                   ({ext_include file="inc_portal_Contents_Layout.tpl"})
               ({/foreach})
           </div>
           <div class="partitionRight">
               ({foreach from=$right item=data})
                   ({ext_include file="inc_portal_Contents_Layout.tpl"})
               ({/foreach})
           </div>
       </div>

       <div class="frameBottom">
           ({foreach from=$bottom item=data})
               ({ext_include file="inc_portal_Contents_Layout.tpl"})
           ({/foreach})
       </div>


       <div class="publication" id="publication">({$INC_FOOTER_inc_page_footer|smarty:nodefaults})</div>
({$INC_FOOTER_inc_page_bottom2|smarty:nodefaults})
   </div>

({if $INC_FOOTER_side_banner_html_before || $INC_FOOTER_inc_side_banner})
    <div class="sideBanner">
    ({if $INC_FOOTER_side_banner_html_before})
        ({$INC_FOOTER_side_banner_html_before|smarty:nodefaults|t_url2cmd:'side_banner'|t_cmd:'side_banner'})
    ({else})
        ({if $INC_FOOTER_inc_side_banner.a_href})
        ({if $PHPSESSID})
        <a href="({t_url m=pc a=do_h_click_banner})&amp;target_c_banner_id=({$INC_FOOTER_inc_side_banner.c_banner_id})&amp;sessid=({$PHPSESSID})" target="_blank">
        ({else})
        <a href="({t_url m=pc a=do_o_click_banner})&amp;target_c_banner_id=({$INC_FOOTER_inc_side_banner.c_banner_id})" target="_blank">
        ({/if})
            <img src="({t_img_url filename=$INC_FOOTER_inc_side_banner.image_filename})">
        </a>
        ({else})
        <img src="({t_img_url filename=$INC_FOOTER_inc_side_banner.image_filename})">
        ({/if})
    ({/if})
    </div>
({/if})

</div>
({$INC_FOOTER_inc_page_bottom2|smarty:nodefaults})
</body>
</html>
