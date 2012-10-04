<div id="LayoutB">

({if $box == "inbox" || !$box })

({* {{{ searchFormLine *})
<div class="parts searchFormLine">
({t_form_block _method=get m=pc a=page_h_message_box})
<input type="hidden" name="box" value="({$box})" />
<ul>
<li><img src="({t_img_url_skin filename=icon_search})" alt="search" /></li>
<li><label for="keyword">关键词</label><input type="text" class="input_text" name="keyword" id="keyword" value="({$keyword})" size="20" /></li>
<li><label for="target_c_member_id">送信人</label><select name="target_c_member_id" id="target_c_member_id">
<option value="">无指定</option>
({foreach from=$c_message_sender_list item=item})
<option value="({$item.c_member_id_from})"({if $target_c_member_id == $item.c_member_id_from}) selected="selected"({/if})>({$item.nickname})</option>
({/foreach})
</select></li>
<li><input type="submit" class="input_submit" value="检  索" /></li>
</ul>
({/t_form_block})
</div>
({* }}} *})

({elseif $box == "outbox"})

({* {{{ searchFormLine *})
<div class="parts searchFormLine">
({t_form_block _method=get m=pc a=page_h_message_box})
<input type="hidden" name="box" value="({$box})" />
<ul>
<li><img src="({t_img_url_skin filename=icon_search})" alt="search" /></li>
<li><label for="keyword">关键字</label><input type="text" class="input_text" name="keyword" id="keyword" value="({$keyword})" size="20" /></li>
<li><label for="target_c_member_id">地址</label><select name="target_c_member_id" id="target_c_member_id">
<option value="">无指定</option>
({foreach from=$c_message_receiver_list item=item})
<option value="({$item.c_member_id_to})"({if $target_c_member_id == $item.c_member_id_to}) selected="selected"({/if})>({$item.nickname})</option>
({/foreach})
</select></li>
<li><input type="submit" class="input_submit" value="检  索" /></li>
</ul>
({/t_form_block})
</div>
({* }}} *})

({/if})

<div id="Left">

<script type="text/javascript">
//<![CDATA[
function checkAll() {
    var sm = document.h_message_box_delete_message;
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = true;
    }
    return false;
}
function clearAll() {
    var sm = document.h_message_box_delete_message;
    var len = sm.elements.length;
    for (var i = 0; i < len; i++) {
        sm.elements[i].checked = false;
    }
    return false;
}
//]]>
</script>

