({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminAdminConfig.tpl"})

({assign var="parent_page_name" value="账号管理"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_admin_user')})({/capture})

({assign var="page_name" value="账号追加"})
({ext_include file="inc_tree_adminAdminConfig.tpl"})
</div>

({*ここまで:navi*})


({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>账号追加</h2>
<div class="contents">

<p>可追加管理用账号。</p>
<p class="caution" id="c01">※密码请输入6～12半角英文数字</p>

<form action="./" method="post">
<table class="basicType1">
<tr>
<th>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_admin_user','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
用户名</th>
<td><input class="basic" type="text" name="username" value="" size="20" /></td>
</tr>
<tr>
<th>密码</th>
<td><input class="basic" type="password" name="password" value="" size="15" /></td>
</tr>
<tr>
<th>密码(确认)</th>
<td><input class="basic" type="password" name="password2" value="" size="15" /></td>
</tr>
<tr>
<th>权限</th>
<td><select class="basic" name="auth_type">
<option value="all">全权限</option>
<option value="">会员列表以外全部</option>
<option value="normal">只限于SNS设定</option>
</select></td>
</tr>
</table>
<p class="textBtn"><input type="submit" value="追加"></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_admin_user')})">返回账号管理</a></p>
({$inc_footer|smarty:nodefaults})
