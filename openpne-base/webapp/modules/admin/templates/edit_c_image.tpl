({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="图像上传・删除"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2 id="ttl01">图像上传・删除</h2>

<div class="contents">

<p class="caution" id="c01">※用相同的文件名时，如果存在已经登录的图像时，会替写原文件。</p>
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<dl>
<dt class="filename"><strong class="item">文件名</strong></dt>
<dd class="filename"><input type="text" class="basic" name="filename" value="" size="30" /></dd>
<dt class="upfile"><strong class="item">图像</strong></dt>
<dd class="upfile"><input type="file" name="upfile" /><span>（GIF・JPG・PNG形式）</span></dd>
</dl>
<p class="textBtn"><input type="submit" value="登录" /></p>
</form>

</div>({*/div class="contents"*})



<h2 id="ttl02">图像的显示・删除</h2>

<div class="contents">

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('edit_c_image')})" />
<dl>
<dt class="filename"><strong class="item">文件名</strong></dt>
<dd class="filename"><input type="text" class="basic" name="filename" value="({$requests.filename})" size="30" /></dd>
</dl>
<p class="textBtn"><input type="submit" value="显示" /></p>
</form>
({if $requests.filename})
({if $is_image})
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="filename" value="({$requests.filename})" />
<p class="delImg"><a href="({t_img_url filename=$requests.filename})" target="_blank"><img src="({t_img_url filename=$requests.filename w=120 h=120})"></a></p>
({if strpos($requests.filename, 'skin_') !== 0 && strpos($requests.filename, 'no_') !== 0})
<p class="textBtn"><input type="submit" value="删除此图片"></p>
({/if})
</form>
({else})
<p class="caution" id="c02"><strong>({$requests.filename})</strong>没有被登录。</p>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})">上传图像列表へ</a></p>
({/if})
({/if})
({$inc_footer|smarty:nodefaults})
