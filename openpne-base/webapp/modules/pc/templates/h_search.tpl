<div id="LayoutD">
<div id="Left">
({* {{{ formTable *})
({if $use_msn})
<div class="dparts formTable">
<div class="parts">
<div class="partsHeading"><h3>导入MSN中的好友名单</h3></div>
({t_form_block _method=post m=pc a=page_h_member_search_invite})
<table >
<tr>
	<th colspan="2">
		<span>
		MSN帐号</span>
		<input class="input_text" type="hidden" name="hostname" value="msn">
	</th>
	<td  align="left" valign="middle">
		<div >
		<input class="input_text" name="username" size="30" type="text">
		</div>
	</td>
</tr>
<tr>
	<th colspan="2">
		<span>密码</span>
		</th>
	
	<td class="bg_02" align="left" valign="middle">
		<div class="padding_s"><input class="input_text" name="password" size="30" type="password"></div>
	</td>
</tr>
<tr>
	
</tr>
<tr>
	<td style="width:427px;" class="bg_03" align="center" valign="middle" colspan="3">
		<div>
			<table border="0" cellspacing="0" cellpadding="0" style="height:20px;">
				<tr>
				  <td>
					<div align="center" style="text-align:center;">
					<input type="submit" class="input_submit" value="导入名单">
					</div>
				  </td>
				</tr>
			</table>
		</div>
	</td>
</tr>
<tr>
	<td style="width:497px;" class="bg_03" align="left" valign="middle" colspan="3">
		<div style="padding:5px 10px 10px 10px;">
		本站不会保留你的聊天工具帐号和密码，更不会在不经过你的允许的情况下，给你的好友发任何信息。
		</div>
	</td>
</tr>
</table>
({/t_form_block})
</div>
</div>
({/if})

<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>会员检索</h3></div>
({t_form_block _method=get m=pc a=page_h_search_result})
<table>
<tr>
<th>({$WORD_NICKNAME})</th>
<td>
<input type="text" class="input_text" name="nickname" size="30" />
</td>
</tr>
<tr>
<th>出生年月日</th>
<td>
<input type="text" class="input_text" name="birth_year" size="4" maxlength="4" /> 年
<input type="text" class="input_text" name="birth_month" size="2" maxlength="2" /> 月
<input type="text" class="input_text" name="birth_day" size="2" maxlength="2" /> 日
</td>
</tr>
({foreach from=$profile_list item=profile})
({if $profile.disp_search})
<tr>
<th>({$profile.caption})</th>
<td>
({strip})
({if $profile.form_type == 'select' || $profile.form_type == 'radio'})
    <select name="profile[({$profile.name})]">
    <option value="0" selected="selected">无指定</option>
    ({foreach from=$profile_list[$profile.name].options item=item})
    <option value="({$item.c_profile_option_id})">({$item.value})</option>
    ({/foreach})
    </select>
({elseif $profile.form_type == 'checkbox'})
({* 単一選択パターン *})
    <select name="profile[({$profile.name})]">
    <option value="0" selected="selected">无指定</option>
    ({foreach from=$profile_list[$profile.name].options item=item})
    <option value="({$item.c_profile_option_id})">({$item.value})</option>
    ({/foreach})
    </select>
({elseif $profile.form_type == 'text' || $profile.form_type == 'textlong' || $profile.form_type == 'textarea'})
    <input type="text" class="input_text" name="profile[({$profile.name})]" size="30" />
({/if})
({/strip})
</td>
</tr>
({/if})
({/foreach})
<tr>
<th>有无照片</th>
<td>
<input type="checkbox" class="input_checkbox" name="image" id="image" value="1" /><label for="image">有</label>
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="检  索" /></li>
</ul>
</div>
({/t_form_block})
</div>
</div>
({* }}} *})

({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>检索项目一览</h3></div>
<div class="block">
<p>显示检索项目一览及各项目成员数。</p>
({t_form_block _method=get m=pc a=page_h_search_list})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="显示一览" /></li>
</ul>
({/t_form_block})
</div>
</div>
</div>
({* }}} *})

</div><!-- Left -->

<div id="Center">
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>欢迎新会员</h3></div>
<div class="welcomeNewMember">
({foreach from=$target_friend_list item=item})
<table><tr>
<th class="photo"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></th>
<td><p><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a></p>
({$item.profile.self_intro.value|t_truncate:24:"":3})</td>
</tr></table>
({/foreach})
</div></div></div>
</div><!-- Center -->
</div><!-- LayoutD -->
