<?php
if(file_exists(OPENPNE_DIR.'/config.php')){
	require_once(OPENPNE_DIR.'/config.php');
}else{
	$errors = "config.php文件生成失败，网站根目录不可写。";	
	openpne_display_error($errors);
	exit;
}
global $_OPENPNE_DSN_LIST;
require_once('OpenKakuSetupDB.php');
$db = new OpenKaku_DB_SETUP($_OPENPNE_DSN_LIST['main']['dsn']);

?>
<form method="post">

<table>
<tr>
<th colspan="2">安装数据库</th>
</tr>
<tr>
<th>数据库类型</th>
<td><select name="mysql_version" >
    <option value="mysql41" selected>MySQL 4.1</option>
    <option value="mysql41">MySQL 5(因sql文件和4.1通用，请选择4.1)</option>
  </select>
</td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<td colspan="2" align="center"><input type="hidden" name="m" value="do"><input type="hidden" name="a" value="<?php echo $step; ?>">
	<input type="hidden" name="sessid" value="<?php echo $sessid; ?>"><input type="submit" value="下一步"></td>
</tr>
</table>
</form>