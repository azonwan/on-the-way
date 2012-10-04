({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="API设定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

<h2>API设定</h2>
<div class="contents">

({if $msg})<p class="actionMsg">({$msg})</p>({/if})

<p class="caution">
※许可IP邮件地址记录例<br>
10进制的IP邮件地址表述（1件）：XXX.XXX.XXX.XXX<br>
半角星号（认可来自从任何的服务的访问）：*<br>
API未使用：空
</p>


({if $pager && $pager.total_num > 0})
({capture name="pager"})
<div class="listControl">
<p class="display">
显示({$pager.total_num}) 件中的第 ({$pager.start_num}) - ({$pager.end_num})件
</p>
<p class="listMove">
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">向前</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">向后</a>
({/if})
</p>
</div>({*/div class="listControl"*})
({/capture})

({$smarty.capture.pager|smarty:nodefaults})
({/if})

<table class="basicType2">
<thead>
<tr>
<th>ID</th>
<th>API名称</th>
<th>许可IP地址</th>
</tr>
</thead>
<tbody>

({if $c_api_list})
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_api','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
({/if})

({foreach from=$c_api_list item=c_api})
<tr>
<th>({$c_api.c_api_id})</th>
<td>({$c_api.name})</td>

<input type="hidden" name="c_api_id[]" value="({$c_api.c_api_id})">
<input type="hidden" name="name[]" value="({$c_api.name})">

<td><input type="text" class="basic" name="ip[]" value="({$c_api.ip})" size="30"></td>

</tr>
({foreachelse})
<tr>
<td colspan="3">API不能被登录</td>
</tr>
({/foreach})

({if $c_api_list})
<tr>
<td colspan="3" align="right"><span class="textBtnS"><input type="submit" class="submit" value="　变　更　"></span></td>
</tr>
({/if})
</form>

</tbody>
</table>

({if $pager && $pager.total_num > 0})
({$smarty.capture.pager|smarty:nodefaults})
({/if})

({$inc_footer|smarty:nodefaults})
