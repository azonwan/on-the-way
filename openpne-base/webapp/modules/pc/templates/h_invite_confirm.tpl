<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>邀请朋友参加({$SNS_NAME})</h3></div>

<table>
<tr><th>对方的邮件地址</th><td>({$form_val.mail})</td></tr>
<tr><th>消息(任意)</th><td>({$form_val.message|nl2br})</td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_invite_insert_c_invite})
<input type="hidden" name="mail" value="({$form_val.mail})" />
<input type="hidden" name="message" value="({$form_val.message})" />
<input type="hidden" name="captcha_confirm" value="({$captcha_confirm})" />
<input type="submit"  class="input_submit"  value="  送　信  " />
({/t_form_block})
</li><li>
({t_form_block m=pc a=page_h_invite})
<input type="hidden" name="mail" value="({$form_val.mail})" />
<input type="hidden" name="message" value="({$form_val.message})" />
<input type="submit" class="input_submit" value="　修　改　" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
