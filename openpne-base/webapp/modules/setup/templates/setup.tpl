({ext_include file="inc_header.tpl"})

<p>务必完成下列设定后再进行安装</p>
<ul>
<li>setup/sql/xxx/install/install-2.12-create_tables.sql安装 </li>
<li>setup/sql/xxx/install/install-2.12-insert_data.sql 安装</li>
<li>config.php 设定</li>
</ul>
<p>一次安装后，无法显示这个页面。<br>
如果想重新安装，清空数据库后，再点击这个页面。</p>

({if $errors})
<ul class="caution">
({foreach from=$errors item=item})
<li>({$item})</li>
({/foreach})
</ul>
({/if})

({t_form m=setup a=do_setup})

<table>
<tr>
<th colspan="2">SNS名</th>
</tr>
<tr>
<th>SNS名</th>
<td><input type="text" name="SNS_NAME" value="({$requests.SNS_NAME})" size="30"></td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th colspan="2">初始用户</th>
</tr>
<tr>
<td colspan="2" style="background-color: #ffc">初始用户的注册信息设定<br>
个人信息和其他设定内容，请登录后设定。</td>
</tr>
<tr>
<th>PC电子邮件地址</th>
<td><input type="text" name="pc_address" value="({$requests.pc_address})" size="30"></td>
</tr>
({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
<tr>
<th>
注册ID
</th>
<td><input type="text" name="username" value="({$requests.username})" size="30"></td>
</tr>
({/if})
<tr>
<th>密码</th>
<td><input type="password" name="password" value="" size="15"></td>
</tr>
({if $smarty.const.OPENPNE_AUTH_MODE == 'email'})
<tr>
<th>密码（确认）</th>
<td><input type="password" name="password2" value="" size="15"></td>
</tr>
({/if})

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th colspan="2">管理用户</th>
</tr>
<tr>
<td colspan="2" style="background-color: #ffc">管理用户登录设定</td>
</tr>
<tr>
<th>管理用户名</th>
<td><input type="text" name="admin_username" value="({$requests.admin_username})" size="20"></td>
</tr>
<tr>
<th>管理用户密码</th>
<td><input type="password" name="admin_password" value="" size="15"></td>
</tr>
<tr>
<th>管理用户密码（确认）</th>
<td><input type="password" name="admin_password2" value="" size="15"></td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th>&nbsp;</th>
<td><input type="submit" value="安装"></td>
</tr>
</table>
</form>

({ext_include file="inc_footer.tpl"})
