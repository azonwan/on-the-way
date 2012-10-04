({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="parent_page_name" value="等级设定"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})({/capture})

({assign var="page_name" value="等级删除确认"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})
<h2>头衔等级删除确认</h2>
<div class="contents">

<table class="basicType2">
<tbody>
<tr>
<th>ID</th>
<td>({$c_rank.c_rank_id})</td>
</tr>
<tr>
<th>头衔名</th>
<td>({$c_rank.name})</td>
</tr>
<tr>
<th>图像</th>
<td><a href="({t_img_url filename=$c_rank.image_filename})" target="_blank"><img src="({t_img_url filename=$c_rank.image_filename w=180 h=180})"></a></td>
</tr>
<tr>
<th>达到点数</th>
<td>({$c_rank.point})</td>
</tr>
</tbody>
</table>

<p>果真要删除吗？</p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_rank','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_rank_id" value="({$c_rank.c_rank_id})">
<p class="textBtn"><input type="submit" value="是 ">　<input type="button" value=" 否 " onClick="location.href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})'"></p>
</form>


({$inc_footer|smarty:nodefaults})
