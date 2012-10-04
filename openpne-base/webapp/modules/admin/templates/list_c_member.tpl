({$inc_header|smarty:nodefaults})

({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="成员一览"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2 id="ttl01">成员一览</h2>
<div class="contents">

<form action="./" method="get">
<p id="searchMail">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_member')})" />
<strong>邮件地址检索</strong>(完全一致)：
<input type="text" class="basic" name="mail_address" value="({$requests.mail_address})" size="30" />
<span class="textBtnS"><input type="submit" value="检索" /></span>
</p>
</form>
({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
<form action="./" method="get">
<p id="searchUsername">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_member')})" />
<strong>进入ID检索</strong>(完全一致)：
<input type="text" class="basic" name="username" value="({$requests.username})" size="30" />
<span class="textBtnS"><input type="submit" value="检索" /></span>
</p>
</form>
({/if})

<div class="userList">
({if $pager})
<form action="./" method="get">
<p id="numberDisplays">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_member')})" />
<input type="hidden" name="order" value="({$requests.order})" />
({foreach from=$cond_list key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<strong>显示件数</strong>：
<select class="basic" name="page_size">
<option value="10"({if $pager.page_size==10}) selected="selected"({/if})>10件</option>
<option value="20"({if $pager.page_size==20}) selected="selected"({/if})>20件</option>
<option value="50"({if $pager.page_size==50}) selected="selected"({/if})>50件</option>
<option value="100"({if $pager.page_size==100}) selected="selected"({/if})>100件</option>
</select>
<span class="textBtnS"><input type="submit" value="变更" /></span><span class="btnCaution">※显示件数过多时，处理会加重，服务器会增加负荷。</span>
</p>
</form>
({/if})

({if $pager})
<div class="listControlTop">
显示<p class="display">({$pager.total_num}) 人中的第 ({$pager.start_num}) - ({$pager.end_num})个人</p>
<p id="controlIcon"><img src="./modules/admin/img/icn_withdrawal.gif" alt="强制退会图标" class="withdraw" />：强制退会　<img src="modules/admin/img/icn_rejected.gif" alt="登录终止图标" />：ロ登录终止　<img src="modules/admin/img/icn_permit.gif" alt="登录终止解除" />：登陆停止解除　<img src="modules/admin/img/icn_passwd.gif" alt="密码在发行图标" />：密码在发行 <img src="modules/admin/img/icn_blacklist.gif" alt="追加黑名单" />：追加手机号码个体识别黑名单</p>
<p class="listMove">
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">前へ</a>({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})&nbsp;|&nbsp;<strong>({$i})</strong>({else})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$i})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">({$i})</a>({/if})
({/foreach})
({if $pager.next_page})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">下一页</a>
({/if})
</p>
</div>({*/div class="listControlTop"*})
({/if})

<form action="./" method="post" name="formSendMessages">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<table class="userListTable">
	<thead>
		<tr>
			<th class="cell01" rowspan="3">&nbsp;</th>
			<th class="cell02" colspan="4" rowspan="3">操作面板</th>
			<th class="cell03" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=c_member_id-1({$cond})">▲</a>ID<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=c_member_id-2({$cond})">▼</a></th>
			({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
			<th class="cell19" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=username-1({$cond})">▲</a>登录ID<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=username-2({$cond})">▼</a></th>
			({/if})
			<th class="cell04" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=nickname-1({$cond})">▲</a>({$WORD_NICKNAME})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=nickname-2({$cond})">▼</a></th>
			({if $smarty.const.OPENPNE_USE_POINT_RANK})
			<th class="cell10" colspan="2" rowspan="2"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=PNE_POINT-1({$cond})">▲</a>头衔・积分<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=PNE_POINT-2({$cond})">▼</a></th>
			({/if})
			<th class="cell05" rowspan="2"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=access_date-1({$cond})">▲</a>最终登录<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=access_date-2({$cond})">▼</a></th>
			<th class="cell06" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=r_date-1({$cond})">▲</a>登录日期<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=r_date-2({$cond})">▼</a></th>
			<th class="cell07" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=c_member_id_invite-1({$cond})">▲</a>邀请者<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=c_member_id_invite-2({$cond})">▼</a></th>
			<th class="cell08" colspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=image_filename-1({$cond})">▲</a>图片<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=image_filename-2({$cond})">▼</a></th>
			<th class="cell09" colspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=birth-1({$cond})">▲</a>生年月日<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=birth-2({$cond})">▼</a></th>
			({foreach from=$c_profile_list item=prof})
			({if $prof.name !== 'PNE_POINT'})
			<th rowspan="2"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=({$prof.name})-1({$cond})">▲</a>({$prof.caption})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=({$prof.name})-2({$cond})">▼</a></th>
			({/if})
			({/foreach})
			<th class="cell16" rowspan="2">PC邮件地址</th>
			<th class="cell17" rowspan="2">携帯邮件地址</th>
			<th class="cell18" rowspan="3">登录时邮件地址</th>
			<th class="cell18" rowspan="3">手机个体识别号码(加密完毕)</th>
			<th class="cell15" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;order=c_member_id-1({$cond})">▲</a>ID<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;order=c_member_id-2({$cond})">▼</a></th>
		</tr>
		<tr>
			<th class="cell08A" rowspan="2">1</th>
			<th class="cell08B" rowspan="2">2</th>
			<th class="cell08C" rowspan="2">3</th>
			<th class="cell09A">年</th>
			<th class="cell09B">月</th>
			<th class="cell09C">日</th>
		</tr>
		<tr class="min_width">
			({if $smarty.const.OPENPNE_USE_POINT_RANK})
			<th class="cell10" colspan="2">
            <select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;s_rank='+this.options[this.selectedIndex].value);">
			<option value="">▼选择</option>
			({foreach from=$rank_data item=item})
			<option({if $cond_list.s_rank == $item.c_rank_id}) selected({/if}) value="({$item.c_rank_id})">({$item.name})</option>
			({/foreach})
			</select>
			～
			<select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;e_rank='+this.options[this.selectedIndex].value);">
			<option value="">▼选择</option>
			({foreach from=$rank_data item=item})
			<option({if $cond_list.e_rank == $item.c_rank_id}) selected({/if}) value="({$item.c_rank_id})">({$item.name})</option>
			({/foreach})
			</select>
			</th>
			({/if})
			<th class="cell05">
            <select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;last_login='+this.options[this.selectedIndex].value);">
            <option value="">选择</option>
            ({foreach from=$select_last_login item=item key=key})
            <option ({if $cond_list.last_login==$key})selected({/if}) value="({$key})">({$item})</option>
            ({/foreach})
            </select>
            </th>
			<th class="cell09A" colspan="3">
			<select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;s_year='+this.options[this.selectedIndex].value);">
			<option value="">▼选择</option>
			({foreach from=$years item=item})
			<option ({if $cond_list.s_year==$item})selected({/if}) value="({$item})">({$item})</option>
			({/foreach})
			</select>
			～
			<select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;e_year='+this.options[this.selectedIndex].value);">
			<option value="">▼选择</option>
			({foreach from=$years item=item})
			<option ({if $cond_list.e_year==$item})selected({/if}) value="({$item})">({$item})</option>
			({/foreach})
			</select>
			</th>
			({foreach from=$profile_list item=prof})
			({if $prof.name !== 'PNE_POINT'})
			<th>
			({if $prof.form_type == 'radio' || $prof.form_type == 'select'})
			<select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;({$prof.name})='+this.options[this.selectedIndex].value);">
			<option value="">▼选择</option>
			({foreach item=item from=$prof.options})
			<option ({if $cond_list[$prof.name]==$item.c_profile_option_id})selected({/if}) value="({$item.c_profile_option_id})"({if $c_member.profile[$profile.name].value == $item.value}) selected="selected"({/if})>({$item.value|default:"--"})</option>
			({/foreach})
			</select>
			({/if})

			<img src="./modules/admin/img/dummy.gif" />
			</th>
			({/if})
			({/foreach})
			<th class="cell05">
            <select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;is_pc_address='+this.options[this.selectedIndex].value);">
            <option value="">▼选择</option>
			<option value="1"({if $cond_list.is_pc_address == 1}) selected="selected"({/if})>登录</option>
			<option value="2"({if $cond_list.is_pc_address == 2}) selected="selected"({/if})>不登录</option>
            </select>
            </th>
			<th class="cell05">
            <select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;is_ktai_address='+this.options[this.selectedIndex].value);">
            <option value="">▼选择</option>
			<option value="1"({if $cond_list.is_ktai_address == 1}) selected="selected"({/if})>登录</option>
			<option value="2"({if $cond_list.is_ktai_address == 2}) selected="selected"({/if})>不登录</option>
            </select>
            </th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<th class="cell01" rowspan="3">&nbsp;</th>
			<th class="cell02" colspan="4" rowspan="2">操作面板</th>
			<th class="cell03" rowspan="2">ID</th>
			({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
			<th class="cell19" rowspan="2">登录ID</th>
			({/if})
			<th class="cell04" rowspan="2">({$WORD_NICKNAME})</th>
			({if $smarty.const.OPENPNE_USE_POINT_RANK})
			<th class="cell10" rowspan="2">头衔</th>
			<th class="cell11" rowspan="2">积分</th>
			({/if})
			<th class="cell05" rowspan="2">最终登录</th>
			<th class="cell06" rowspan="2">登录日</th>
			<th class="cell07" rowspan="2">邀请者</th>
			<th class="cell08A">1</th>
			<th class="cell08B">2</th>
			<th class="cell08C">3</th>
			<th class="cell09A">年</th>
			<th class="cell09B">月</th>
			<th class="cell09C">日</th>
			({foreach from=$c_profile_list item=prof})
			({if $prof.name !== 'PNE_POINT'})
			<th rowspan="2">({$prof.caption})</th>
			({/if})
			({/foreach})
			<th class="cell16" rowspan="2">PC邮件地址</th>
			<th class="cell17" rowspan="2">手机邮件地址</th>
			<th class="cell18" rowspan="2">登录时邮件地址</th>
			<th class="cell18" rowspan="2">手机个体识别号码(加密完毕)</th>
			<th class="cell15" rowspan="2">ID</th>
		</tr>
		<tr>
			<th class="cell08" colspan="3">图像</th>
			<th class="cell09" colspan="3">出生年月日</th>
		</tr>
	</tfoot>
	<tbody>
		({foreach from=$c_member_list item=item})
		<tr id="userID({$item.c_member_id})">
			<td class="cell01">({if $item.c_member_id != 1})<input type="checkbox" name="c_member_ids[]" value="({$item.c_member_id})" />({else})&nbsp;({/if})</td>
			<td class="cell02A">({if $item.c_member_id != 1})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_member_confirm')})&amp;target_c_member_id=({$item.c_member_id})"><img src="modules/admin/img/icn_withdrawal.gif" alt="强制退会" /></a>({else})&nbsp;({/if})</td>
			<td class="cell02B"><a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('update_is_login_rejected','do')})&amp;target_c_member_id=({$item.c_member_id})&amp;sessid=({$PHPSESSID})">({if $item.is_login_rejected})<img src="modules/admin/img/icn_permit.gif" alt="登录停止解除" />({else})<img src="modules/admin/img/icn_rejected.gif" alt="登录停止" />({/if})</a></td>
			<td class="cell02C"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('passwd')})&amp;target_c_member_id=({$item.c_member_id})"><img src="modules/admin/img/icn_passwd.gif" alt="密码再发行" /></a></td>
			<td class="cell02D"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist_add')})&amp;easy_access_id=({$item.secure.easy_access_id})"><img src="modules/admin/img/icn_blacklist.gif" alt="添加黑名单" /></a></td>
			<td class="cell03">({$item.c_member_id})</td>
			({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
			<td class="cell19">({$item.username})</td>
			({/if})
			<td class="cell04"><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" target="_blank">({$item.nickname})</a></td>
			({if $smarty.const.OPENPNE_USE_POINT_RANK})
			<td class="cell10">({if !$smarty.const.OPENPNE_IS_POINT_ADMIN && $item.c_member_id == 1})-({else})({$item.c_rank.name})({/if})</td>
			<td class="cell11">({if !$smarty.const.OPENPNE_IS_POINT_ADMIN && $item.c_member_id == 1})-({else})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_point')})&amp;target_c_member_id=({$item.c_member_id})">({$item.profile.PNE_POINT.value|default:0})</a>({/if})</td>
			({/if})
			<td class="cell05">({if $item.access_date != '0000-00-00 00:00:00'})({$item.access_date|date_format:"%y-%m-%d %H:%M"})({else})未登录({/if})</td>
			<td class="cell06">({if $item.r_date != '0000-00-00 00:00:00'})({$item.r_date|date_format:"%y-%m-%d"})({else})&nbsp;({/if})</td>
			<td class="cell07">({if $item.c_member_id_invite})({$item.c_member_id_invite}):<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_invite})" target="_blank">({$item.c_member_invite.nickname})</a>({else})&nbsp;({/if})</td>
			<td class="cell08A">({if $item.image_filename_1})<a href="({t_img_url filename=$item.image_filename_1})" target="_blank"><img src="modules/admin/img/icn_image_on.gif" alt="有图像" /></a>({else})<img src="modules/admin/img/icn_image_off.gif" alt="无图像" />({/if})</td>
			<td class="cell08B">({if $item.image_filename_2})<a href="({t_img_url filename=$item.image_filename_2})" target="_blank"><img src="modules/admin/img/icn_image_on.gif" alt="有图像" /></a>({else})<img src="modules/admin/img/icn_image_off.gif" alt="无图像" />({/if})</td>
			<td class="cell08C">({if $item.image_filename_3})<a href="({t_img_url filename=$item.image_filename_3})" target="_blank"><img src="modules/admin/img/icn_image_on.gif" alt="有图像" /></a>({else})<img src="modules/admin/img/icn_image_off.gif" alt="无图像" />({/if})</td>
			<td class="cell09A">({if $item.birth_year})({$item.birth_year})({else})&nbsp;({/if})</td>
			<td class="cell09B">({if $item.birth_month})({$item.birth_month})({else})&nbsp;({/if})</td>
			<td class="cell09C">({if $item.birth_day})({$item.birth_day})({else})&nbsp;({/if})</td>
			({foreach from=$c_profile_list item=prof})
			({if $prof.name !== 'PNE_POINT'})
			<td>({strip})
			({if $prof.form_type == "checkbox"})
				({$item.profile[$prof.name].value|@t_implode:","|t_truncate:30})
			({else})
				({$item.profile[$prof.name].value|t_truncate:30})
			({/if})
			({/strip})</td>
			({/if})
			({/foreach})
			<td class="cell16">({if $item.secure.pc_address})<a href="mailto:({$item.secure.pc_address|escape:"hexentity"})">({$item.secure.pc_address|t_truncate:"30"|escape:"hexentity"})</a>({else})&nbsp;({/if})</td>
			<td class="cell17">({if $item.secure.ktai_address})<a href="mailto:({$item.secure.ktai_address})">({$item.secure.ktai_address|t_truncate:"30"})</a>({else})&nbsp;({/if})</td>
			<td class="cell18">({if $item.secure.regist_address})({$item.secure.regist_address})({else})&nbsp;({/if})</td>
			<td class="cell18">({if $item.secure.easy_access_id})({$item.secure.easy_access_id})({else})&nbsp;({/if})</td>
			<td class="cell15">({$item.c_member_id})</td>
		</tr>
		({/foreach})
	</tbody>
</table>
<div class="listControlBtm">
<div class="msgTransmit">
<p class="msgCheck"><img src="modules/admin/img/icn_msgtransmit.gif" alt="dummy" /><a href="#" onClick="return checkAll();" onKeyPress="return checkAll();">全部选择</a>&nbsp;|&nbsp;<a href="#" onClick="return clearAll();" onKeyPress="return clearAll();">全部取消</a></p>

<div class="msgTransmitBtn">
<input type="submit" id="btnSelTransmit" value="向选择的会员发送短信/邮件" />
</form>

<form action="./" method="post" name="formSendMessagesSearch">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
({if $cond})
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_search')})" />
({foreach from=$cond_list key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="hidden" name="cond" value="({$cond})" />
({else})
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_all')})" />
({/if})
<input type="submit" id="btnNarrowTransmit" value="符合条件的会员" />
</form>

<form action="./" method="post" name="formSendMessagesAll">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_all')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="submit" id="btnAllTransmit" value="向全体会员发送短信/邮件" />
</form>

<form action="./" method="get" name="formSendMessagesIDList">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_id_list')})">
<input type="submit" id="btnSelectUser" value="指定用户发送短信／邮件">
</form>

<form action="./" method="post" name="formSendMessagesHistory">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_history_list')})">
<input type="submit" id="btnHistoryMessage" value="发送短信/邮件履历">
</form>

</div>({*/div class="msgTransmitBtn"*})
</div>({*/div class="msgTransmit"*})


({if $pager})
<div class="listNavi">
<p class="listMove">
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">上一页</a>({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})&nbsp;|&nbsp;<strong>({$i})</strong>({else})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$i})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">({$i})</a>({/if})
({/foreach})
({if $pager.next_page})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">下一页</a>
({/if})
</p>
显示<p class="display">({$pager.total_num}) 人中的第 ({$pager.start_num}) - ({$pager.end_num})个人</p>
</div>({*/div class="listNaviBtm"*})

({/if})
</div>({*/div class="listControlBtm"*})

</div>({*/div class="userList"*})

<p class="caution">※密码、秘密提问的回答，因为使用不可逆的暗号化处理后保存到数据库中，无法知道原文字列。</p>
({$inc_footer|smarty:nodefaults})