({* {{{ sideNav *})
<div class="parts sideNav">

<div class="item pageNav"><ul>
({if $box != "inbox"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=inbox">收信箱</a></li>
({else})<li class="looking">收信箱</li>
({/if})
({if $box != "outbox"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=outbox">发信箱</a></li>
({else})<li class="looking">发信箱</li>
({/if})
({if $box != "savebox"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=savebox">草稿箱</a></li>
({else})<li class="looking">草稿箱</li>
({/if})
({if $box != "trash"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=trash">回收站</a></li>
({else})<li class="looking">回收站</li>
({/if})
</ul></div>

({if $calendar})
<div class="item calendar">
<div class="partsHeading"><h3>
({if $ym.prev_month})<a href="({t_url m=pc a=page_h_message_box})&amp;target_c_member_id=({$target_member.c_member_id})&amp;box=({$box})&amp;year=({$ym.prev_year})&amp;month=({$ym.prev_month})">＜</a>({/if})
({$date_val.month})月的日历
({if $ym.next_month})<a href="({t_url m=pc a=page_h_message_box})&amp;target_c_member_id=({$target_member.c_member_id})&amp;box=({$box})&amp;year=({$ym.next_year})&amp;month=({$ym.next_month})">＞</a>({/if})
</h3></div>
<table class="calendar">
<tr>
<th class="sun">日</th>
<th class="mon">一</th>
<th class="tue">二</th>
<th class="wed">三</th>
<th class="thu">四</th>
<th class="fri">五</th>
<th class="sat">六</th>
</tr>({foreach from=$calendar item=week})<tr>
({foreach from=$week item=item name="calendar_days"})
<td>({strip})
({if $item.day})
({if $item.is_message})
<a href="({t_url m=pc a=page_h_message_box})&amp;target_c_member_id=({$target_member.c_member_id})&amp;year=({$date_val.year})&amp;month=({$date_val.month})&amp;day=({$item.day})&amp;box=({$box})" class="s_ss">({$item.day})</a>
({else})
({$item.day})
({/if})
({else})
({/if})
({/strip})</td>
({/foreach})
</tr>
({/foreach})
</table>
</div>
({/if})

({if $date_list})
<div class="item monthlyMessage">
<div class="partsHeading"><h3>各月短信</h3></div>
<ul class="list">
({foreach from=$date_list item=date})
<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=({$box})&amp;year=({$date.year})&amp;month=({$date.month})&amp;box=({$box})">({$date.year})年({$date.month})月一览</a></li>
({/foreach})
</ul>
</div>
({/if})

</div>
({* }}} *})

</div><!-- Left -->
<div id="Center">

({if $box == "inbox" || !$box})

({if $count_c_message_ru_list})
({* {{{ messageList *})
<div class="dparts messageList"><div class="parts">
<div class="partsHeading"><h3>收信箱</h3>
({if !$all})
<p class="date">({$date_val.year})年({$date_val.month})月({if $date_val.day})({$date_val.day})日({/if})</p>
({/if})
</div>

<div class="pagerRelativeMulti">
<p class="icons">
<span><img src="({t_img_url_skin filename=icon_mail_4})" alt="已回复" />已回复</span>
</p>
<div class="pager">
({capture name=pager})({strip})
({if $ru_data.is_ru_prev})<p class="prev"><a href="({t_url m=pc a=page_h_message_box})&amp;ru_page=({$ru_data.ru_page-1})&amp;box=inbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">上一页</a></p>({/if})
<p class="number">共({$total_num})条 ({$ru_data.ru_page*$page_size-$page_size+1})条～
({if $ru_data.ru_page*$page_size > $count_c_message_ru_list })
({$count_c_message_ru_list+$ru_data.ru_page*$page_size-$page_size })
({else})
({$ru_data.ru_page*$page_size})
({/if})
条 记录</p>
({if $ru_data.is_ru_next})<p class="next"><a href="({t_url m=pc a=page_h_message_box})&amp;ru_page=({$ru_data.ru_page+1})&amp;box=inbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">下一页</a></p>({/if})
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})
</div>
</div>

({t_form_block m=pc a=do_h_message_box_delete_message _attr='name="h_message_box_delete_message"'})
<input type="hidden" name="box" value="({$box})" />

<table>
<col class="status" />
<col class="delete" />
<col class="target" />
<col class="title" />
<col class="date" />
<tr>
<th></th>
<th class="delete">删除</th>
<th>送信人</th>
<th>题目</th>
<th>日期</th>
</tr>
({foreach from=$c_message_ru_list item=c_message_ru})
<tr({if !$c_message_ru.is_read}) class="unread"({/if})>
<td class="status"><span>({strip})
({if $c_message_ru.is_hensin})
<img src="({t_img_url_skin filename=icon_mail_4})" alt="已回复" />
({elseif $c_message_ru.is_read})
<img src="({t_img_url_skin filename=icon_mail_2})" alt="已读" />
({else})
<img src="({t_img_url_skin filename=icon_mail_1})" alt="未读" />
({/if})
({/strip})</span></td>
<td><span><input type="checkbox" class="input_checkbox" name="c_message_id[]" value="({$c_message_ru.c_message_id})" /></span></td>
<td><span>({$c_message_ru.nickname})</span></td>
<td><span><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$c_message_ru.c_message_id})&amp;jyusin_c_message_id=({$c_message_ru.c_message_id})">({$c_message_ru.subject})</a></span></td>
<td><span>({$c_message_ru.r_datetime|date_format:"%m月%d日"})</span></td>
</tr>
({/foreach})
</table>

<div class="pagerRelative">
({$smarty.capture.pager|smarty:nodefaults})
</div>

<div class="operation">
<p><a href="#" onclick="return checkAll();" onkeypress="return checkAll();">全部选中</a> / <a href="#" onclick="return clearAll();" onkeypress="return clearAll();">全部取消</a></p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="删 除" /></li>
</ul>
</div>

({/t_form_block})

</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>收信箱</h3></div>
<div class="block">
<p>没有消息。</p>
</div>
</div></div>
({* }}} *})
({/if})

({elseif $box == "outbox"})

({if $count_c_message_s_list})
({* {{{ messageList *})
<div class="dparts messageList"><div class="parts">
<div class="partsHeading"><h3>已发送的短信</h3>
({if !$all})
<p class="date">({$date_val.year})年({$date_val.month})月({if $date_val.day})({$date_val.day})日({/if})</p>
({/if})
</div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $s_data.is_s_prev})<p class="prev"><a href="({t_url m=pc a=page_h_message_box})&amp;s_page=({$s_data.s_page-1})&amp;box=outbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">上一页</a></p>({/if})
<p class="number">共({$total_num})条 ({$s_data.s_page*$page_size-$page_size+1})条～
({if $s_data.s_page*$page_size > $count_c_message_s_list})
({$count_c_message_s_list+$s_data.s_page*$page_size-$page_size})
({else})
({$s_data.s_page*$page_size})
({/if})
条 记录</p>
({if $s_data.is_s_next})<p class="next"><a href="({t_url m=pc a=page_h_message_box})&amp;s_page=({$s_data.s_page+1})&amp;box=outbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})&amp;year=({$requests.year})&amp;month=({$requests.month})&amp;day=({$requests.day})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({t_form_block m=pc a=do_h_message_box_delete_message _attr='name="h_message_box_delete_message"'})
<input type="hidden" name="box" value="({$box})" />

<table>
<col class="status" />
<col class="delete" />
<col class="target" />
<col class="title" />
<col class="date" />
<tr>
<th></th>
<th class="delete">删除</th>
<th>地   址</th>
<th>题   目</th>
<th>日   期</th>
</tr>
({foreach from=$c_message_s_list item=c_message_s})
<tr>
<td class="status"><span><img src="({t_img_url_skin filename=icon_mail_3})" alt="" /></span></td>
<td><span><input type="checkbox" class="input_checkbox" name="c_message_id[]" value="({$c_message_s.c_message_id})" /></span></td>
<td><span>({$c_message_s.nickname})</span></td>
<td><span><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$c_message_s.c_message_id})&amp;box=outbox">({$c_message_s.subject})</a></span></td>
<td><span>({$c_message_s.r_datetime|date_format:"%m月%d日"})</span></td>
</tr>
({/foreach})
</table>

({$smarty.capture.pager|smarty:nodefaults})

<div class="operation">
<p><a href="#" onclick="return checkAll();" onkeypress="return checkAll();">全部选中</a> / <a href="#" onclick="return clearAll();" onkeypress="return clearAll();">全部取消</a></p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="删 除" /></li>
</ul>
</div>

({/t_form_block})

</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>已发送的消息</h3></div>
<div class="block">
<p>没有消息。</p>
</div>
</div></div>
({* }}} *})
({/if})

