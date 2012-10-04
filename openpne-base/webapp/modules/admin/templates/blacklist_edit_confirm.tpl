({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="手机个体识别号码的黑名单编辑确认"})
({assign var="parent_page_name" value="黑名单管理"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>手机个体识别号码的黑名单编辑确认 </h2>
<div class="contents">

<p>编辑以下的内容。确认吗？</p>
<p class="caution">※被加入黑名单的成员，登录受到限制。</p>

<table class="basicType2">
<tbody>
<tr>
<th>手机个体识别号码(加密成功)</th>
<td>({$easy_access_id})</td>
</tr>
<tr>
<th>符合条件的成员</th>
<td>({if $member})<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$member.c_member_id})" target="_blank">({$member.nickname})</a>({else})&nbsp;({/if})</td>
</tr>
<tr>
<th>备份</th>
<td width="250">({$info|nl2br})</td>
</tr>
</tbody>
</table>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_blacklist','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target_c_blacklist_id" value="({$target_c_blacklist_id})" />
<input type="hidden" name="easy_access_id" value="({$easy_access_id})" />
<input type="hidden" name="info" value="({$info})" />
<p class="textBtn"><input type="submit" class="submit" value="是" /></p>
</form>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('blacklist_edit')})" />
<input type="hidden" name="target_c_blacklist_id" value="({$target_c_blacklist_id})" />
<input type="hidden" name="easy_access_id" value="({$easy_access_id})" />
<input type="hidden" name="info" value="({$info})" />
<p class="textBtn"><input type="submit" class="submit" value="不是" /></p>
</form>

({$inc_footer|smarty:nodefaults})
