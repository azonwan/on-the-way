({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})

({assign var="parent_page_name" value="banner设定"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_banner')})({/capture})

({assign var="page_name" value="banner删除"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

<h2>banner删除</h2>
<div class="contents">

<p class="caution" id="c01"><strong>真的要删除吗？</strong></p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_banner','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_banner_id" value="({$requests.c_banner_id})" />
<p class="textBtn"><input type="submit" value="删除" /></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_banner')})">返回至banner设定</a></p>
({$inc_footer|smarty:nodefaults})
