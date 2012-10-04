({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="短信、邮件送信"})
({assign var="parent_page_name" value="会员列表"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})

<h2>短信、邮件送信</h2>
<div class="contents">

<p>给符合条件的用户发送短信或者邮件。请输入标题和内容。</p>
<p class="caution">※此短信做为ID为1的用户发送。<br>
※请注意送信用户数过多，可能会使符合过大。</p>

<div id="page_navi">
<h3>◆送信地址</h3>
<ul>
({if $cond_list.s_year||$cond_list.e_year})
<li>生年月日 : ({if $cond_list.s_year})({$cond_list.s_year})年({/if})～({if $cond_list.e_year})({$cond_list.e_year})年({/if})</li>
({/if})
({if $cond_list.last_login})
<li>最终登录 : ({$select_last_login[$cond_list.last_login]})</li>
({/if})
({if $cond_list.s_rank||$cond_list.e_rank})
<li>排位: ({$s_rank.name}) ～ ({$e_rank.name})</li>
({/if})
({if $cond_list.is_pc_address})
<li>PC邮件地址 : ({if $cond_list.is_pc_address == 1})已登录({else})未登录({/if})</li>
({/if})
({if $cond_list.is_ktai_address})
<li>手机邮件地址 : ({if $cond_list.is_ktai_address == 1})已登录({else})未登录({/if})</li>
({/if})
({foreach from=$profile_value_list key=key item=item})
<li>({$item.caption}) : ({$item.value})</li>
({/foreach})
</ul>
的会员
</div>({*/div class="page_navi"*})

<div class="edit_message">
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_messages_search','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
({foreach from=$cond_list key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<dl>
<dt class="label">送信类别</dt>
<dd><select class="basic" name="send_type">
<option value="message"({if $send_type=='message'}) selected="selected"({/if})>短信送信</option>
<option value="mail"({if $send_type=='mail'}) selected="selected"({/if})>邮件送信</option>
</option>
</select>
</dd>
<dt class="label">标题</dt>
<dd><input type="text" class="basic" name="subject" size="50" value="({$requests.subject})" /></dd>
<dt class="label">内容</dt>
<dd><textarea name="body" cols="50" rows="10">({$requests.body})</textarea></dd>
<dd><p class="textBtn"><input type="submit" class="submit" value="发送短信" /></p></dd>
</dl>
</form>
<br />
<p class="caution" id="c02"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">メンバーリストに戻る</a></p>

</div>

({$inc_footer|smarty:nodefaults})