({elseif $box == "savebox"})

({if $count_c_message_save_list})
({* {{{ messageList *})
<div class="dparts messageList"><div class="parts">
<div class="partsHeading"><h3>草稿箱</h3>
({if !$all})
<p class="date">({$date_val.year})年({$date_val.month})月({if $date_val.day})({$date_val.day})日({/if})</p>
({/if})
</div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $save_data.is_save_prev})<p class="prev"><a href="({t_url m=pc a=page_h_message_box})&amp;save_page=({$save_data.save_page-1})&amp;box=savebox">上一页</a></p>({/if})
<p class="number">共({$total_num})条 ({$save_data.save_page*$page_size-$page_size+1})条～
({if $save_data.save_page*$page_size > $count_c_message_save_list })
({$count_c_message_save_list+$save_data.save_page*$page_size-$page_size })
({else})
({$save_data.save_page*$page_size})
({/if})
条 记录</p>
({if $save_data.is_save_next})<p class="next"><a href="({t_url m=pc a=page_h_message_box})&amp;save_page=({$save_data.save_page+1})&amp;box=savebox">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({t_form_block m=pc a=do_h_message_box_delete_message _attr='name="h_message_box_delete_message"'})
<input type="hidden" name="box" value="savebox" />

<table>
<col class="status" />
<col class="delete" />
<col class="target" />
<col class="title" />
<col class="date" />
<tr>
<th></th>
<th class="delete">删除</th>
<th>地址</th>
<th>题目</th>
<th>日期</th>
</tr>
({foreach from=$c_message_save_list item=c_message_save})
<tr>
<td class="status"><span><img src="({t_img_url_skin filename=icon_mail_1})" alt="" /></span></td>
<td><span><input type="checkbox" class="input_checkbox" name="c_message_id[]" value="({$c_message_save.c_message_id})" /></span></td>
<td><span>({$c_message_save.nickname})</span></td>
<td><span><a href="({t_url m=pc a=page_f_message_send})&amp;target_c_message_id=({$c_message_save.c_message_id})&amp;jyusin_c_message_id=({$c_message_save.hensinmoto_c_message_id})&amp;box=savebox">({$c_message_save.subject})</a></span></td>
<td><span>({$c_message_save.r_datetime|date_format:"%m月%d日"})</span></td>
</tr>
({/foreach})
</table>

({$smarty.capture.pager|smarty:nodefaults})

<div class="operation">
<p><a href="#" onclick="return checkAll();" onkeypress="return checkAll();">全部选中</a> / <a href="#" onclick="return clearAll();" onkeypress="return clearAll();">全部取消</a></p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="删 除" /></li>
</ul>
</div>

({/t_form_block})

</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>草稿箱</h3></div>
<div class="block">
<p>没有消息。</p>
</div>
</div></div>
({* }}} *})
({/if})

