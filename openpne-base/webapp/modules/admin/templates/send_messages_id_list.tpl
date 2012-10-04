({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="消息・邮件地址发送指定"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})

<h2>消息・邮件地址发送指定</h2>
<div class="contents">

<p>请指定要发送电子邮件的成员的ID或输入邮件地址。</p>
<p class="caution">※如果多数指定请另起一行也可以用空格隔开。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_messages_id_list','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<p>
<select class="basic" name="specify_type">
<option value="c_member_id"({if $requests.specify_type == "c_member_id"}) selected="selected"({/if})>ID指定</option>
<option value="mail_address"({if $requests.specify_type == "mail_address"}) selected="selected"({/if})>邮件地址指定</option>
</select>
</p>

<p>
<textarea name="c_member_id_list" rows="6" cols="50">({$requests.c_member_id_list})</textarea>
</p>
<p class="textBtn"><input type="submit" class="submit" value="确定" /></p>
</form>

({$inc_footer|smarty:nodefaults})
