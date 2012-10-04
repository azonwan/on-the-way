<div id="LayoutC">
<div id="Center">
<div class="dparts searchFormBox">
<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
<div>
	<div  align="center">
	以下好友还没登录成为你的朋友
	</div>
</div>
<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
</div>


<img src="./skin/dummy.gif" class="v_spacer_l">
<div class="dparts searchFormBox">
<b class="xtop"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b></b>
<div class="parts">
<div class="partsHeading"><h3>给选择的好友发送邀请函</h3></div>


<td style="width:318px;" class="bg_02" align="right" valign="middle">
	<form action="./" method="post">

<input type="hidden" name="m" value="pc">
<input type="hidden" name="a" value="page_h_member_search_invite">
	<input type="hidden" name="username" value="">
	<input type="hidden" name="password" value="">
	<input type="hidden" name="hostname" value="">
	</form>
	</td>


({t_form _method=post m=pc a=do_h_member_invite_firend})
<table border="0" cellspacing="2" cellpadding="0" style="width:636px;padding:5px;" class="border_01">
<tr>
	<td style="width:200px;" class="bg_05" align="left" valign="middle">
	<input type="submit" class="submit" value=给朋友发送邀请函>
	</td>
	<td class="bg_02" align="right" valign="middle">
	<input type="checkbox" id="selectall" onClick="selectedAll()">选择全部/取消全部
	</td>
</tr>
<tr>
	<td align="left" valign="top" colspan="2" style="padding:2px 0px 0px 0px;">
		<table style="width:100%;height:auto;" border="0" cellspacing="0" cellpadding="0" class="border_01">
		<tr><td align="left" valign="top">
			<div style="width:100%;height:250px;overflow:auto;">
			({foreach from=$members key=key item=item})
				<div class="dparts searchFormBox" style="float:left;width:280px;height:60px;padding:10px;">
					<table border="0" cellspacing="0" cellpadding="0" style="width:100%">
					<tr>
					<td style="width:30px">
						<input type="checkbox" name="friends[]" value="({$item.email})">
					</td>
					<td>
						<div>
						<span style="padding:5px;">({$item.name})</span><br>
						({$item.email})<br>
						</div>
					</td></tr>
					</table>
				</div>
			({/foreach})
			</div>
		</td>
		</tr>
		</table>
	</td>
</tr>
<tr>
<td>给选择的好友发送邀请函</td>

<td align="left">给朋友的短信</td>
</tr>
<tr>
	<td class="" align="center" colspan="2">
	<textarea class="text" name="body" rows="3" cols="95"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" class="bg_05 " align="left" valign="middle" style="padding:3px 0px 0px 0px;">
	<input type="hidden" name="sessid" value="({$PHPSESSID})">
	<input type="submit" class="submit" value=给朋友发送邀请函>
	</td>
</tr>
</table>
</form>

</div>
<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
</div>
<img src="./skin/dummy.gif" class="v_spacer_l">

<script language="javascript">
function selectedAll(){
	var flag = $('selectall').checked;
	var objs = document.getElementsByName('friends[]');
	for(i=0;i<objs.length;i++){
		objs[i].checked=flag;
	}
}
({if $members})
$('selectall').checked = true;
selectedAll();
({/if})
</script>

</div><!-- Center -->
</div><!-- LayoutC -->
