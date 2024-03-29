({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})

({assign var="page_name" value="banner设定 ＞ banner变更"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_banner')})({/capture})

({assign var="page_name" value="banner变更"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>banner修改</h2>
<div class="contents">

<form action="./" method="post" enctype="multipart/form-data">
<table class="basicType2">
<tr>
<th>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_banner','do')})" />
<input type="hidden" name="c_banner_id" value="({$c_banner.c_banner_id})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
图像</th>
<td>
<a href="({t_img_url filename=$c_banner.image_filename})" target="_blank"><img src="({t_img_url filename=$c_banner.image_filename w=180 h=180})" /></a><br />
<input type="file" name="upfile" /></td>
</tr>
<tr>
<th>
链接源</th>
<td><input type="text" class="basic" name="a_href" value="({$c_banner.a_href})" size="40" /></td>
</tr>
<tr>
<th>显示位置</th>
<td>
<select class="basic" name="type">
<option value="TOP"({if $c_banner.type=="TOP"}) selected="selected"({/if})>顶部</option>
<option value="SIDE"({if $c_banner.type=="SIDE"}) selected="selected"({/if})>侧面</option>
</select>
</td>
</tr>
<tr>
<th>banner名</th>
<td><input type="text" class="basic" name="nickname" value="({$c_banner.nickname})" size="20" /></td>
</tr>
<tr>
<th>显示设定（登录前）</th>
<td>
<select class="basic" name="is_hidden_before">
<option value="0"({if !$c_banner.is_hidden_before}) selected="selected"({/if})>显示</option>
<option value="1"({if $c_banner.is_hidden_before}) selected="selected"({/if})>不显示</option>
</select>
</tr>
<tr>
<th>显示设定（登录后）</th>
<td>
<select class="basic" name="is_hidden_after">
<option value="0"({if !$c_banner.is_hidden_after}) selected="selected"({/if})>显示</option>
<option value="1"({if $c_banner.is_hidden_after}) selected="selected"({/if})>不显示</option>
</select>
</tr>
</table>
<p class="textBtn"><input type="submit" value="更改" /></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_banner')})">返回至banner设定</a></p>

({$inc_footer|smarty:nodefaults})
