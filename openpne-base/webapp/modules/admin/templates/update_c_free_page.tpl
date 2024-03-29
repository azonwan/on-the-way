({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})

({assign var="parent_page_name" value="自由页面管理"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})({/capture})

({assign var="page_name" value="自由页面页面编辑"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>自由页面编辑</h2>
<div class="contents">

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_free_page','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_free_page_id" value="({$c_free_page.c_free_page_id})">

<table class="basicType2">
<tbody>
<tr>
<th>页标题</th>
<td><input class="basic" type="text" name="title" value="({$c_free_page.title})" size="({$cols|default:72})" /></td>
</tr>
<tr>
<th>页内容</th>
<td>
<textarea class="basic" name="body" cols="({$cols|default:60})" rows="({$rows|default:10})">({$c_free_page.body})</textarea>
</td>
</tr>
<tr>
<th>SNS认证</th>
<td>
<input class="basicRadio" type="radio" id="radio_auth_1" name="auth" value="1"({if $c_free_page.auth}) checked="checked"({/if}) /><label for="radio_auth_1">有</label>
<input class="basicRadio" type="radio" id="radio_auth_2" name="auth" value="0"({if !$c_free_page.auth}) checked="checked"({/if}) /><label for="radio_auth_2">无</label>
</td>
</tr>
<tr>
<th>对象浏览器</th>
<td>
<input class="basicRadio" type="radio" id="radio_type_1" name="type" value="pc"({if $c_free_page.type == 'pc'}) checked="checked"({/if}) /><label for="radio_type_1">PC</label>
<input class="basicRadio" type="radio" id="radio_type_2" name="type" value="ktai"({if $c_free_page.type == 'ktai'}) checked="checked"({/if}) /><label for="radio_type_2">手机</label>
</td>
</tr>
<tr>
<td colspan="2">
<p class="caution">※「SNS认证：有」「対象浏览器：手机」的页面、从自由页面内的链接转移到外部网站的时候，<br />
跳转到外部网站时，可能会泄漏“第三者可能登录的信息”。</p>
<p class="textBtn"><input type="submit" class="submit" value="编辑"></p>
</td>
</tr>
</tbody>
</table>

</form>

<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})">返回</a></p>

({$inc_footer|smarty:nodefaults})
