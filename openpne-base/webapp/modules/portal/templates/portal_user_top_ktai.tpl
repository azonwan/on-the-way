({$inc_ktai_header|smarty:nodefaults})

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
<br>
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
({t_form _attr='utn' m=ktai a=do_o_easy_login})
<input type="hidden" name="login_params" value="({$requests.login_params})">
<input type="submit" value="手机版登录"><br>
</form>
</center>
<br>
<a href="({t_url m=ktai a=page_o_whatis_easy_login})">&gt;&gt;かんたんﾛｸﾞｲﾝとは</a><br>
</td></tr></table>
<br>

<table width="100%"><tr><td bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">[i:116]密码登录</font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_04})">
({t_form m=ktai a=do_o_login})
<input type="hidden" name="login_params" value="({$requests.login_params})">
<font color="#({$ktai_color_config.bg_02})">★</font>手机邮件地址<br>
<textarea name="username" rows="1" istyle="3" mode="alphabet"></textarea><br>
<font color="#({$ktai_color_config.bg_02})">★</font>密码<br>
<input name="password" type="text" istyle="3" mode="alphabet" value=""><br>
<center>
<input name="submit" value="ﾛｸﾞｲﾝ" type="submit"><br>
</center>
</form>
({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne'})
({if $smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_KTAI})
<a href="({$smarty.const.SLAVEPNE_PASSWORD_QUERY_URL_KTAI})">&gt;&gt;忘记密码</a><br>
({/if})
({else})
<a href="({t_url m=ktai a=page_o_password_query})">&gt;&gt;忘记密码</a><br>
({/if})
</td></tr></table>
<br>

({foreach from=$bottom item=data})
    ({ext_include file="inc_portal_Contents_Layout_ktai.tpl"})
({/foreach})

<br>
({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne'})
({if $smarty.const.SLAVEPNE_SYOUTAI_URL_KTAI})
<hr color="#({$ktai_color_config.border_01})">
■<a href="({$smarty.const.SLAVEPNE_SYOUTAI_URL_KTAI})">新用户注册</a><br>
({/if})
({elseif $IS_CLOSED_SNS})
<hr color="#({$ktai_color_config.border_01})">
({$SNS_NAME})是邀请制SNS<br>
登录({$SNS_NAME})({if $smarty.const.IS_USER_INVITE})参加者({else})管理员({/if})发送邀请。<br>

({elseif !((($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_KTAI)) >> 1)})

新用户注册请从PC进行。<br>

({else})

从以下的链接新用户注册，不输入本文请发送邮件。<br>
<br>
<a href="mailto:({$smarty.const.MAIL_ADDRESS_PREFIX})get@({$smarty.const.MAIL_SERVER_DOMAIN})">[i:106]用邮件登录!</a><br>
<br>
※确认同意利用规章之后请进行登录。<br>
※被设定域指定接收， 「({$smarty.const.ADMIN_EMAIL})」为使能接收请指定用户的邮件。<br>

<hr color="#({$ktai_color_config.border_01})">
■<a href="({t_url m=ktai a=page_o_sns_kiyaku})">利用规章</a><br>
({if $smarty.const.OPENPNE_DISP_KTAI_SNS_PRIVACY})
■<a href="({t_url m=ktai a=page_o_sns_privacy})">隐私政策</a><br>
({/if})
({/if})

({$inc_ktai_footer|smarty:nodefaults})
