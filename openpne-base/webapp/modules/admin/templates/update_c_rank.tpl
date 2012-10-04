({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="parent_page_name" value="等级设定"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})({/capture})

({assign var="page_name" value="等级编辑"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

<h2>等级编辑</h2>
<div class="contents">
({if $msg})<p class="actionMsg">({$msg})</p>({/if})

<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_rank','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_rank_id" value="({$c_rank.c_rank_id})">

<table class="basicType2">
<tbody>
<tr>
<th>ID</th>
<td>({$c_rank.c_rank_id})</td>
</tr>
<tr>
<th>项目名</th>
<td><input type="text" class="basic" name="name" value="({$c_rank.name})" size="20"></td>
</tr>
<tr>
<th>图像</th>
<td><a href="({t_img_url filename=$c_rank.image_filename})" target="_blank"><img src="({t_img_url filename=$c_rank.image_filename w=180 h=180})"></a><br>
<div><input type="file" name="image_upfile" size="20"></div></td>
</tr>
<tr>
<th>到达点数</th>
<td><input type="text" class="basic" name="point" value="({$c_rank.point})" size="20"></td>
</tr>
</tbody>
</table>

<p>要变更吗？</p>

<p class="textBtn"><input type="submit" value=" 确定 ">　<input type="button" value=" 取消 " onClick="location.href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})'"></p>
</form>

({$inc_footer|smarty:nodefaults})
