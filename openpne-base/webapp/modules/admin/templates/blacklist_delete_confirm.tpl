({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="手机个体识别号码的黑名单删掉确认"})
({assign var="parent_page_name" value="黑名单管理 "})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>手机个体识别号码的黑名单删掉确认 </h2>
<div class="contents">

<p>删除以下的内容。确认吗？</p>
<p class="caution">※从黑名单里被删除的成员、登陆将不受到限制。</p>

<table class="basicType2">
<tbody>
<tr>
<th>个体识别手机号码(加密完毕)</th>
<td>({$blacklist.easy_access_id})</td>
</tr>
<tr>
<th>符合条件的成员</th>
<td>({if $blacklist.c_member_id})<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$blacklist.c_member_id})" target="_blank">({$blacklist.nickname})</a>({else})&nbsp;({/if})</td>
</tr>
<tr>
<th>备份</th>
<td width="250">({$blacklist.info|nl2br})</td>
</tr>
</tbody>
</table>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_blacklist','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target_c_blacklist_id" value="({$blacklist.c_blacklist_id})" />
<p class="textBtn"><input type="submit" class="submit" value="是" /></p>
</form>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('blacklist')})" />
<p class="textBtn"><input type="submit" class="submit" value="否" /></p>
</form>

({$inc_footer|smarty:nodefaults})
