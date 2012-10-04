<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>用户注册</h3></div>
<div class="partsInfo">
<p>
请输入您的邮件地址({if $smarty.const.OPENPNE_USE_CAPTCHA})和确认验证码。({/if})<br />
在此输入也可，自动获得({$SNS_NAME})网站发来的邀请函。
</p>
</div>
({t_form_block m=pc a=do_o_public_invite})
<table>
<tr>
<th>邮件地址</th>
<td>
<input type="text" class="input_text" name="pc_address" value="" size="40" />
</td>
</tr>
<tr>
<th>邮件地址（确认）</th>
<td>
<input type="text" class="input_text" name="pc_address2" value="" size="40" />
</td>
</tr>
({if $smarty.const.OPENPNE_USE_CAPTCHA})
<tr>
<th>确认验证码</th>
<td>
<p><img src="./cap.php?rand=({math equation="rand(0,99999999)"})" alt="确认验证码" /></p>
<p>※请输入上面显示的验证码。</p>
<input type="text" class="input_text" name="captcha" value="" size="30" />
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="送  信" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
