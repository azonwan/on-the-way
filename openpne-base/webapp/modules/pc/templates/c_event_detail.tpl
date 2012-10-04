<div id="LayoutC">
({ext_include file="inc_c_com_topic_find.tpl"})

<div id="Center">

({if !$err_msg || !$is_writable_comment})

({* {{{ infoBox *})
<div class="dparts infoBox"><div class="parts">
<p>把此活动告诉我的朋友</p>
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_event_invite})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">发送活动通知邮件</a></li>
</ul>
</div></div>
({* }}} *})

({* {{{ eventDetailBox *})
<div class="dparts eventDetailBox"><div class="parts">
<div class="partsHeading"><h3>[({$c_commu.name})] 活动</h3></div>

<dl>
<dt>({$c_topic.r_datetime|date_format:"%Y年%m月%d日<br />%H:%M"})</dt>
<dd>
({if $c_topic.image_filename1||$c_topic.image_filename2||$c_topic.image_filename3})
<ul class="photo">
({if $c_topic.image_filename1})<li><a href="({t_img_url filename=$c_topic.image_filename1})" target="_blank"><img src="({t_img_url filename=$c_topic.image_filename1 w=120 h=120})" alt="" /></a></li>({/if})
({if $c_topic.image_filename2})<li><a href="({t_img_url filename=$c_topic.image_filename2})" target="_blank"><img src="({t_img_url filename=$c_topic.image_filename2 w=120 h=120})" alt="" /></a></li>({/if})
({if $c_topic.image_filename3})<li><a href="({t_img_url filename=$c_topic.image_filename3})" target="_blank"><img src="({t_img_url filename=$c_topic.image_filename3 w=120 h=120})" alt="" /></a></li>({/if})
</ul>
({/if})
<table><tr>
<th>标题</th>
<td>({$c_topic.name})</td>
</tr><tr>
<th>发表者</th>
<td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_topic.c_member_id})">({$c_topic.nickname})</a></td>
</tr><tr>
<th>举办时间</th>
<td>({$c_topic.open_date})&nbsp;({$c_topic.open_date_comment})</td>
</tr><tr>
<th>举办场所</th>
<td>({$c_topic.pref})({$c_topic.open_pref_comment})</td>
</tr><tr>
<th>相关圈子</th>
<td><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})">({$c_commu.name})</a></td>
</tr><tr>
<th>详细</th>
<td>({$c_topic.body|nl2br|t_url2cmd:'community':$c_topic.c_member_id|t_cmd:'community'})</td>
</tr><tr>
<th>报名期限</th>
<td>({if $c_topic.invite_period != "0000-00-00"})({$c_topic.invite_period})({else})无限制({/if})</td>
</tr><tr>
<th>募集人数</th>
<td>({if $c_topic.capacity})({$c_topic.capacity})人({else})无限制({/if})</td>
</tr><tr>
<th>参加者</th>
<td>({$c_topic.member_num})人
({if $c_topic.member_num})
<ul class="moreInfo"><li><a href="({t_url m=pc a=page_c_event_member_list})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">参加者一览</a></li></ul>
({/if})
</td>
</tr>
({if $is_c_event_admin || $is_c_commu_admin})
<tr>
<th>说明邮件</th>
<td>向活动参加者发送介绍说明邮件。
<ul class="moreInfo"><li><a href="({t_url m=pc a=page_c_event_mail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})">发送邮件</a></li></ul>
</td>
</tr>
({/if})
</table>
</dd>
</dl>

({if $is_c_event_admin || $is_c_commu_admin})
<div class="operation">
({t_form_block m=pc a=page_c_event_edit})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})" />
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="修   改" /></li>
</ul>
({/t_form_block})
</div>
({/if})
</div></div>
({* }}} *})

({if $c_topic_write.0})
({* {{{ commentList *})
<div class="dparts commentList" id="commentList"><div class="parts">
<div class="partsHeading"><h3>留言</h3></div>

({if $pager.total_num > 20 || $pager.total_page_num > 1})
({strip})
<div class="pagerRelative">

({if $pager.total_num > 20})
({if $requests.page_size == 100})
<p><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})({if $requests.order == 'asc'})&amp;order=asc({/if})#commentList">各显示20条</a></p>
({else})
<p><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})({if $requests.order == 'asc'})&amp;order=asc({/if})&amp;page_size=100#commentList">各显示100条</a></p>
({/if})
({/if})

