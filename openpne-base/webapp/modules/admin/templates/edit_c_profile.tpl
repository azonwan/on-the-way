({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="会员资料项目设定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>会员资料项目设定</h2>
<div class="contents">
<h3 class="item" id="ttl01">会员资料项目列表</h3>
<p id="itemAdd"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_c_profile')})">添加新的会员资料</a></p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_profile_sort_order','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<table class="basicType2" id="itemList">
<thead>
<tr>
<th colspan="2">操作</th>
<th>ID</th>
<th>项目名</th>
<th>识别名</th>
<th>必须</th>
<th>公开设定<br />变更可否</th>
<th>公开设定<br />默认値</th>
<th>表单类型</th>
<th>排列顺序<br />(升序)</th>
<th>分类</th>
<th>登录</th>
<th>变更</th>
<th>检索</th>
</tr>
</thead>
<tbody>
({capture name="nick"})
<tr class="default">
<td class="cell01A">&nbsp;</td>
<td class="cell01B">&nbsp;</td>
<td class="cell02">-</td>
<td class="cell03">昵称</td>
<td class="cell04">&nbsp;</td>
<td class="cell05">○</td>
<td class="cell06">×</td>
<td class="cell07">向全体公开</td>
<td class="cell08">文本框</td>
<td class="cell09"><input type="text" class="basic" name="sort_order_nick" size="5" value="({$smarty.const.SORT_ORDER_NICK})" /></td>
<td class="cell10">&nbsp;</td>
<td class="cell11">○</td>
<td class="cell12">○</td>
<td class="cell13">○</td>
</tr>
({/capture})
({capture name="birth"})
<tr class="default">
<td class="cell01A">&nbsp;</td>
<td class="cell01B">&nbsp;</td>
<td class="cell02">-</td>
<td class="cell03">出生年</td>
<td class="cell04">&nbsp;</td>
<td class="cell05">○</td>
<td class="cell06">○</td>
<td class="cell07">向全体公开</td>
<td class="cell08">文本框</td>
<td class="cell09" rowspan="2"><input type="text" class="basic" name="sort_order_birth" size="5" value="({$smarty.const.SORT_ORDER_BIRTH})" /></td>
<td class="cell10">&nbsp;</td>
<td class="cell11">○</td>
<td class="cell12">○</td>
<td class="cell13">○</td>
</tr>
<tr class="default">
<td class="cell01A">&nbsp;</td>
<td class="cell01B">&nbsp;</td>
<td class="cell02">-</td>
<td class="cell03">生日</td>
<td class="cell04">&nbsp;</td>
<td class="cell05">○</td>
<td class="cell06">×</td>
<td class="cell07">向全体公开</td>
<td class="cell08">单选(下拉框)</td>
<td class="cell09">&nbsp;</td>
<td class="cell11">○</td>
<td class="cell12">○</td>
<td class="cell13">○</td>
</tr>
({/capture})

({foreach name=prof from=$c_profile_list item=item})
({strip})

({if !$_cnt_nick && $item.sort_order >= $smarty.const.SORT_ORDER_NICK
  && !$_cnt_birth && $item.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
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

({if !$_cnt_nick && $item.sort_order >= $smarty.const.SORT_ORDER_NICK})
({counter assign="_cnt_nick"})
({$smarty.capture.nick|smarty:nodefaults})
({/if})

({if !$_cnt_birth && $item.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_birth"})
({$smarty.capture.birth|smarty:nodefaults})
({/if})

({/strip})
<tr>
<td class="cell01A"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_c_profile')})&amp;c_profile_id=({$item.c_profile_id})">变更</a></td>
<td class="cell01B"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_profile')})&amp;c_profile_id=({$item.c_profile_id})">删除</a></td>
<td class="cell02">({$item.c_profile_id})</td>
<td class="cell03">({$item.caption})</td>
<td class="cell04">({$item.name})</td>
<td class="cell05">({if $item.is_required})○({else})×({/if})</td>
<td class="cell06">({if $item.public_flag_edit})○({else})×({/if})</td>
<td class="cell07">({if $item.public_flag_default == 'private'})不公开({elseif $item.public_flag_default == 'friend'})对({$smarty.const.WORD_MY_FRIEND})公开({else})向全体公开({/if})</td>
<td class="cell08">({if $item.form_type == 'text'})文本框({elseif $item.form_type == 'textlong'})文本框(长)({elseif $item.form_type == 'textarea'})文本框(复数行)({elseif $item.form_type == 'select'})单选(下拉框)({elseif $item.form_type == 'radio'})单选(单选按钮)({elseif $item.form_type == 'checkbox'})复数選択(多选按钮)({/if})</td>
<td class="cell09">({$item.sort_order})</td>
<td class="cell10">({if $item.form_type == 'select' || $item.form_type == 'checkbox' || $item.form_type == 'radio'})<a href="#opt_({$item.name})">一览</a>({else})&nbsp;({/if})</td>
<td class="cell11">({if $item.disp_regist})○({else})×({/if})</td>
<td class="cell12">({if $item.disp_config})○({else})×({/if})</td>
<td class="cell13">({if $item.disp_search})○({else})×({/if})</td>
</tr>
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
<td colspan="9">&nbsp;</td>
<td class="cell09"><span class="textBtnS"><input type="submit" value="变更" /></span></td>
<td colspan="4">&nbsp;</td
></tr>
</table>
</form>

<h3 class="item" id="ttl02">个人资料项目分类一览</h3>
<ul class="caution" id="c01">
	<li>每次只能变更一个项目。</li>
	<li>如果删除选择肢，选择此选择肢的用户值(比如是必须项目)，必须清空。</li>
</ul>

({foreach from=$c_profile_list item=item})
({if $item.form_type == 'select' || $item.form_type == 'checkbox' || $item.form_type == 'radio'})

<h4><a name="opt_({$item.name})">({$item.caption})</a></h4>

<table class="basicType2">
<tr>
<th>ID</th>
<th>项目名</th>
<th>排列顺序</th>
<th colspan="2">操作</th>
</tr>
({foreach from=$item.options item=option})
<tr>
<form action="./" method="post">
<td>({$option.c_profile_option_id})</td>
<td>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_profile_option','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_profile_option_id" value="({$option.c_profile_option_id})" />
<input type="text" class="basic" name="value" value="({$option.value|smarty:nodefaults})" size="20" /></td>
<td><input type="text" class="basic" name="sort_order" value="({$option.sort_order})" size="5" /></td>
<td><span class="textBtnS"><input type="submit" value="变更" /></span></td>
</form>
<form action="./" method="post">
<td>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_profile_option','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_profile_option_id" value="({$option.c_profile_option_id})" />
<span class="textBtnS"><input type="submit" value="删除" /></span>
</td>
</form>
</tr>
({/foreach})
<tr>
<form action="./" method="post">
<td>-</td>
<td>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_profile_option','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_profile_id" value="({$item.c_profile_id})" />
<input type="text" class="basic" name="value" value="" size="20" /></td>
<td><input type="text" class="basic" name="sort_order" value="" size="5" /></td>
<td colspan="2"><span class="textBtnS"><input type="submit" value="添加项目分类" /></span></td>
</form>
</tr>
</table>

({/if})
({/foreach})

({$inc_footer|smarty:nodefaults})
