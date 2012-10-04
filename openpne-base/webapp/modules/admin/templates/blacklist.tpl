({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="黑名单管理"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>黑名单管理</h2>
<div class="contents">

<ul class="description">
    <li>是限制对被黑名单登记了的成员的SNS的登录的功能。</li>
    <li>手机个体识别号码(加密成功)黑名单登录。</li>
</ul>

<p id="itemAdd"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist_add','page')})">手机个体号码追加入黑名单</a></p>

({capture name="pager"})
<div class="listControl">
<p class="display">
({$total_num})件中 ({$start_num})-({$end_num})件目を表示しています
</p>
<p class="listMove">
({if $page_list})({foreach from=$page_list item=item})({if $page!=$item})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist','page')})&amp;page=({$item})">({$item})</a>({else})<b>({$item})</b>({/if})&nbsp;&nbsp;({/foreach})&nbsp;({/if})
({if $prev})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist','page')})&amp;page=({$page-1})">＜＜前</a>　({/if})
({if $next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist','page')})&amp;page=({$page+1})">次＞＞</a>({/if})
</p>
</div>
({/capture})

({if $c_blacklist_list})
<div class="listControl" id="pager01">
({$smarty.capture.pager|smarty:nodefaults})
</div>
({/if})

<table class="basicType2">
({capture name="table_header"})
<tr>
<th>ID</th>
<th>手机个体号码识别(加密完毕)</th>
<th>符合条件的成员</th>
<th>备份</th>
<th>操作</th>
</tr>
({/capture})
<thead>
({$smarty.capture.table_header|smarty:nodefaults})
</thead>
<tbody>
({foreach from=$c_blacklist_list item=item})
({if $item})
<tr>
<td class="cell01">({$item.c_blacklist_id})</td>
<td>({$item.easy_access_id})</td>
<td><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" target="_blank">({$item.nickname})</a></td>
<td>({$item.info|nl2br})</td>
<td>
<ul>
<li><a href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist_edit','page')})&amp;target_c_blacklist_id=({$item.c_blacklist_id})'>编辑</a></li>
<li><a href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist_delete_confirm','page')})&amp;target_c_blacklist_id=({$item.c_blacklist_id})'>从黑名单中删除</a></li>
</ul>
</td>
</tr>
({/if})
({foreachelse})
<tr>
<td colspan="5">没有登记黑名单</td>
</tr>
({/foreach})
</table>

({if $c_blacklist_list})
<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
</div>
({/if})

({$inc_footer|smarty:nodefaults})
