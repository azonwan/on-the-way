<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$smarty.const.SNS_NAME}) 退会</h3></div>
<div class="partsInfo">
<p>
真的要退会吗？<br />
退会时为确认其真实性，请输入密码。<br />
<br />
如果是圈子管理者退会的话，管理权限将移交给副管理者，如果没有副管理者的话，将移交给最早参加圈子的社员。
</p>
</div>
({t_form_block m=pc a=do_h_taikai})
<table>
<tr>
<th>密码 <strong>※</strong></th>
<td>
<input type="password" class="input_pasword" name="password" value="" />
</td>
</tr>
<tr>
<th>退会理由 <strong>※</strong></th>
<td>
<textarea name="reason" rows="8" cols="50"></textarea>
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="退会" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_home})">取消后返回首页</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
