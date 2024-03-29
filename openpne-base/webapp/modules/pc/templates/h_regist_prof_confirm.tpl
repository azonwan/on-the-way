<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>个人资料确认</h3></div>

<div class="partsInfo">
<p>以下内容将被记录。确认无误后请点击登录按钮。</p>
</div>

<table>
({capture name="nick"})
<tr><th>({$WORD_NICKNAME}) <strong>※</strong></th><td>({$prof.nickname|default:"&nbsp;"})</td></tr>
({/capture})
({capture name="birth"})
<tr><th>出生年 <strong>※</strong></th><td>({$prof.birth_year|default:"&nbsp;"})年
({if $prof.public_flag_birth_year == 'friend'})
（对({$WORD_MY_FRIEND})公开）
({elseif $prof.public_flag_birth_year == 'private'})
（不公开）
({/if})</td></tr>
<tr><th>生日 <strong>※</strong></th><td>({$prof.birth_month|default:"&nbsp;"})月({$prof.birth_day|default:"&nbsp;"})日
({if $prof.public_flag_birth_month_day == 'friend'})
（对({$WORD_MY_FRIEND})公开）
({elseif $prof.public_flag_birth_month_day == 'private'})
（不公开）
({/if})</td></tr>
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
({strip})
({if $prof.profile[$profile.name].value})

({if $profile.form_type == 'textarea'})
    ({$prof.profile[$profile.name].value|nl2br|t_url2cmd:'profile':$u|t_cmd:'profile'})
({elseif $profile.form_type == 'checkbox'})
    ({$prof.profile[$profile.name].value|@t_implode:", "})
({else})
    ({$prof.profile[$profile.name].value})
({/if})

({if $prof.profile[$profile.name].public_flag == 'friend'})
（对({$WORD_MY_FRIEND})公开）
({elseif $prof.profile[$profile.name].public_flag == 'private'})
（不公开）
({/if})

({/if})
({/strip})
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

</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_regist_prof})
<input type="hidden" name="mode" value="register" />
<input type="submit" class="input_submit" value="　登　录　" />
({/t_form_block})
</li><li>
({t_form_block m=pc a=do_h_regist_prof})
<input type="hidden" name="mode" value="input" />
<input type="submit" class="input_submit" value="　修　改　" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
