({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminAdminConfig.tpl"})

({assign var="page_name" value="页面名随即生成"})
({ext_include file="inc_tree_adminAdminConfig.tpl"})
</div>

({*ここまで:navi*})

<h2>页面名随即生成</h2>
<div class="contents">
<p class="info">为了让管理页面的页面名无法推测，使用随即文字进行置换</p>
<ul class="caution" id="c01">
	<li>页面名已经为随即文字列时，会再度生成随即文字列，用其他文字进行置换。</li>
	<li>想把随即生成的页面名返回至初期状态时，请按「初始化页面名」按钮。</li>
</ul>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_hash_table','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<p class="textBtn"><input type="submit" value="随机生成"></p>
</form>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_hash_table','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<p class="textBtnS" id="reset"><input type="submit" value="初始化页面名"></p>
</form>
({$inc_footer|smarty:nodefaults})