({if $pager.total_page_num > 1})
({if $requests.order == 'asc'})
<p><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})({if $requests.page_size == 100})&amp;page_size=100({/if})#commentList">显示最新</a></p>
({else})
<p><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})({if $requests.page_size == 100})&amp;page_size=100({/if})&amp;order=asc#commentList">从最初显示</a></p>
({/if})
({/if})

</div>
({/strip})
({/if})

({capture name=pager})({strip})
<div class="pagerRelative">
({if $pager.page_prev})<p class="prev"><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})({if $requests.page_size == 100})&amp;page_size=100({/if})({if $requests.order == 'asc'})&amp;order=asc({/if})&amp;page=({$pager.page_prev})#commentList">上一页</a></p>({/if})
<p class="number">({$pager.start_num})条～({$pager.end_num})条 记录</p>
({if $pager.page_next})<p class="next"><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})({if $requests.page_size == 100})&amp;page_size=100({/if})({if $requests.order == 'asc'})&amp;order=asc({/if})&amp;page=({$pager.page_next})#commentList">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$c_topic_write item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年<br />%m月%d日<br />%H:%M"})</dt>
<dd>
<div class="title">
<p class="heading"><strong>({$item.number})</strong>: <a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a>({if $c_member_id == $item.c_member_id || $c_member_id == $c_commu.c_member_id_admin || $c_member_id == $c_commu.c_member_id_sub_admin}) <a href="({t_url m=pc a=page_c_event_write_delete_confirm})&amp;target_c_commu_topic_comment_id=({$item.c_commu_topic_comment_id})">删除</a>({/if})</p>
</div>
<div class="body">
({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})
<ul class="photo">
({if $item.image_filename1})<li><a href="({t_img_url filename=$item.image_filename1})" target="_blank"><img src="({t_img_url filename=$item.image_filename1 w=120 h=120})" alt="" /></a></li>({/if})
({if $item.image_filename2})<li><a href="({t_img_url filename=$item.image_filename2})" target="_blank"><img src="({t_img_url filename=$item.image_filename2 w=120 h=120})" alt="" /></a></li>({/if})
({if $item.image_filename3})<li><a href="({t_img_url filename=$item.image_filename3})" target="_blank"><img src="({t_img_url filename=$item.image_filename3 w=120 h=120})" alt="" /></a></li>({/if})
</ul>
({/if})
<p class="text">({$item.body|nl2br|t_url2cmd:'community':$item.c_member_id|t_cmd:'community'})</p>
</div>
</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})
</div></div>
({* }}} *})
({/if})

({/if})

({if $is_c_commu_member})
({if $is_writable_comment})
({* {{{ formTable *})
<div class="dparts formTable" id="commentForm"><div class="parts">
<div class="partsHeading"><h3>发表留言</h3></div>
({t_form_block _enctype=file m=pc a=page_c_event_write_confirm})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})" />
<table>
<tr><th>内　　容</th><td><textarea name="body" rows="10" cols="50">({$body})</textarea></td></tr>
<tr><th>照　片 1</th><td><input type="file" class="input_file" name="image_filename1" size="40" /></td></tr>
<tr><th>照　片 2</th><td><input type="file" class="input_file" name="image_filename2" size="40" /></td></tr>
<tr><th>照　片 3</th><td><input type="file" class="input_file" name="image_filename3" size="40" /></td></tr>
</table>
<div class="operation">
<ul class="moreInfo button">
({strip})
({if $is_event_join_date})
    ({if $is_c_event_member})
        <li><input type="submit" class="input_submit" name="button" value="取消参加" /></li>
    ({elseif $is_event_join_capacity})
        <li><input type="submit" class="input_submit" name="button" value="参加活动" /></li>
    ({/if})
({/if})
({/strip})
<li><input type="submit" class="input_submit" name="button" value="只留言不参加" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})
({else})
({* {{{ alertLine *})
<div class="parts alertLine">
<p>留言达到1000条之后，这个活动就不能再留言。</p>
</div>
({* }}} *})

({if $is_event_join_date})
({if $is_c_event_member})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>取消参加</h3></div>
<div class="block">

<p>取消参加「({$c_topic.name})」活动吗？</p>

({t_form_block m=pc a=do_c_event_drop_c_commu_event})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})" />
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="取消参加" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})
({elseif $is_event_join_capacity})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>参加此活动</h3></div>
<div class="block">

<p>参加「({$c_topic.name})」活动吗？</p>

({t_form_block m=pc a=do_c_event_join_c_commu_event})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})" />
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="参加活动" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})
({/if})
({/if})

({/if})
({/if})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})">[({$c_commu.name})]返回({$WORD_COMMUNITY})首页</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
