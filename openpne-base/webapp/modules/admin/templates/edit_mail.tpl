({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="邮件文言变更"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

<h2>各个场合发送给用户的邮件文字内容变更</h2>
<div class="contents">
<p class="caution" id="c01">※可用Smarty模板或代码方式编写一个页面。</p>
<p class="caution" id="c02">如果用错误的形式记述，可能导致邮件无法发送。<br />遇到此情况，请点击「返回至默认值」还原。</p>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
<tr>
<td class="menu">
<dl>
<dt><strong class="item">发送给网站会员的邮件内容</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})&amp;target=inc_signature">署名（全PC邮件共通）</a></li>
({foreach from=$pc key=key item=item})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})&amp;target=({$key})">({$item})</a></li>
({/foreach})
</ul>
</dd>
<dt><strong class="item">面向手机邮件发送的邮件内容</strong></dt>
<dd>
<ul>
({foreach from=$ktai key=key item=item})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})&amp;target=({$key})">({$item})</a></li>
({/foreach})
</ul>
</dd>
<dt><strong class="item">发送给管理员的邮件内容</strong></dt>
<dd>
<ul>
({foreach from=$admin key=key item=item})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})&amp;target=({$key})">({$item})</a></li>
({/foreach})
</ul>
</dd>
</dl>
</td>
<td class="detail">
<h3>({if $requests.target == "inc_signature"})
署名（全PC邮件共通）
({elseif $pc[$requests.target]})
({$pc[$requests.target]})
({elseif $ktai[$requests.target]})
({$ktai[$requests.target]})
({elseif $admin[$requests.target]})
({$admin[$requests.target]})
({/if})</h3>
({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<p id="default"><a href="./?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_mail','do')})&amp;target=({$requests.target})&amp;sessid=({$PHPSESSID})">返回至默认值</a></p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_mail','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target" value="({$requests.target})" />
<dl>
({if $requests.target != "inc_signature"})
<dt><strong class="item">件名</strong></dt>
<dd><input class="basic" type="text" name="subject" value="({$subject})" size="72" /></dd>
<dt><strong class="item">内容</strong></dt>
({/if})
<dd><textarea name="body" cols="({$cols|default:72})" rows="({$rows|default:30})">({$body})</textarea></dd>
</dl>
<p class="textBtn"><input type="submit" value="变更"></p>
</form>
</td>
</tr>
</table>

({$inc_footer|smarty:nodefaults})
