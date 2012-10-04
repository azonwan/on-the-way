({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})
({assign var="page_name" value="相册容量限制"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>({$page_name})</h2>

<div class="contents">

<div id="info">
<p>以MB为单位限制相册使用者的容量。</p>
<ul>
<li>成员的个人容量</li>
<li>成员的相册使用容量不能超过你设置的上线。</li>
<li>如果不填或者填写0则为无限制。</li>
</ul>
</div>

<div id="limitForm">
<h4>相册容量限制</h4>
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_album_limit','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input id="input_limit" class="basic" type="text" name="limit" value="({$smarty.const.OPENPNE_ALBUM_LIMIT})" /><label for="input_limit">MB</label>
<p class="textBtn"><input type="submit" value="变更" /></p>
</form>
</div>

({$inc_footer|smarty:nodefaults})

