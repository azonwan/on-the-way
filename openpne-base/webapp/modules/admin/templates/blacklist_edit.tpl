({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="手机个体识别号码的黑名单编辑确认"})
({assign var="parent_page_name" value="黑名单管理"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist')})({/capture})

({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>编辑手机个体识别号码的黑名单</h2>
<div class="contents">

<p>手机个体识别号码(加密成功)请输入备份。</p>
<p>手机个体识别号码(加密成功)<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member','page')})">メンバーリスト</a>导出确认。</p>
<p class="caution">※被加入黑名单的成员，登录受到限制。。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('blacklist_edit_confirm','page')})" />
<input type="hidden" name="target_c_blacklist_id" value="({$blacklist.c_blacklist_id})" />

<table class="basicType2">
<tbody>
<tr>
<th>手机个体识别号码(加密成功)</th>
<td><input name="easy_access_id" type="text" class="basic" value="({$blacklist.easy_access_id})" size="38" /></td>
</tr>
<tr>
<th>符合条件的成员</th>
<td>({if $blacklist.c_member_id})<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$blacklist.c_member_id})" target="_blank">({$blacklist.nickname})</a>({else})&nbsp;({/if})</td>
</tr>
<tr>
<th>备份</th>
<td><textarea class="basic" name="info" cols="30" rows="3">({$blacklist.info})</textarea></td>
</tr>
</tbody>
</table>

<p class="textBtn"><input type="submit" class="submit" value="确认" /></p>
</form>

({$inc_footer|smarty:nodefaults})
