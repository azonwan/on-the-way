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
<p class="info">给选择的成员发送短信或者邮件。</p>
<p class="caution" id="c01">请输入标题和内容。<br /><strong>※此短信被做为ID为No.1会员发送。</strong></p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_messages','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
({foreach from=$c_member_list item=item})
<input type="hidden" name="c_member_ids[]" value="({$item.c_member_id})" />
({/foreach})
<dl>
<dt class="msgAdd"><strong>送信类别</strong></dt>
<dd><select class="basic" name="send_type">
<option value="message"({if $send_type=='message'}) selected="selected"({/if})>短信送信</option>
<option value="mail"({if $send_type=='mail'}) selected="selected"({/if})>邮件送信</option>
</option>
</select>
</dd>
<dt class="msgAdd"><strong>送信地址</strong></dt>
<dd class="msgAdd">({foreach from=$c_member_list item=item name=cml})<strong><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" target="_blank">({$item.nickname})</a></strong>({if !$smarty.foreach.cml.last})&nbsp;／&nbsp;({/if})({/foreach})</dd>
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
