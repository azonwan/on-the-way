({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="`$WORD_DIARY`删除确认"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>({$WORD_DIARY})删除确认</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p>真的要删除吗？</p>

<table class="basicType2">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
({$diary_comment.c_diary_comment_id})
</td>
</tr>
({****})
<tr>
<th>({$WORD_DIARY})标题</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_fh_diary})&amp;target_c_diary_id=({$diary_comment.c_diary_id})" target="_blank">({$diary_comment.subject})</a> (点评({$diary_comment.count_comments})件)
</td>
</tr>
({****})
<tr>
<th>作成者</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$diary_comment.c_member_id})" target="_blank">({$diary_comment.c_member.nickname})</a>
</td>
</tr>
({****})
<tr>
<th>作成日</th>
<td>
({$diary_comment.r_datetime})
</td>
</tr>
({****})
<tr>
<th>({$WORD_DIARY})评论内容</th>
<td width="500">
({if $diary_comment.image_filename_1 || $diary_comment.image_filename_2 || $diary_comment.image_filename_3})
<div>
({if $diary_comment.image_filename_1})<span class="padding_s"><a href="({t_img_url filename=$diary_comment.image_filename_1})" target="_blank"><img src="({t_img_url filename=$diary_comment.image_filename_1 w=120 h=120})"></a></span>({/if})
({if $diary_comment.image_filename_2})<span class="padding_s"><a href="({t_img_url filename=$diary_comment.image_filename_2})" target="_blank"><img src="({t_img_url filename=$diary_comment.image_filename_2 w=120 h=120})"></a></span>({/if})
({if $diary_comment.image_filename_3})<span class="padding_s"><a href="({t_img_url filename=$diary_comment.image_filename_3})" target="_blank"><img src="({t_img_url filename=$diary_comment.image_filename_3 w=120 h=120})"></a></span>({/if})
</div>
({/if})
({if $smarty.const.OPENPNE_ADMIN_CONVERT_URL})
({$diary_comment.body|nl2br|t_url2cmd:'diary':$diary_comment.$c_member_id|t_cmd:'diary'})
({else})
({$diary_comment.body|nl2br})
({/if})
</td>
</tr>
({****})
</tbody>
</table>

<form action="./" method="post">
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_diary_comment','do')})" />
<input type="hidden" name="target_c_diary_comment_id" value="({$diary_comment.c_diary_comment_id})" />
<span class="textBtnS"><input type="submit" value="删除" /></span>
</form>

({$inc_footer|smarty:nodefaults})
