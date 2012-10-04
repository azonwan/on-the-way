<div id="LayoutC">
<div id="Center">

({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_NONE})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>邀请朋友参加({$smarty.const.SNS_NAME})</h3></div>
<div class="block">
<p>本网站不能自行注册。</p>
</div>
</div></div>
({* }}} *})
({else})
({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>邀请朋友参加({$smarty.const.SNS_NAME})</h3></div>
<div class="partsInfo">
<p>邀请参加「({$smarty.const.SNS_NAME})」的朋友的邮件地址。</p>
</div>
({t_form_block m=pc a=page_h_invite_confirm})
<table>
<tr>
<th>朋友的邮件地址</th>
<td>
<input type="text" class="input_text" name="mail" value="({$requests.mail})" size="40" />
({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_PC})
<p class="caution">※手机邮件地址不能接受邀请函。</p>
({elseif $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_KTAI})
<p class="caution">※PC邮件地址不能接受邀请函。</p>
({/if})
</td>
</tr>
<tr>
<th>消息(任意)</th>
<td>
<textarea name="message" rows="5" cols="40">({$requests.message})</textarea>
</td>
</tr>
({if $smarty.const.OPENPNE_USE_CAPTCHA})
<tr>
<th>验证码</th>
<td>
<p><img src="./cap.php?rand=({math equation="rand(0,99999999)"})" alt="验证码" /></p>
<p>※请输入上面显示的验证码。</p>
<input type="text" class="input_text" name="captcha" value="" size="30" />
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="确认" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})
({/if})

({if $inviting_member || $k_inviting_member})
({* {{{ recentList *})
<div class="dparts recentList"><div class="parts">
<div class="partsHeading"><h3>邀请的邮件地址一览</h3></div>

 ({t_form_block m=pc a=do_h_invite_delete_member})
<input type="hidden" name="m" value="pc" />
<input type="hidden" name="a" value="do_h_invite_delete_member" />
<input type="hidden" name="c_member_id[]" value="({$item.c_member_pre_id})" />

({foreach from=$inviting_member item=item})
<dl>
<dt>({$item.r_date|date_format:"%Y年%m月%d日"})</dt>
<dd><input type="checkbox" class="input_checkbox" name="c_member_id[]" id="c_member_id-({$item.c_member_pre_id})" value="({$item.c_member_pre_id})" /> <label for="c_member_id-({$item.c_member_pre_id})">({$item.regist_address})</label></dd>
</dl>
({/foreach})

({foreach from=$k_inviting_member item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年%m月%d日"})</dt>
<dd><input type="checkbox" class="input_checkbox" name="c_member_ktai_id[]" id="c_member_id-({$item.c_member_pre_id})" value="({$item.c_member_ktai_pre_id})" /> <label for="c_member_id-({$item.c_member_pre_id})">({$item.ktai_address})</label></dd>
</dl>
({/foreach})

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　删  除　" /></li>
</ul>
</div>

({/t_form_block})
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
