({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="积分*头衔点数设定列表"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>会员积分・增减点数设置</h2>
<div class="contents">

<h3 class="item">点数设置</h3>
<p>每项积分设定后，需要点击【变更】后才会生效。</p>

<table class="basicType2">
<thead>
<tr>
<th>ID</th>
<th>可获得积分的项目名称</th>
<th>点数设置</th>
<th>操作</th>
</tr>
</thead>
<tbody>
({foreach from=$c_action_list item=c_action})
<tr>
<th>({$c_action.c_action_id})</th>
<td>({$c_action.name})</td>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_action','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_action_id" value="({$c_action.c_action_id})" />
<td><input type="text" class="basic" name="point" value="({$c_action.point})" size="10" /></td>
<td><span class="textBtnS"><input type="submit" class="submit" value="变更"></span></td>
</form>

</tr>
({foreachelse})
<tr>
<td colspan="4">设置没有生效</td>
</tr>
({/foreach})
</tbody>
</table>


<h3 class="item">头衔设定</h3>
<p>到达一定积分点数后即可获得相应等级的头衔。</p>

<table class="basicType2">
<thead>
<tr>
<th>ID</th>
<th>头衔名</th>
<th>图像</th>
<th>到达点数</th>
<th colspan="2">操作</th>
</tr>
</thead>
<tbody>
({foreach from=$c_rank_list item=c_rank})
<tr>
<th>({$c_rank.c_rank_id})</th>
<td>({$c_rank.name})</td>
<td  align="center"><a href="({t_img_url filename=$c_rank.image_filename})" target="_blank"><img src="({t_img_url filename=$c_rank.image_filename w=180 h=180})"></a></td>
<td>({$c_rank.point})</td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_c_rank')})&amp;c_rank_id=({$c_rank.c_rank_id})">变更</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_rank_confirm')})&amp;c_rank_id=({$c_rank.c_rank_id})">删除</a></td>
</tr>
({foreachelse})
<tr>
<td colspan="6">头衔设置不成功，请检查是否操作错误。</td>
</tr>
({/foreach})
<tr>
<form action="./" method="post" enctype="multipart/form-data">
<td>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_rank','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
</td>
<td><input type="text" class="basic" name="name" value="" size="5" /></td>
<td><input type="file" name="image_upfile" value="" size="20" /></td>
<td><input type="text" class="basic" name="point" value="" size="5" /></td>
<td colspan="2"><span class="textBtnS"><input type="submit" class="submit" value="添加新的头衔" /></span></td>
</form>
</tr>
</tbody>
</table>

({$inc_footer|smarty:nodefaults})