<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>邮件地址登录</h3></div>

({t_form_block m=pc a=do_o_regist_mail})
<input type="hidden" name="sid" value="({$sid})" />
<input type="hidden" name="username" value="({$username})" />

<div class="partsInfo">
<p>以下为邮件地址登录流程。<br />请输入密码。</p>
</div>

<table>
<tr><th>邮件地址</th><td>({$pc_address})<br /><span class="caution">※邮件地址不公开。</span></td></tr>
<tr><th>密码</th><td><input type="password" name="password" class="text" /></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　更  改　" /></li>
</ul>
</div>
({/t_form_block})

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
