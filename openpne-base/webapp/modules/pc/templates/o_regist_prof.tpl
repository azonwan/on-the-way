<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>输入个人资料</h3><p>(带<strong>※</strong>的为必填项目)</p></div>
({t_form_block m=pc a=do_o_regist_prof})
<input type="hidden" name="sid" value="({$sid})" />
<table>
({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})
<tr>
<th>ID号 <strong>※</strong></th>
<td>
<input class="text" name="login_id" type="text" value="({$profs.login_id})" size="30" />
<p class="caution">
※请输入4~30位的文字或数字，符号(下划线「_」，连字短横线「-」)<br />
※最初和最后的文字请输入半角英文<br />
※英文不区分大小写</p>
</td>
</tr>
({/if})
({capture name="nick"})
<tr>
<th>({$WORD_NICKNAME}) <strong>※</strong></th>
<td><input type="text" class="input_text" name="nickname" value="({$profs.nickname})" size="30" /></td>
</tr>
({/capture})
({capture name="birth"})
<tr>
<th>出生年 <strong>※</strong></th>
<td>
<table><tr><td>
<input type="text" class="input_text" name="birth_year" value="({$profs.birth_year})" size="10" maxlength="4" /> 年
</td><td class="publicSelector">
<select name="public_flag_birth_year">
({html_options options=$public_flags selected=$profs.public_flag_birth_year})
</select>
</td></tr></table>
</td>
</tr>
<tr>
<th>生日 <strong>※</strong></th>
<td>
<table><tr><td>
<select name="birth_month">
<option value="0">--</option>
({foreach from=$month_list item=item})
<option value="({$item})"({if $profs.birth_month==$item}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 月
<select name="birth_day">
<option value="0">--</option>
({foreach from=$day_list item=item})
<option value="({$item})"({if $profs.birth_day==$item}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 日
</td><td class="publicSelector">
<select name="public_flag_birth_month_day">
({html_options options=$public_flags selected=$profs.public_flag_birth_month_day})
</select>
</td></tr></table>
</td>
</tr>
({/capture})
({foreach from=$c_profile_list item=profile})
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
({if $profile.public_flag_edit})<table><tr><td>({/if})

({strip})
({if $profile.form_type == 'text'})
	<input type="text" class="input_text" name="profile[({$profile.name})]" value="({$profs.profile[$profile.name]})" size="30" />
({elseif $profile.form_type == 'textlong'})
	<input type="text" class="input_text input_text_long" name="profile[({$profile.name})]" value="({$profs.profile[$profile.name]})" size="60" />
({elseif $profile.form_type == 'textarea'})
	<textarea name="profile[({$profile.name})]" rows="6" cols="50">({$profs.profile[$profile.name]})</textarea>
({elseif $profile.form_type == 'select'})
	<select name="profile[({$profile.name})]">
	<option value="">请选择</option>
	({foreach from=$profile.options item=item})
		<option value="({$item.c_profile_option_id})"({if $profs.profile[$profile.name] == $item.c_profile_option_id}) selected="selected"({/if})>({$item.value|default:"--"})</option>
	({/foreach})
	</select>
({elseif $profile.form_type == 'radio'})
	<div class="checkList">
	({foreach item=item from=$profile.options})
		({counter name=$profile.name assign=_cnt})
		({if $_cnt % 3 == 1})<ul>({/if})
			<li><input type="radio" class="input_radio" name="profile[({$profile.name})]" id="profile-({$profile.name})-({$item.c_profile_option_id})" value="({$item.c_profile_option_id})"({if $profs.profile[$profile.name] == $item.c_profile_option_id}) checked="checked"({/if}) /><label for="profile-({$profile.name})-({$item.c_profile_option_id})">({$item.value|default:"--"})</label></li>
		({if $_cnt % 3 == 0})</ul>({/if})
	({/foreach})
	({if $_cnt % 3 != 0})</ul>({/if})
	</div>
({elseif $profile.form_type == 'checkbox'})
	<div class="checkList">
	({foreach item=item from=$profile.options name=check})
		({counter name=$profile.name assign=_cnt})
		({if $_cnt % 3 == 1})<ul>({/if})
			<li><input type="checkbox" class="input_checkbox" name="profile[({$profile.name})][]" id="profile-({$profile.name})-({$item.c_profile_option_id})" value="({$item.c_profile_option_id})"({if $profs.profile[$profile.name] && in_array($item.c_profile_option_id|smarty:nodefaults, $profs.profile[$profile.name])}) checked="checked"({/if}) /><label for="profile-({$profile.name})-({$item.c_profile_option_id})">({$item.value|default:"--"})</label></li>
		({if $_cnt % 3 == 0})</ul>({/if})
	({/foreach})
	({if $_cnt % 3 != 0})</ul>({/if})
	</div>
({/if})
({/strip})

({if $profile.info})<p class="caution">({$profile.info})</p>({/if})

({if $profile.public_flag_edit})
</td><td class="publicSelector">
({if $profs.public_flag[$profile.name]})
({assign var=pflag value=$profs.public_flag[$profile.name]})
({else})
({assign var=pflag value=$profile.public_flag_default})
({/if})
<select name="public_flag[({$profile.name})]">
({foreach from=$public_flags key=key item=item})
<option value="({$key})"({if $pflag==$key}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select>
</td></tr></table>
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
<th>PC电子邮件 <strong>※</strong></th>
<td>
({$pc_address})
<p class="caution">※不对其他会员公开</p>
</td>
</tr>
<tr>
<th>密码 <strong>※</strong></th>
<td>
<input type="password" class="input_password" name="password" value="" />
<p class="caution">※请用6~12个英文或数字表示</p>
</td>
</tr>
<tr>
<th>密码确认 <strong>※</strong></th>
<td>
<input type="password" class="input_password" name="password2" value="" />
</td>
</tr>
<tr>
<th>找回密码时的问题 <strong>※</strong></th>
<td>
<select name="c_password_query_id">
<option value="">请选择</option>
({foreach from=$query_list key=key item=item})
<option value="({$key})"({if $profs.c_password_query_id == $key}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select>
</td>
</tr>
<tr>
<th>答案 <strong>※</strong></th>
<td>
<input type="text" class="input_text" name="c_password_query_answer" value="({$profs.c_password_query_answer})" size="30" />
</td>
</tr>
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
