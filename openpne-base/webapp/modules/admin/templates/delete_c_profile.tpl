({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="删除个人资料项目"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

<h2>个人资料项目删除</h2>
<div class="contents">

<p class="caution" id="c01"><strong>真的要删除吗？</strong><br />※针对此项目的输入值也会消失。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_profile','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_profile_id" value="({$requests.c_profile_id})" />
<p class="textBtn"><input type="submit" value="删除" /></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})">返回个人资料项目设定</a></p>
({$inc_footer|smarty:nodefaults})
