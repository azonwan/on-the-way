({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})

({assign var="page_name" value="HTML插入"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

<h2>HTML插入</h2>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
<tr>
<td class="menu">

<dl>
<dt><strong class="item">页面底部</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_page_footer_before">登录前底部</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_page_footer_after">登录后底部</a></li>
</ul>
</dd>
<dt><strong class="item">PC版全页面共通</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_html_head">HTML插入(HTML head内)</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_page_top2">HTML插入&nbsp;A</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_page_top">HTML插入&nbsp;B</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_page_bottom2">HTML插入&nbsp;C</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_page_bottom">HTML插入&nbsp;D</a></li>
</ul>
</dd>
<dt><strong class="item">手机版全页面共通</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_ktai_html_head">HTML插入(HTML head内)</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_ktai_header">HTML插入(页面上部)</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})&amp;target=inc_ktai_footer">HTML插入(页面下部)</a></li>
</ul>
</dd>
</dl>

</td>
<td class="detail">
<h3>
({if $title == 'inc_page_footer_before'})
登录前页面底部
({elseif $title == 'inc_page_footer_after'})
登录後页面底部
({elseif $title == 'inc_html_head'})
【PC版】HTML插入(HTML head内)
({elseif $title == 'inc_page_top2'})
【PC版】HTML插入 A
({elseif $title == 'inc_page_top'})
【PC版】HTML插入 B　（旧：【PC版】HTML插入(页面上部)）
({elseif $title == 'inc_page_bottom2'})
【PC版】HTML插入 C
({elseif $title == 'inc_page_bottom'})
【PC版】HTML插入 D　（旧：【PC版】HTML插入(页面下部)）
({elseif $title == 'inc_ktai_html_head'})
【手机】HTML插入(HTML head内)
({elseif $title == 'inc_ktai_header'})
【手机】HTML插入(页面上部)
({elseif $title == 'inc_ktai_footer'})
【手机】HTML插入(页面下部)
({/if})
</h3>
({if $msg})<p class="actionMsg">({$msg})</p>({/if})
({if $requests.target == 'sns_kiyaku' || $requests.target == 'sns_privacy'})
<p class="caution" id="c01">※HTML标记<strong>不能使用</strong>，URL被连接。</p>
({elseif $requests.target == 'daily_news_head' || $requests.target == 'daily_news_foot'})
({else})
<p class="caution" id="c01">※HTML标记被使用时，请注意，如果忘记关闭html标记，可能会引起显示错位。</p>
({/if})

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_html','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target" value="({$title})" />
<textarea name="body" cols="({$cols|default:60})" rows="({$rows|default:10})">({$c_siteadmin.body|smarty:nodefaults})</textarea>
<p class="textBtn"><input type="submit" value="　变更　" /></p>
</form>

<h4>模版插入地点对应图[({if $title == 'inc_page_footer_before'})
登录前页面底部
({elseif $title == 'inc_page_footer_after'})
登录後页面底部
({elseif $title == 'inc_html_head'})
【PC版】HTML插入(HTML head内)
({elseif $title == 'inc_page_top2'})
【PC版】HTML插入 A
({elseif $title == 'inc_page_top'})
【PC版】HTML插入 B　（旧：【PC版】HTML插入(页面上部)）
({elseif $title == 'inc_page_bottom2'})
【PC版】HTML插入 C
({elseif $title == 'inc_page_bottom'})
【PC版】HTML插入 D　（旧：【PC版】HTML插入(页面下部)）
({elseif $title == 'inc_ktai_html_head'})
【手机】HTML插入(HTML head内)
({elseif $title == 'inc_ktai_header'})
【手机】HTML插入(页面上部)
({elseif $title == 'inc_ktai_footer'})
【手机】HTML插入(页面下部)
({/if})]</h4>
({if $requests.target == 'inc_page_top2' || $requests.target == 'inc_page_top' || $requests.target == 'inc_page_bottom2' || $requests.target == 'inc_page_bottom'})
<p class="caution" id="c02">※内容为空时，HTML插入部分不能显示，在各HTML插入部分段，该空隙处不能出现在浏览器内框。</p>

<p class="image">
<img src="modules/admin/img/insert_HTML.gif" />
</p>
({elseif $title == 'inc_page_footer_before'})
<p class="caution" id="c02">※图示说明</p>

<p class="image">
<img src="modules/admin/img/insert_HTML_footer_before.gif" />
</p>
({elseif $title == 'inc_page_footer_after'})
<p class="image">
<img src="modules/admin/img/insert_HTML_footer.gif" />
</p>
({elseif $title == 'inc_html_head' || $title == 'inc_ktai_html_head'})
<p class="caution" id="c02">※因为HEAD标记内被配置，没有外观上插入的点。</p>

({elseif $title == 'inc_ktai_header' || $title == 'inc_ktai_footer'})
<p class="image">
<img src="modules/admin/img/insert_HTML_k-tai.gif" />
</p>

({/if})

</td>
</tr>
</table>

<div class="contents">
({$inc_footer|smarty:nodefaults})
