<div id="LayoutA">
<div id="Top">

({if $is_h_prof})

({* {{{ descriptionBox *})
<div class="dparts descriptionBox"><div class="parts">
<p>※其他会员访问你时显示如下。</p>
<p>告诉其他人你的地址时，请使用以下链接。<br />
({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$target_c_member_id})</p>
<p>个人资料更改，请点击 「<a href="({t_url m=pc a=page_h_config_prof})">这里</a>」。</p>
</div></div>
({* }}} *})

({else})

({if $target_c_member.public_flag_birth_month_day == 'public' || ($target_c_member.public_flag_birth_month_day == 'friend' && $is_friend)})

({if $days_birthday == 0})({* 誕生日当日 *})
<div class="parts">
<a href="({t_url m=pc a=page_f_message_send})&amp;target_c_member_id=({$target_c_member.c_member_id})"><img src="({t_img_url_skin filename=birthday_f})" alt="Happy Birthday!" /></a>
</div>
({elseif $days_birthday > 0 && $days_birthday <= 3})({* 誕生日3日以内 *})
<div class="parts">
<a href="({t_url m=pc a=page_f_message_send})&amp;target_c_member_id=({$target_c_member.c_member_id})"><img src="({t_img_url_skin filename=birthday_f_2})" alt="もうすぐ誕生日です" /></a>
</div>
({/if})

({/if})

({if !$is_friend})
({* {{{ infoBox *})
<div class="dparts infoBox"><div class="parts">
<p>({$target_c_member.nickname})さんと直接の知り合いの場合、({$WORD_MY_FRIEND})に追加しましょう！</p>
<ul class="moreInfo">
<li><a href="({t_url m=pc a=do_f_link_request})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;sessid=({$PHPSESSID})">({$WORD_MY_FRIEND})に追加</a></li>
</ul>
</div></div>
({* }}} *})
({/if})

({if $is_friend && $my_friend_intro==''})
({* {{{ infoBox *})
<div class="dparts infoBox"><div class="parts">
<p>你对({$target_c_member.nickname})的印象是？</p>
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_f_intro_edit})&amp;target_c_member_id=({$target_c_member.c_member_id})">写印象</a></li>
</ul>
</div></div>
({* }}} *})
({/if})

({/if})

({if $calendar})
({$calendar|smarty:nodefaults})
({/if})

</div><!-- Top -->
<div id="Left">

