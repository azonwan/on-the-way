({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="网站邮件发送设定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで：navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>邮件送信设定</h2>
<div class="contents">
<p class="info">请自由设定哪些情况下网站会自动发邮件给用户。</p>

<h3 id="ttl01">面向用户PC邮件发送提示</h3>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_mail_send','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<table>
({foreach from=$pc key=key item=item})
<tr>
<th>({$item})</th>
<td>
<label for="({$key})Y"><input id="({$key})Y" type="radio" name="mail[({$key})]" value="1"({if !in_array($key, $unused)}) checked="checked"({/if})>发信</label>
<label for="({$key})N"><input id="({$key})N" type="radio" name="mail[({$key})]" value="0"({if in_array($key, $unused)}) checked="checked"({/if})>不发信</label>
</td>
</tr>
({/foreach})
</table>

<h3 id="ttl02">面向手机邮件发送提示</h3>
<table>
({foreach from=$ktai key=key item=item})
<tr>
<th>({$item})</th>
<td>
<label for="({$key})Y"><input id="({$key})Y" type="radio" name="mail[({$key})]" value="1"({if !in_array($key, $unused)}) checked="checked"({/if})>发信</label>
<label for="({$key})N"><input id="({$key})N" type="radio" name="mail[({$key})]" value="0"({if in_array($key, $unused)}) checked="checked"({/if})>不发信</label>
</td>
</tr>
({/foreach})
</table>

<h3 id="ttl03">面向网站管理者的邮件发送提示</h3>
<table>
({foreach from=$admin key=key item=item})
<tr>
<th>({$item})</th>
<td>
<label for="({$key})Y"><input id="({$key})Y" type="radio" name="mail[({$key})]" value="1"({if !in_array($key, $unused)}) checked="checked"({/if})>送信</label>
<label for="({$key})N"><input id="({$key})N" type="radio" name="mail[({$key})]" value="0"({if in_array($key, $unused)}) checked="checked"({/if})>不送信</label>
</td>
</tr>
({/foreach})
</table>

<p class="textBtn"><input type="submit" value="变更"></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})">邮件文言变更</a></p>
({$inc_footer|smarty:nodefaults})
