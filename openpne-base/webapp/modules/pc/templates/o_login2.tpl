<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>PC邮件地址登陆</h3></div>

<div class="partsInfo">
<p>邮件地址变更。<br />请输入密码。<br />※变更的邮件地址将作为登录时使用的邮件地址。</p>
</div>

({t_form_block m=pc a=do_o_login2_change_mail})
<input type="hidden" name="sid" value="({$sid})" />
<input type="hidden" name="username" value="({$username})" />
<table>
<tr><th>邮件地址</th><td>({$pc_address})<br /><p class="caution">※邮件地址不被公开。</p></td></tr>
<tr><th>パスワード</th><td><input type="password" name="password" class="text" /></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　登  录" /></li>
</ul>
</div>
({/t_form_block})

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
