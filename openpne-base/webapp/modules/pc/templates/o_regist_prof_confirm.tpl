<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>个人资料确认</h3></div>
<div class="partsInfo">
<p>请检查以下内容。确认后请单击登录按钮。</p>
</div>
<table>
({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})
<tr>
<th>ID号 <strong>※</strong></th>
<td>({$prof.login_id})</td>
</tr>
({/if})
({capture name="nick"})
<tr>
<th>({$WORD_NICKNAME}) <strong>※</strong></th>
<td>({$prof.nickname})</td>
</tr>
({/capture})
({capture name="birth"})
<tr>
<th>出生年 <strong>※</strong></th>
<td>
({$prof.birth_year})年
({if $prof.public_flag_birth_year == 'friend'})
（只对({$WORD_MY_FRIEND})公开）
({elseif $prof.public_flag_birth_year == 'private'})
（不公开）
({/if})
</td>
</tr>
<tr>
<th>出生日 <strong>※</strong></th>
<td>
({$prof.birth_month})月({$prof.birth_day})日
({if $prof.public_flag_birth_month_day == 'friend'})
（只对({$WORD_MY_FRIEND})公开
({elseif $prof.public_flag_birth_month_day == 'private'})
（不公开）
({/if})
</td>
</tr>
({/capture})
({foreach from=$profile_list item=profile})
({strip})

({if !$_cnt_nick && $profile.sort_order >= $smarty.const.SORT_ORDER_NICK
  && !$_cnt_birth && $profile.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_nick"})
({counter assign="_cnt_birth"})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({/if})

({if !$_cnt_nick && $profile.sort_order >= $smarty.const.SORT_ORDER_NICK})
({counter assign="_cnt_nick"})
({$smarty.capture.nick|smarty:nodefaults})
({/if})

({if !$_cnt_birth && $profile.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_birth"})
({$smarty.capture.birth|smarty:nodefaults})
({/if})

({/strip})
({if $profile.disp_regist})
<tr>
<th>({$profile.caption})({if $profile.is_required}) <strong>※</strong>({/if})</th>
<td>
({if $prof.profile[$profile.name].value})

({if $profile.form_type == 'textarea'})
    ({$prof.profile[$profile.name].value|nl2br|t_url2cmd:'profile'|t_cmd:'profile'})
({elseif $profile.form_type == 'checkbox'})
    ({$prof.profile[$profile.name].value|@t_implode:", "})
({else})
    ({$prof.profile[$profile.name].value})
({/if})

({if $prof.profile[$profile.name].public_flag == 'friend'})
（只对({$WORD_MY_FRIEND})公开）
({elseif $prof.profile[$profile.name].public_flag == 'private'})
（不公开）
({/if})

({/if})
</td>
</tr>
({/if})
({/foreach})
({if !$_cnt_nick && !$_cnt_birth})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({else})
({if !$_cnt_nick})({$smarty.capture.nick|smarty:nodefaults})({/if})
({if !$_cnt_birth})({$smarty.capture.birth|smarty:nodefaults})({/if})
({/if})
<tr>
<th>PC电子邮件<strong>※</strong></th>
<td>({$pc_address})</td>
</tr>
<tr>
<th>密码<strong>※</strong></th>
<td>（不显示）</td>
</tr>
<tr>
<th>密码提示问题 <strong>※</strong></th>
<td>({$password_query_name})</td>
</tr>
<tr>
<th>密码提示的答案 <strong>※</strong></th>
<td>({$prof.c_password_query_answer})</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_o_regist_prof})
<input type="hidden" name="mode" value="register" />
<input type="hidden" name="sid" value="({$sid})" />
<input type="submit" class="input_submit" value="登  录" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=do_o_regist_prof})
<input type="hidden" name="mode" value="input" />
<input type="hidden" name="sid" value="({$sid})" />
<input type="submit" class="input_submit" value="修  改" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
