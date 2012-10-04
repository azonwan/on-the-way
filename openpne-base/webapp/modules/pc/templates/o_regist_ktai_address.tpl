<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>输入手机登录用的邮件地址</h3></div>

({t_form_block m=pc a=page_o_regist_ktai_address_confirm})
<input type="hidden" name="sid" value="({$sid})" />

<div class="partsInfo">
<p>
要参加({$smarty.const.SNS_NAME})，需要手机登记。<br />
手机登陆用的URL将会发送到在这里输入了的手机邮件地址。<br />
<br />
※在这里输入的邮件地址对其他的成员不公开。<br />
※如果需要设定指定接收对象、请指定接受从「({$smarty.const.ADMIN_EMAIL})」发来的邮件。
</p>
</div>

<table>
<tr><th>手机邮件地址<span class="caution">※</span></th><td><input type="text" class="text" name="ktai_address" value="({$ktai_address})" size="40" /></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="确认" /></li>
</ul>
</div>
({/t_form_block})

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
