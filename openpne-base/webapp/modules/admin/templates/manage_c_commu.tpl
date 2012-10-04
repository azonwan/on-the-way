({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="初期`$WORD_COMMUNITY`设定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})


<h2>初期({$WORD_COMMUNITY})设定</h2>
<div class="contents">

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<p class="info">用户注册登录时，可以让其自动参加以下所指定的圈子。</p>
<p class="caution" id="c01">输入想让其参加的圈子ID后，按「添加」按钮。</p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_commu_is_regist_join' ,'do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="value" value="1" />
<p class="add"><strong class="item">ID</strong>：<input class="basic" type="text" name="target_c_commu_id" value="({$requests.target_c_commu_id})" size="6" /><span class="textBtnS"><input type="submit" value="添加" /></span></p>
</form>
<table class="basicType2">
({capture name="table_header"})
<tr>
<th>ID</th>
<th>({$WORD_COMMUNITY})名</th>
<th>管理者名</th>
<th>操作</th>
</tr>
({/capture})
<thead>
({$smarty.capture.table_header|smarty:nodefaults})
</thead>
<tbody>
({foreach from=$c_commu_list item=item})
({if $item})
<tr>
<td class="cell01">({$item.c_commu_id})</td>
<td><a href="({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})" target="_blank">({$item.name})</a></td>
<td><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})" target="_blank">({$item.c_member_admin.nickname})</a></td>
<td><a href='?m=({$module_name})&amp;a=do_({$hash_tbl->hash('update_c_commu_is_regist_join','do')})&amp;target_c_commu_id=({$item.c_commu_id})&amp;value=0&amp;sessid=({$PHPSESSID})'>删除</a></td>
</tr>
({/if})
({foreachelse})
<tr>
<td colspan="4">({$WORD_COMMUNITY})此圈子不存在！</td>
</tr>
({/foreach})
</table>
({$inc_footer|smarty:nodefaults})
