({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="短信、邮件送信"})
({assign var="parent_page_name" value="会员列表"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})

<h2 id="ttl01">短信、邮件送信</h2>
<div class="contents">
<p class="info">给所有会员发送短信或者邮件。</p>
<p class="caution" id="c01">请输入标题和内容。<br /><strong>※此短信作为ID为No.1的会员发送。</strong></p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_messages_all','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<dl>
	<dt class="msgAdd"><strong>送信类型</strong></dt>
	<dd class="msgAdd"><select class="basic" name="send_type"><option value="message"({if $send_type=='message'}) selected="selected"({/if})>短信送信</option>
<option value="mail"({if $send_type=='mail'}) selected="selected"({/if})>邮件送信</option>
</option></select></dd>
</dl>
<dl>
	<dt class="msgAdd"><strong>送信地址</strong></dt>
	<dd class="msgAdd"><strong>所有的会员</strong></dd>
</dl>
<dl>
<dt class="msgTtl"><strong>标题</strong></dt>
<dd class="msgTtl"><input class="basic" type="text" name="subject" size="50" value="({$requests.subject})" /></dd>
<dt class="msgTxt"><strong>内容</strong></dt>
<dd class="msgTxt"><textarea name="body" cols="50" rows="10">({$requests.body})</textarea></dd>
</dl>
<p class="textBtn"><input type="submit" value="发送短信" /></p>
</form>
<p class="caution" id="c02"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">返回会员列表</a></p>

({$inc_footer|smarty:nodefaults})
