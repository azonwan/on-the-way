({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="手机个体识别号码的黑名单追加确认"})
({assign var="parent_page_name" value="黑名单管理"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>手机个体识别号码的黑名单追加</h2>
<div class="contents">

<p>手机个体号码(加密完毕)请输入备份。</p>
<p>手机个体号码(加密完毕)<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member','page')})">成员名单</a>导出确认。</p>
<p class="caution">※被加入黑名单的成员登录受到限制。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('blacklist_add_confirm','page')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<table class="basicType2">
<tbody>
<tr>
<th>手机个体号码(加密完毕)</th>
<td><input name="easy_access_id" type="text" class="basic" value="({$requests.easy_access_id})" size="38" /></td>
</tr>
<tr>
<th>备份</th>
<td><textarea class="basic" name="info" cols="30" rows="3">({$requests.info})</textarea></td>
</tr>
</tbody>
</table>

<p class="textBtn"><input type="submit" class="submit" value="确认" /></p>
</form>

({$inc_footer|smarty:nodefaults})
