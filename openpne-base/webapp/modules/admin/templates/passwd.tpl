({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})

({assign var="parent_page_name" value="成员列表"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})({/capture})

({assign var="page_name" value="密码再发行"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})


({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>密码再发行</h2>
<div class="contents">

<p class="info"><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})" target="_blank">({$c_member.nickname})</a>密码变更。</p>
<ul class="caution">
<li>密码请输入6～12位的半角英文数字。</li>
<li>按密码变更按钮后,向用户发送含有新密码的邮件。</li>
</ul>

<form action="./" method="post">
<table>
<tr>
<th>
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('passwd','do')})" />
<input type="hidden" name="target_c_member_id" value="({$c_member.c_member_id})" />
新密码</th>
<td>：<input type="password" name="password" size="12" /></td>
</tr>
<tr>
<th>新密码(确认)</th>
<td>：<input type="password" name="password2" size="12" /></td>
</tr>
</table>
<p class="textBtn"><input type="submit" value="密码变更" /></p>
</form>

<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">返回至前页面</a></p>
({$inc_footer|smarty:nodefaults})
