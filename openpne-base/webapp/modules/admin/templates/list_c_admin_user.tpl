({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminAdminConfig.tpl"})

({assign var="page_name" value="账号管理"})
({ext_include file="inc_tree_adminAdminConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>账号管理</h2>
<div class="contents">
<p class="info">设定管理页面用的账号。</p>
<p class="add"><strong class="item"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_c_admin_user')})">追加账号</a></strong></p>

<form action="./" method="post" name="formSendMessages">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<table class="basicType2">
({capture name="table_header"})
<tr>
<th>ID</th>
<th>用户名</th>
<th>权限</th>
<th>操作</th>
</tr>
({/capture})
<thead>
({$smarty.capture.table_header|smarty:nodefaults})
</thead>
<tbody>
({foreach from=$user_list item=item})
<tr id="userID({$item.c_admin_user_id})">
<td class="cell01">({$item.c_admin_user_id})</td>
<td>({$item.username})</td>
<td>
({if $item.auth_type=='all'})
<option value="all">全权限</option>
({elseif $item.auth_type==''})
<option value="">成员列表以外全部</option>
({elseif $item.auth_type=='normal'})
<option value="normal">只限于SNS设定</option>
({/if})
</td>
<td>({if $item.c_admin_user_id != 1})<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_c_admin_user','do')})&amp;target_id=({$item.c_admin_user_id})&amp;sessid=({$PHPSESSID})">删除</a>({else})&nbsp;({/if})</td>
</tr>
({/foreach})
</tbody>
</table>


<p class="add">该权限可以使用以下的功能。</p>

<table class="basicType2">
<thead>
<tr>
<th>項目</th>
<th width="150">全权限</th>
<th width="150">「成员名单关联部分」<br />
以外所有</th>
<th width="150">「成员名单关联部分」<br />
「SNS内数据浏览部分」<br />
以外所有</th>
</tr>
</thead>
<tbody>
<tr>
<th>成员管理</th>
<td>○</td>
<td>× 成员名单<br />
○ 发送邀请函<br />
× CSV下载<br />
○ CSV入口<br />
× 黑名单管理</td>
<td>×</td>
</tr>
<tr>
<th>图像・上传管理</th>
<td>○</td>
<td>○</td>
<td>×</td>
</tr>
<tr>
<th>统计情报</th>
<td>○</td>
<td>○</td>
<td>×</td>
</tr>
<tr>
<th>设计</th>
<td>○</td>
<td>○</td>
<td>○</td>
</tr>
<tr>
<th>SNS设定</th>
<td>○</td>
<td>○</td>
<td>○</td>
</tr>
<tr>
<th>扩展功能</th>
<td>○</td>
<td>○</td>
<td>○</td>
</tr>
<tr>
<th>管理画面设定</th>
<td>○</td>
<td>× 帐号管理<br />
○ 密码变更<br />
× 随机生成密码</td>
<td>× 账号管理<br />
○ 密码变更<br />
× 随即生成密码</td>
</tr>
</tbody>
</table>

({$inc_footer|smarty:nodefaults})
