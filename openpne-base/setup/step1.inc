<?php
$dir = OPENPNE_DIR."/var";
$msg=check_dir($dir);
?>
<form method="post">
<table>
<tr>
<th colspan="3">缓存(var)目录检测</th>
</tr>
<tr class="bg_01" align="center">
	<td width="60%">目录名称</td>
	<td width="20%">可读</td>
	<td width="20%">可写</td>
</tr>
<?php
foreach ($msg as $key => $value){
	echo "<tr bgcolor='#D7D7D7'>";
	echo "  <td>{$value['dir']}</td>";
	if($value['is_readable']){
		$is_readable+=1;
		echo "<td align='center'><img src='./skin/setup/checked.gif' border='0'></td>";
	}else{
		echo "<td align='center'><img src='./skin/setup/error.gif' border='0'></td>";
	}
	if($value['is_writeable']){
		$is_writeable+=1;
		echo "<td align='center'><img src='./skin/setup/checked.gif' border='0'></td>";
	}else{
		echo "<td align='center'><img src='./skin/setup/error.gif' border='0'></td>";
	}
	echo "</tr>";
}
?>
<tr><td colspan="3" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>
<tr><td colspan="3" align="left" style="background-color: #ffc">
共有目录及其子目录(<? echo count($msg); ?>)个，其中<? echo $is_readable; ?>个可读，<? echo $is_writeable; ?>个可写。<br>
<?php
if((count($msg)-$is_readable)>0 || (count($msg)-$is_writeable)>0){
	echo "<font color='red'>请将上面不可读写的目录改为可读写状态，然后继续安装。</font>";
}
?>
</td></tr>
<tr><td colspan="3" align="center">
<?php
if((count($msg)-$is_readable)>0 || (count($msg)-$is_writeable)>0){
	echo "<input type='hidden' name='m' value='page'>";
	echo "<input type='hidden' name='a' value='{$step}'>";
	echo "<input type='submit' value='重新检测'>";
}else{
	echo "<input type='hidden' name='m' value='do'>";
	echo "<input type='hidden' name='a' value='{$step}'>";
	echo "<input type='hidden' name='sessid' value='{$sessid}'>";
	echo "<input type='submit' value='下一步'>";
}
?>

</td></tr>
</table>
</form>
