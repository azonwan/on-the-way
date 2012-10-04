({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="成员列表"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>概要短信送信履历详细</h2>
<div class="contents">
<p>
从管理画面显示送信短信履历</p>

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

({if $history})
<table class="basicType2">

<tr>
<th>送信日时</th>
<td>({$history.r_datetime|date_format:"%Y/%m/%d"})</td>
</tr>

<tr>
<th>送信数量</th>
<td>({$history.send_num})</td>
</tr>

<tr>
<th>标题</th>
<td>({$history.subject|nl2br})</td>
</tr>

<tr>
<th>内容</th>
<td>({$history.body|nl2br})</td>
</tr>


<tr>
<th>送信地址<br>用户ID</th>
<td>
<textarea name="body" cols="6" rows="10" readonly="readonly">({foreach from=$history.c_member_ids item=c_member_id})({$c_member_id})
({/foreach})</textarea>
</td>
</tr>

</table>

({else})
没有送信履历<br>
({/if})

<br>

({$inc_footer|smarty:nodefaults})
