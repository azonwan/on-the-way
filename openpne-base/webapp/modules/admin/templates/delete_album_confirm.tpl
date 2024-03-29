({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="删除`$WORD_DIARY`"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>确认删除({$WORD_DIARY})</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p>真的要删除吗？</p>

<table class="basicType2 album">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
({$album.c_album_id})
</td>
</tr>
({****})
<tr>
<th>标题</th> 
<td>
<a href="({t_url _absolute=1 m=pc a=page_fh_album})&amp;target_c_album_id=({$album.c_album_id})" target="_blank">({$album.subject})</a>
</td>
</tr>
({****})
<tr>
<th>作者</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$album.c_member_id})" target="_blank">({$album.c_member.nickname})</a>
</td>
</tr>
({****})
<tr>
<th>相册说明</th>
<td class="textbody">
({$album.description|nl2br})
</td>
</tr>
({****})
<tr>
<th>封面</th>
<td>
<img src="({if $album.album_cover_image})({t_img_url filename=$album.album_cover_image w=120 h=120})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})">
</td>
</tr>
({****})
<tr>
<th>公开范围</th>
<td>
({if $album.public_flag == "public"})
全体公开
({elseif $album.public_flag == "friend"})
只对({$WORD_MY_FRIEND})公开
({elseif $album.public_flag == "private"})
不公开
({/if})
</td>
</tr>
({****})
<tr>
<th>发表日期</th>
<td>
({$album.r_datetime})
</td>
</tr>
({****})
</tbody>
</table>

<form action="./" method="post">
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_album','do')})" />
<input type="hidden" name="target_c_album_id" value="({$album.c_album_id})" />
<span class="textBtnS"><input type="submit" value="删除" /></span>
</form>

({$inc_footer|smarty:nodefaults})
