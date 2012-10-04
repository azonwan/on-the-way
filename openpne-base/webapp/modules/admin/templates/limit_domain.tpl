({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})
({assign var="page_name" value="域名限制"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>域名限制</h2>
<div class="contents">
<ul class="description">
<li>限制给PC邮件地址发送邀请函的邮件地址的域名。<br />
如果指定了域名、无法给指定域名以外的地址发送邀请函。</li>
<li>「设定变更」接收邮件地址域名也受到限制。</li>
<li>手机地址邮件 ( docomo.ne.jp / ezweb.ne.jp / softbank.ne.jp / *.vodafone.ne.jp / *pdx.ne.jp ) 不能限制这些域名。</li>
<li>没有指定限制域名、所有邮件地址都有效。(默认设定)</li>
<li>「*.example.com」不会受到限制。</li>
</ul>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_limit_domain','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<table class="basicType2">
<tbody>
<tr>
<th>域名限制1</th>
<td><input name="LIMIT_DOMAIN1" type="text" class="basic" value="({$smarty.const.LIMIT_DOMAIN1})" size="30" /></td>
</tr>
<tr>
<th>域名制限2</th>
<td><input name="LIMIT_DOMAIN2" type="text" class="basic" value="({$smarty.const.LIMIT_DOMAIN2})" size="30" /></td>
</tr>
<tr>
<th>域名制限3</th>
<td><input name="LIMIT_DOMAIN3" type="text" class="basic" value="({$smarty.const.LIMIT_DOMAIN3})" size="30" /></td>
</tr>
<tr>
<th>域名制限4</th>
<td><input name="LIMIT_DOMAIN4" type="text" class="basic" value="({$smarty.const.LIMIT_DOMAIN4})" size="30" /></td>
</tr>
<tr>
<th>域名制限5</th>
<td><input name="LIMIT_DOMAIN5" type="text" class="basic" value="({$smarty.const.LIMIT_DOMAIN5})" size="30" /></td>
</tr>
<tr>
<th>&nbsp;</th>
<td><p class="textBtn"><input type="submit" class="submit" value=" 更　新 " /></p></td>
</tr>
</tbody>
</table>
</form>

({$inc_footer|smarty:nodefaults})
