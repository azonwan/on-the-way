({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="parent_page_name" value="上传图像列表"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_image')})({/capture})
({assign var="page_name" value="图像删除确认"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2 id="ttl01">图像删除确认</h2>
<div class="contents">
<p class="caution" id="c01">真的要删除吗?</p>
<p id="userImg"><a href="({t_img_url filename=$c_image.filename})" target="_blank"><img src="({t_img_url filename=$c_image.filename w=120 h=120})" /></a></p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_image4c_image_id','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target_c_image_id" value="({$requests.target_c_image_id})" />
<p class="textBtn"><input type="submit" value="删除" /></p>
</form>
<p class="caution" id="c02"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">返回上传图像列表</a></p>

({$inc_footer|smarty:nodefaults})