({if $inc_entry_point[3]})({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'}) ({/if})

({if $inc_entry_point[4]})({$inc_entry_point[4]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

({if $c_friend_list})
({* {{{ homeNineTable *})
<div class="parts homeNineTable">
<div class="partsHeading"><h3>({$WORD_FRIEND})列表</h3></div>
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
({capture assign=flashvars})({strip})
({foreach from=$c_friend_list item=item key=key})
({if $key > 0})&({/if})
pne_item({$key+1})_id=({$item.c_member_id})
&pne_item({$key+1})_name=({$item.nickname|t_truncate:12:'..'|escape:url|smarty:nodefaults})
&pne_item({$key+1})_linkurl=({t_url m=pc a=page_f_home _urlencode=true _html=false})%26target_c_member_id=({$item.c_member_id})
&pne_item({$key+1})_imageurl=({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image _urlencode=true _html=false})
&pne_item({$key+1})_count=({$item.friend_count})
({/foreach})
({/strip})({/capture})
<script type="text/javascript" src="js/show_flash.js"></script>
<script type="text/javascript">
//<![CDATA[
show_flash('flash/list.swf', '({$flashvars})');
//]]>
</script>
({else})
<table>
({if $c_friend_list[0]})
<tr class="photo">
({t_loop from=$c_friend_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_friend_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_friend_list[3]})
<tr class="photo">
({t_loop from=$c_friend_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_friend_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_friend_list[6]})
<tr class="photo">
({t_loop from=$c_friend_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict" alt="({$item.nickname})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_friend_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname}) (({$item.friend_count}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>
({/if})
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_friend_list})&amp;target_c_member_id=({$target_c_member_id})">查看所有(({$c_friend_count})人)</a></li>
</ul>
</div>
</div>
({* }}} *})
({/if})

({if $inc_entry_point[5]})({$inc_entry_point[5]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'}) ({/if})

({if $group_list})
({$group_list|smarty:nodefaults})
({/if})

({if $c_commu_list})
({* {{{ homeNineTable *})
<div class="parts homeNineTable">
<div class="partsHeading"><h3>({$WORD_COMMUNITY})列表</h3></div>
({if $smarty.const.OPENPNE_USE_FLASH_LIST})
({capture assign=flashvars})({strip})
({foreach from=$c_commu_list item=item key=key})
({if $key > 0})&({/if})
pne_item({$key+1})_id=({$item.c_commu_id})
&pne_item({$key+1})_name=({$item.name|t_truncate:12:'..'|escape:url|smarty:nodefaults})
&pne_item({$key+1})_linkurl=({t_url m=pc a=page_c_home _urlencode=true _html=false})%26target_c_commu_id=({$item.c_commu_id})
&pne_item({$key+1})_imageurl=({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small _urlencode=true _html=false})
&pne_item({$key+1})_count=({$item.count_commu_members})
({/foreach})
({/strip})({/capture})
<script type="text/javascript" src="js/show_flash.js"></script>
<script type="text/javascript">
//<![CDATA[
show_flash('flash/list.swf', '({$flashvars})');
//]]>
</script>
({else})
<table>
({if $c_commu_list[0]})
<tr class="photo">
({t_loop from=$c_commu_list start=0 num=3})
<td>({if $item})({if $item.c_member_id_admin == $target_c_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" alt="({$item.name})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_commu_list start=0 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_commu_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_commu_list[3]})
<tr class="photo">
({t_loop from=$c_commu_list start=3 num=3})
<td>({if $item})({if $item.c_member_id_admin == $target_c_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" alt="({$item.name})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_commu_list start=3 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_commu_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
({if $c_commu_list[6]})
<tr class="photo">
({t_loop from=$c_commu_list start=6 num=3})
<td>({if $item})({if $item.c_member_id_admin == $target_c_member.c_member_id})<p class="crown"><img src="({t_img_url_skin filename=icon_crown})" alt="" /></p>({/if})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_logo_small})" alt="({$item.name})" /></a>({/if})</td>
({/t_loop})
</tr>
<tr class="text">
({t_loop from=$c_commu_list start=6 num=3})
<td>({if $item})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.name}) (({$item.count_commu_members}))</a>({/if})</td>
({/t_loop})
</tr>
({/if})
</table>
({/if})
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_com_list})&amp;target_c_member_id=({$target_c_member_id})">查看所有(({$user_count}))</a></li>
({if $common_commu_count})
<li><a href="({t_url m=pc a=page_f_com_list_common})&amp;target_c_member_id=({$target_c_member_id})">共通({$WORD_COMMUNITY})(({$common_commu_count}))</a></li>
({/if})
</ul>
</div>
</div>
({* }}} *})
({/if})

({if $inc_entry_point[6]})({$inc_entry_point[6]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'}) ({/if})

</div><!-- Left -->
<div id="Center">

({if $inc_entry_point[7]})({$inc_entry_point[7]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'}) ({/if})

({* {{{ homeMainTable *})
<div class="dparts homeMainTable"><div class="parts">
<div class="partsHeading"><h3>个人资料</h3>({if $is_h_prof})<p class="link"><a href="({t_url m=pc a=page_h_config_prof})">更改</a></p>({/if})</div>
<table>
({capture name="nick"})
<tr><th>({$WORD_NICKNAME})</th><td>({$target_c_member.nickname})</td></tr>
({/capture})
({capture name="birth"})
({if $target_c_member.age !== NULL && ($target_c_member.public_flag_birth_year == 'public' || ($target_c_member.public_flag_birth_year == 'friend' && ($is_friend || $is_h_prof)))})
<tr><th>年龄</th><td>({$target_c_member.age})岁 ({if $is_h_prof && $target_c_member.public_flag_birth_year == 'friend'})<span class="caution">※对({$WORD_MY_FRIEND})公开</span>({/if})</td></tr>
({/if})
({if $target_c_member.birth_month && $target_c_member.birth_day && ($target_c_member.public_flag_birth_month_day == 'public' || ($target_c_member.public_flag_birth_month_day == 'friend' && ($is_friend || $is_h_prof)))})
<tr><th>生日</th><td>({$target_c_member.birth_month})月({$target_c_member.birth_day})日 ({if $is_h_prof && $target_c_member.public_flag_birth_month_day == 'friend'})<span class="caution">※对({$WORD_MY_FRIEND})公开</span>({/if})</td></tr>
({/if})
({/capture})
({foreach from=$target_c_member.profile key=key item=item})
({if $item.public_flag != "private" && ($item.public_flag == "public" || ($item.public_flag == "friend" && ($is_friend || $is_h_prof)))})
({strip})
({if !$_cnt_nick && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_NICK && !$_cnt_birth && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_nick"})
({counter assign="_cnt_birth"})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({/if})
({if !$_cnt_nick && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_NICK})
({counter assign="_cnt_nick"})
({$smarty.capture.nick|smarty:nodefaults})
({/if})
({if !$_cnt_birth && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_birth"})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({/strip})
<tr><th>({$item.caption})</th><td>
({if $item.form_type == 'textarea'})
    ({$item.value|nl2br|t_url2cmd:'profile':$target_c_member_id|t_cmd:'profile'})
({elseif $item.form_type == 'checkbox'})
    ({$item.value|@t_implode:", "})
({else})
    ({$item.value})
({/if})

({if $is_h_prof && $item.public_flag == 'friend'})
<span class="caution">※对({$WORD_MY_FRIEND})公开</span>
({/if})
</td></tr>
({/if})
({/foreach})
({if !$_cnt_nick && !$_cnt_birth})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({else})
({if !$_cnt_nick})({$smarty.capture.nick|smarty:nodefaults})({/if})
({if !$_cnt_birth})({$smarty.capture.birth|smarty:nodefaults})({/if})
({/if})
({if $c_diary_list})
<tr class="friendRecentDiary"><th>最新({$WORD_DIARY})</th><td>
<ul class="articleList">
({foreach from=$c_diary_list item=item})
<li><span class="date">({$item.r_date|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})">({$item.subject|t_truncate:30}) (({$item.comment_count}))</a> ({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})<img src="({t_img_url_skin filename=icon_camera})" alt="写真あり" />({/if}) ({if $is_h_prof && $item.public_flag == "friend"})<span class="caution">※对({$WORD_MY_FRIEND})公开</span>({/if})</li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_c_member_id})">更多</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_rss_cache_list})
<tr class="friendRecentBlog"><th>最新Blog</th><td>
<ul class="articleList">
({foreach from=$c_rss_cache_list item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({$item.link})" target="_blank">({$item.subject|default:"&nbsp;"|t_truncate:30})</a></li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_diary_list})&amp;target_c_member_id=({$target_c_member_id})#blog">更多</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_review_list})
<tr><th>最新点评</th><td>
<ul class="articleList">
({foreach from=$c_review_list item=item})
<li><span class="date">({$item.r_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">({$item.title|t_truncate:30})</a></li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_review_list_member})&amp;target_c_member_id=({$target_c_member_id})">更多</a></li>
</ul></div>
</td></tr>
({/if})
({if $c_album_list})
<tr class="friendRecentAlbum"><th>最新相册</th><td>
<ul class="articleList">
({foreach from=$c_album_list item=item})
<li><span class="date">({$item.u_datetime|date_format:"%m月%d日"})</span><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})">({$item.subject|t_truncate:30})</a></li>
({/foreach})
</ul>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_album_list})&amp;target_c_member_id=({$target_c_member_id})">更多</a></li>
</ul></div>
</td></tr>
({/if})
</table>
</div></div>
({* }}} *})

({if $inc_entry_point[8]})({$inc_entry_point[8]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'}) ({/if})

({if $c_friend_comment_list})
({* {{{ friendIntroList *})
<div class="dparts friendIntroList"><div class="parts">
<div class="partsHeading"><h3>({$WORD_FRIEND})写的印象</h3></div>
<table>
({foreach from=$c_friend_comment_list item=item})
<tr>
<th><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /><br />({$item.nickname})</a></th>
<td>({$item.intro|t_truncate:36:"":3})</td>
</tr>
({/foreach})
</table>
<div class="block moreInfo">
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_intro})&amp;target_c_member_id=({$target_c_member_id})">查看所有</a></li>
</ul>
</div>
</div></div>
({* }}} *})
({/if})

({if $inc_entry_point[9]})({$inc_entry_point[9]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})

</div><!-- Center -->
</div><!-- LayoutA -->
