<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>登陆手机邮件地址</h3></div>
<div class="partsInfo">
<p>用手机可查看日记、圈子、朋友足迹及其他帖子。手机设定请按以下顺序进行。</p>
<ol>
<li>１．请在下面登记好手机邮件地址后按"送信"按钮。</li>
<li>２．({$SNS_NAME})会向您的手机信箱中发送邮件。</li>
<li>３．点击邮件的激活链接完成手机邮件登录。</li>
</ol>
<p>※如果您的手机已经设定为从特定的域名那里收信，请让您的设定也能够接受「({$smarty.const.ADMIN_EMAIL})」发来的邮件。</p>
<p>※如果手机邮件地址已经被登记，请变更为新的邮件地址 。</p>
</div>
({t_form_block m=pc a=do_h_config_ktai_send})
<table>
<tr>
<th>手机邮件地址</th>
<td>
<input type="text" class="input_text" name="ktai_address" value="({$form_val.mail})" size="40" />
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="送信" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({if $ktai && ($smarty.const.IS_GET_EASY_ACCESS_ID != 3 && $smarty.const.IS_GET_EASY_ACCESS_ID != 2)})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>手机邮件地址删除</h3></div>
<div class="block">
<p>删除已经登陆的手机邮件地址</p>
({t_form_block m=pc a=page_h_delete_ktai})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="删除" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
