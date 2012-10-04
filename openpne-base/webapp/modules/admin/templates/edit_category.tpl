({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="`$WORD_COMMUNITY`分类设定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>({$WORD_COMMUNITY})分类设定</h2>
<p>（可根据SNS网站针对的人群和区域定位不同，进行类别细分）</p>
<div class="contents">
<table>
<tr>
<td class="middle">
<h3 class="item">中分类一览</h3>
<table class="basicType2">
<thead>
<tr class="smallCtgTable">
<th>类别</th>
<th>排列顺序<br />(升序))</th>
<th colspan="2">操作</th>
<th>小分类</th>	
</tr>
</thead>
<tbody>
({foreach from=$c_commu_category_parent_list item=item})
<tr>
<form action="./" method="post">
<td>({strip})
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_commu_category_parent','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_commu_category_parent_id" value="({$item.c_commu_category_parent_id})" />
<input class="basic" type="text" name="name" value="({$item.name})" size="20" />
({/strip})</td>
<td><input class="basic" type="text" name="sort_order" value="({$item.sort_order})" size="5" /></td>
<td><span class="textBtnS"><input type="submit" value="变更" /></span></td>
</form>
<form action="./" method="post">
<td>({strip})
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_commu_category_parent','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_commu_category_parent_id" value="({$item.c_commu_category_parent_id})" />
<span class="textBtnS"><input type="submit" value="删除" /></span>
({/strip})</td>
</form>
<td><a href="#opt_({$item.name})">一览</a></td>
</tr>
({/foreach})
<tr class="add">
<form action="./" method="post">
<td>({strip})
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_commu_category_parent','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input class="basic" type="text" name="name" value="" size="20" />
({/strip})</td>
<td><input class="basic" type="text" name="sort_order" value="" size="5" /></td>
<td colspan="3"><span class="textBtnS"><input type="submit" value="添加分类" /></span></td>
</form>
</tr>
</tbody>
</table>
</td>
<td class="small">
<h3 class="item">小分类一览</h3>
({foreach from=$c_commu_category_parent_list item=item})
<table class="basicType2">
<thead>
<tr class="smallCtgItem"><th colspan="4"><a name="opt_({$item.name})">({$item.name})</a></th></tr>
<tr class="smallCtgTable">
<th>项目名</th>
<th>排列顺序</th>
<th colspan="2">操作</th>	
</tr>
</thead>
<tbody>
({foreach from=$c_commu_category_list[$item.c_commu_category_parent_id] item=option})
<tr>
<form action="./" method="post">
<td>({strip})
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_commu_category','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_commu_category_id" value="({$option.c_commu_category_id})" />
<input class="basic" type="text" name="name" value="({$option.name})" size="20" />
({/strip})</td>
<td><input class="basic" type="text" name="sort_order" value="({$option.sort_order})" size="5" /></td>
<td><span class="textBtnS"><input type="submit" value="变更" /></span></td>
</form>
<form action="./" method="post">
<td>({strip})
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_commu_category','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_commu_category_id" value="({$option.c_commu_category_id})" />
<span class="textBtnS"><input type="submit" value="删除" /></span>
({/strip})</td>
</form>
</tr>
({/foreach})
<tr class="add">
<form action="./" method="post">
<td>({strip})
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_commu_category','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_commu_category_parent_id" value="({$item.c_commu_category_parent_id})" />
<input class="basic" type="text" name="name" value="" size="20" />
({/strip})</td>
<td><input class="basic" type="text" name="sort_order" value="" size="5" /></td>
<td colspan="2"><span class="textBtnS"><input type="submit" value="添加分类" /></span></td>
</form>
</tr>
</tbody>
</table>
({/foreach})
</td>
</tr>
</table>
({$inc_footer|smarty:nodefaults})
