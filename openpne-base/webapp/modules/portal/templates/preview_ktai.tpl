<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<title>【预览】({$title})</title>
<style type="text/css">
* { font-size: small;}
body { margin: 0; padding: 0; text-align: center;}
a img { border: none;}
table, td { margin: 0; padding: 0; border: 0;}
table { border-collapse: collapse; border-spacing: 0px;}
div#Outline {
    width: 250px;
    margin: 0 auto;
}
div#Content {
    text-align:left;
    border: solid 5px #cccccc;
    overflow: hidden;
    word-break: break-all;
}
input.input_text {
    background-color: #ffffff;
    border: solid 1px #000000;
    width: 238px;
}
hr.colored {
    color: #({$ktai_color_config.bg_01});
    border: solid 1px #({$ktai_color_config.bg_01});
    border-top-color: #({$ktai_color_config.border_01});
}
</style>
<script type="text/javascript">
function dummyAlert() { alert('从预览页不能操作'); }
</script>
({$inc_ktai_html_head|smarty:nodefaults})
</head>
<body text="#({$ktai_color_config.font_01})" bgcolor="#({$ktai_color_config.bg_01})" link="#({$ktai_color_config.font_02})" alink="#({$ktai_color_config.font_03})" vlink="#({$ktai_color_config.font_04})">
<div id="Outline">
<div id="Content">

({if $inc_ktai_entry_point[1]})
({$inc_ktai_entry_point[1]|smarty:nodefaults})
({/if})
<table width="100%">
({if $smarty.const.OPENPNE_USE_KTAI_LOGO})
<tr><td align="center">
<img src="({t_img_url_skin filename=skin_ktai_header w=240 h=320 f=jpg})" alt="({$smarty.const.SNS_NAME})"><br>
</td></tr>
({else})
<tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">({$smarty.const.SNS_NAME})</font><br>
</td></tr>
({/if})
</table>
({if $inc_ktai_entry_point[2]})
({$inc_ktai_entry_point[2]|smarty:nodefaults})
({/if})
<br>

({foreach from=$top item=data})
({ext_include file="inc_portal_Contents_Layout_ktai.tpl"})
({/foreach})

<center>
加入书签<br>
</center>
<br>
<table width="100%"><tr><td bgcolor="#({$ktai_color_config.bg_02})">
[i:75]<font color="#({$ktai_color_config.font_05})">手机版登录</font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_04})">
<br>
<center>
<input type="submit" value="かんたんﾛｸﾞｲﾝ" onclick="dummyAlert()"><br>
</center>
<br>
<a href="javascript:dummyAlert()">&gt;&gt;手机版登录</a><br>
</td></tr></table>
<br>

<table width="100%"><tr><td bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">[i:116]密码登录</font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_04})">
<input type="hidden" name="login_params" value="({$requests.login_params})">
<font color="#({$ktai_color_config.bg_02})">★</font>手机邮件地址<br>
<input class="input_text" type="text" name="username" value="" disabled><br>
<font color="#({$ktai_color_config.bg_02})">★</font>密码<br>
<input class="input_text" name="password" type="text" value="" disabled><br>
<center>
<input type="submit" value="ﾛｸﾞｲﾝ" onclick="dummyAlert()"><br>
</center>
<a href="javascript:dummyAlert()">&gt;&gt;忘记密码</a><br>
</td></tr></table>
<br>

({foreach from=$bottom item=data})
({ext_include file="inc_portal_Contents_Layout_ktai.tpl"})
({/foreach})

({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne'})
({if $smarty.const.SLAVEPNE_SYOUTAI_URL_KTAI})
<hr class="colored">
■<a href="javascript:dummyAlert()">新用户注册</a><br>
({/if})
({elseif $IS_CLOSED_SNS})
<hr class="colored">
({$SNS_NAME})是邀请制SNS。<br>
登录({$SNS_NAME})({if $smarty.const.IS_USER_INVITE})参加者({else})管理员({/if})发送邀请。<br>

({elseif !((($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_KTAI)) >> 1)})

新用户注册请从PC进行。<br>

({else})

从以下的链接新用户注册，不输入本文请发送邮件。<br>
<br>
<a href="javascript:dummyAlert()">[i:106]用邮件登录!</a><br>
<br>
※确认同意利用规章之后请进行登录。<br>
※被设定域指定接收「({$smarty.const.ADMIN_EMAIL})」为使能接收请指定用户的邮件。<br>

<hr class="colored">
■<a href="javascript:dummyAlert()">利用规章</a><br>
■<a href="javascript:dummyAlert()">隐私政策</a><br>
({/if})

</div>
</div>
({$inc_ktai_footer|smarty:nodefaults})
