({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="相片管理"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>({$page_name})</h2>

<div class="contents">

<div id="searchForm">
<h4>照片ID检索</h4>
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('edit_album_image_list','page')})" />
<input class="basic" type="text" name="target_c_album_id" value="({$target_c_album_id})" />
<span class="textBtnS"><input type="submit" value="检索" /></span>
</form>

<h4>相册ID检索</h4>
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('edit_album_image_list','page')})" />
<input class="basic" type="text" name="target_c_album_image_id" value="({$target_c_album_image_id})" />
<span class="textBtnS"><input type="submit" value="检索" /></span>
</form>
</div>

({if !$album_image_list})
<p id="noAlbum">没有符合条件的相册</p>
({else})
({capture name="pager"})
<div class="listControl">
<p class="display">
显示({$pager.total_num}) 件中的 ({$pager.start_num}) - ({$pager.end_num})件
</p>
<p class="listMove">
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})<strong>({$i})</strong>({else})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_image_list','page')})&amp;page=({$i})&amp;target_c_album_image_id=({$target_c_album_image_id})&amp;target_c_album_id=({$target_c_album_id})">({$i})</a>({/if})
({/foreach})
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_image_list','page')})&amp;page=({$pager.prev_page})&amp;target_c_album_image_id=({$target_c_album_image_id})&amp;target_c_album_id=({$target_c_album_id})">＜＜前</a>({/if})
({if $pager.next_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_image_list','page')})&amp;page=({$pager.next_page})&amp;target_c_album_image_id=({$target_c_album_image_id})&amp;target_c_album_id=({$target_c_album_id})">后＞＞</a>({/if})
</p>
</div>
({/capture})

<div class="listControl" id="pager01">
({$smarty.capture.pager|smarty:nodefaults})
</div>

({foreach from=$album_image_list item=item})
<table class="basicType2 album">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
({$item.c_album_image_id})
</td>
</tr>
({****})
<tr>
<th>照片</th>
<td>
<img src="({if $item.image_filename})({t_img_url filename=$item.image_filename w=120 h=120})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})">
</td>
</tr>
({****})
<tr>
<th>说明</th>
<td class="textbody">
({$item.image_description|nl2br})
</td>
</tr>
({****})
<tr>
<th>发表日期</th>
<td>
({$item.r_datetime})
</td>
</tr>
({****})
<tr>
<th>相册</th>
<td>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_list','page')})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject})</a>
</td>
</tr>
({****})
<tr>
<td class="formbutton" colspan="2">
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_album_image_confirm')})" />
<input type="hidden" name="target_c_album_image_id" value="({$item.c_album_image_id})" />
<span class="textBtnS"><input type="submit" value="删除" /></span>
</form>
</td>
</tr>
</tbody>
</table>
({/foreach})

<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
</div>
({/if})

({$inc_footer|smarty:nodefaults})
