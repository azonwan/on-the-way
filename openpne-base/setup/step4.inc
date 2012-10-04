<?php
global $msg;
?>

<table>
<tr>
<th colspan="2">导入表及其数据</th>
</tr>
<tr class="bg_01" align="center">
	<td width="70%">表名</td>
	<td width="30%">状态</td>
</tr>
<?php
foreach ($msg as $key => $value){
	echo "<tr bgcolor='#D7D7D7'>";
	echo "  <td>{$value['table']}</td>";
	if($value['create_ok']){
		$create_ok += 1;
		echo "<td align='center'><img src='./skin/setup/checked.gif' border='0'></td>";
	}else{
		echo "<td align='center'><img src='./skin/setup/error.gif' border='0'></td>";
	}
	echo "</tr>";
}
?>
<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>
<?php
if(count($msg)>$create_ok){
?>
<tr>
<td colspan="2" align="center">
	<form method="post">
	<input type="hidden" name="m" value="page">
	<input type="hidden" name="a" value="step3">
	<input type="submit" value="上一步">
	</form>
</td>
</tr>
<?php
}else{
?>
<tr>
<td colspan="2" align="center"><input type="button" value="下一步" onclick="window.location.href='<?php echo OPENPNE_URL;?>'"></td>
</tr>
<?php
}
?>
</table>