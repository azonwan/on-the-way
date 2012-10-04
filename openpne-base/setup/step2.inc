<?php
global $_OPENPNE_DSN_LIST;
$temp = $_OPENPNE_DSN_LIST['main']['dsn'];
$config = array(
	'domain'   => defined('OPENPNE_URL')? OPENPNE_URL:"http://".$_SERVER['HTTP_HOST']."/",
	'encrypt'  => defined('ENCRYPT_KEY')? ENCRYPT_KEY:'openpneorgcn',
    'phptype'  => empty($temp['phptype'])?'mysql':$temp['phptype'],
    'username' => empty($temp['username'])?'root':$temp['username'],
    'password' => empty($temp['password'])?'':$temp['password'],
    'hostspec' => empty($temp['hostspec'])?'localhost':$temp['hostspec'],
    'database' => empty($temp['database'])?'openpne_org_cn':$temp['database'],
);

if(!empty($errors)){
?>
<table>
<tr>
<th >错误信息</th>
</tr>
<tr>
<td style="background-color: #ffc"><? echo $errors; ?></td>
</tr>
</table>
<br>
<?php
}
?>
<form method="post">

<table>
<tr>
<th colspan="2">网站设置</th>
</tr>
<tr>
<th>网站域名</th>
<td><input type="text" name="domain" value="<? echo $config['domain']; ?>" size="30"></td>
</tr>
<tr>
<th>网站密匙</th>
<td><input type="text" name="encrype" value="<? echo $config['encrypt']; ?>" size="30"></td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th colspan="2">数据库设置</th>
</tr>
<tr>
<th>数据库类型</th>
<td><input type="hidden" name="phptype" value="mysql">MySQL
  <!--<select name="phptype" >
    <option value="mysql" selected>MySQL</option>
    <option value="mssql">SQL Server</option>
    <option value="oci8">Oracle 8i</option>
  </select>
  -->
  </td>
</tr>
<tr>
<th>数据库地址</th>
<td><input type="text" name="hostspec" value="<? echo $config['hostspec']; ?>" size="20"></td>
</tr>
<tr>
<th>数据库名</th>
<td><input type="text" name="database" value="<? echo $config['database']; ?>" size="20"></td>
</tr>
<tr>
<th>用户名</th>
<td><input type="text" name="username" value="<? echo $config['username']; ?>" size="20"></td>
</tr>
<tr>
<th>密码</th>
<td><input type="password" name="password" value="" size="20"></td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<td colspan="2" align="center"><input type="hidden" name="m" value="do"><input type="hidden" name="a" value="<?php echo $step; ?>">
	<input type="hidden" name="sessid" value="<?php echo $sessid; ?>"><input type="submit" value="下一步"></td>
</tr>
</table>
</form>