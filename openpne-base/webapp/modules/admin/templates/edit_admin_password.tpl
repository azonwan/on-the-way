({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminAdminConfig.tpl"})

({assign var="page_name" value="密码变更"})
({ext_include file="inc_tree_adminAdminConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>密码变更</h2>
<div class="contents">
<p class="info">变更管理页面用的密码。</p>
<p class="caution" id="c01">※密码请用6～12位文字的半角英文数字写入。</p>
<form action="./" method="post">
<table class="basicType1">
<tr>
<th>
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_admin_user_password','do')})" />
现在的密码</th>
<td><input class="basic" type="password" name="old_password" value="" /></td>
</tr>
<tr>
<th>新密码</th>
<td><input class="basic" type="password" name="new_password" value="" /></td>
</tr>
<tr>
<th>新密码(确认)</th>
<td><input class="basic" type="password" name="new_password2" value="" /></td>
</tr>
</table>
<p class="textBtn"><input type="submit" value="变更"></p>
</form>

({$inc_footer|smarty:nodefaults})
