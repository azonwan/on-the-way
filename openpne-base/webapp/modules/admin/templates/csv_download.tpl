({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="CSV下载"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>CSV下载</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p class="caution">※如果全件下载，处理加重，会增加服务器的负荷。</p>

<h3 class="item">全件下载</h3>
<p>下载全部的会员情报CSV。</p>
<form  action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('csv_member','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="start_id" value="0" />
<input type="hidden" name="end_id" value="0" />
<input type="hidden" name="allflag" value="1" />
<p class="textBtn"><input type="submit" value="下载" /></p>
</form>

<h3 class="item">指定会员ID进行下载</h3>
<p>指定会员ID范围，下载CSV。</p>
<form  action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('csv_member','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input class="basic" type="text" name="start_id" value="" size="5" />　～　<input class="basic" type="text" name="end_id" value="" size="5" />
<input type="hidden" name="allflag" value="0" />
<p class="textBtn"><input type="submit" value="下载" /></p>
</form>

({$inc_footer|smarty:nodefaults})
