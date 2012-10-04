<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>手机登录邮件地址确认</h3></div>

<div class="partsInfo">
<p>
向以下的手机邮件地址发送手机登陆的URL。<br />
<br />
※在这里输入了的邮件地址对其他的成员不公开<br />
※为了能接收到「({$smarty.const.ADMIN_EMAIL})」的邮件，请设定接收地址。
</p>
</div>

<table>
<tr><th>手机邮件地址<span class="caution">※</span></th><td>({$ktai_address})</td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_o_regist_ktai_address})
<input type="hidden" name="sid" value="({$sid})" />
<input type="hidden" name="ktai_address" value="({$ktai_address})" />
<input type="submit" class="input_submit" value="发  送" />
({/t_form_block})
</li><li>
({t_form_block m=pc a=page_o_regist_ktai_address})
<input type="hidden" name="sid" value="({$sid})" />
<input type="hidden" name="ktai_address" value="({$ktai_address})" />
<input type="submit" class="input_submit" value="修  改" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
