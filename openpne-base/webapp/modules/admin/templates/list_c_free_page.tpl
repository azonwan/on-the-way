({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})
({assign var="page_name" value="自由页面管理"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

<h2>增加新的SNS网页</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})
<p>可以直接编写任何html页面，并可利用此页面调用public_html/下的任何关联文件或CSS，形成站中站。</p>
<p class="caution">※「SNS认证：有」，表示这个自由页面，只有登陆本网站后，才有权查看。而“无”则不登陆也可查看。</p>
<p class="caution">※ 自由页面编辑完成后，选择（无）则顶部默认为网站退出时的图片。选择（有）则顶部默认为导航条。</p>

<h3 class="item">最近添加的自由页面目录</h3>

({if $pager && $pager.total_num > 0})
<div class="listControl" id="pager01">

({capture name="pager"})
<p class="display">
显示({$pager.total_num}) 件中的第 ({$pager.start_num}) - ({$pager.end_num})件
</p>
<p class="listMove">
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">上一页</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">下一页</a>
({/if})
</p>
({/capture})

({$smarty.capture.pager|smarty:nodefaults})

</div>
({/if})

<table class="basicType2">
<thead>
({****})
<tr>
<th>页面ID</th>
<th>页面标题</th>
<th>SNS认证</th>
<th>对象</th>
<th colspan="2">操作</th>
</tr>
({****})
</thead>
<tbody>
({****})
({foreach from=$c_free_page_list item=item})
({if $item})
<tr>
<td>({$item.c_free_page_id})</td>
<td><a href="({if $item.auth})({t_url _absolute=1 m=$item.type a=page_h_free_page})({else})({t_url _absolute=1 m=$item.type a=page_o_free_page})({/if})&amp;c_free_page_id=({$item.c_free_page_id})" target="_blank">({$item.title|default:"タイトルなし"})</a></td>
<td>({if $item.auth})有({else})无({/if})</td>
<td>({if $item.type == 'pc'})PC({else})手机({/if})</td>
<td><a href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_c_free_page','page')})&amp;c_free_page_id=({$item.c_free_page_id})'>编辑</a></td>
<td><a href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_free_page_confirm','page')})&amp;c_free_page_id=({$item.c_free_page_id})'>删除</a></td>
</tr>
({/if})
({foreachelse})
<tr>
<td colspan="6" class="empty">没有添加自由页面</td>
</tr>
({****})
({/foreach})
</tbody>
</table>

({if $pager && $pager.total_num > 0})
<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
</div>
({/if})


<h3 class="item">新增自由页面</h3>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_free_page','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<table class="basicType2">
<tbody>
<tr>
<th>页面标题</th>
<td><input class="basic" type="text" name="title" size="({$cols|default:72})" /></td>
</tr>
<tr>
<th>页面内容</th>
<td>
<textarea class="basic" name="body" cols="({$cols|default:72})" rows="({$rows|default:10})"></textarea>
</td>
</tr>
<tr>
<th>SNS认证</th>
<td>
<input class="basicRadio" type="radio" id="radio_auth_1" name="auth" value="1" checked="checked" /><label for="radio_auth_1">有</label>
<input class="basicRadio" type="radio" id="radio_auth_2" name="auth" value="0" /><label for="radio_auth_2">无</label>
</td>
</tr>
<tr>
<th>对象</th>
<td>
<input class="basicRadio" type="radio" id="radio_type_1" name="type" value="pc" checked="checked" /><label for="radio_type_1">PC</label>
<input class="basicRadio" type="radio" id="radio_type_2" name="type" value="ktai" /><label for="radio_type_2">手机</label>
</td>
</tr>
<tr>
<td colspan="2">
<p class="caution">※ 此页面也可作为外部登陆页面，在编辑html时，将SNS设定中的【登录表单】代码，插入在自由页面即可。</p>
<p class="textBtn"><input type="submit" class="submit" value="添加"></p>
</td>
</tr>
</tbody>
</table>

</form>

({$inc_footer|smarty:nodefaults})