({elseif $box == "trash"})

({if $count_c_message_trash_list})
({* {{{ messageList *})
<div class="dparts messageList"><div class="parts">
<div class="partsHeading"><h3>回收站的消息</h3></div>

<div class="pagerRelativeMulti">
<p class="icons">
<span><img src="({t_img_url_skin filename=icon_mail_2})" alt="收信" />收信</span>
<span><img src="({t_img_url_skin filename=icon_mail_3})" alt="送信" />送信</span>
<span><img src="({t_img_url_skin filename=icon_mail_1})" alt="草稿" />草稿</span>
</p>
<div class="pager">
({capture name=pager})({strip})
({if $trash_data.is_trash_prev})<p class="prev"><a href="({t_url m=pc a=page_h_message_box})&amp;trash_page=({$trash_data.trash_page-1})&amp;box=trash">上一页</a></p>({/if})
<p class="number">共({$total_num})条 ({$trash_data.trash_page*$page_size-$page_size+1})条～
({if $trash_data.trash_page*$page_size > $count_c_message_trash_list })
({$count_c_message_trash_list+$trash_data.trash_page*$page_size-$page_size })
({else})
({$trash_data.trash_page*$page_size})
({/if})
条< 记录/p>
({if $trash_data.is_trash_next})<p class="next"><a href="({t_url m=pc a=page_h_message_box})&amp;trash_page=({$trash_data.trash_page+1})&amp;box=trash">下一页</a></p>({/if})
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})
</div>
</div>

({t_form_block m=pc a=do_h_message_box_delete_message _attr='name="h_message_box_delete_message"'})
<input type="hidden" name="box" value="trash" />

<table>
<col class="status" />
<col class="delete" />
<col class="target" />
<col class="title" />
<col class="date" />
<tr>
<th></th>
<th class="delete"></th>
<th>对象</th>
<th>题目</th>
<th>日期</th>
</tr>
({foreach from=$c_message_trash_list item=c_message_trash})
<tr>
<td class="status"><span>({strip})
({if $c_message_trash.c_member_id_to == $u})({* 受信メッセージ *})
    <img src="({t_img_url_skin filename=icon_mail_2})" alt="收信" />
({else})
    ({if $c_message_trash.is_send})({* 送信メッセージ *})
        <img src="({t_img_url_skin filename=icon_mail_3})" alt="送信" />
    ({else})({* 下書きメッセージ *})
        <img src="({t_img_url_skin filename=icon_mail_1})" alt="草稿" />
    ({/if})
({/if})
({/strip})</span></td>
<td><span><input type="checkbox" class="input_checkbox" name="c_message_id[]" value="({$c_message_trash.c_message_id})" /></span></td>
<td><span>({$c_message_trash.nickname})</span></td>
<td><span><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$c_message_trash.c_message_id})&amp;box=trash">({$c_message_trash.subject})</a></span></td>
<td><span>({$c_message_trash.r_datetime|date_format:"%m月%d日"})</span></td>
</tr>
({/foreach})
</table>

<div class="pagerRelative">
({$smarty.capture.pager|smarty:nodefaults})
</div>

<div class="operation">
<p><a href="#" onclick="return checkAll();" onkeypress="return checkAll();">全部选中</a> / <a href="#" onclick="return clearAll();" onkeypress="return clearAll();">全部取消</a></p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" name="move" value="还原" /></li>
<li><input type="submit" class="input_submit" name="remove" value="删除" /></li>
</ul>
</div>

({/t_form_block})

<div class="partsInfo">
</div>
</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>回收站</h3></div>
<div class="block">
<p>没有消息。</p>
</div>
</div></div>
({* }}} *})
({/if})

({/if})

</div><!-- Center -->
</div><!-- LayoutB -->
