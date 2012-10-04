<div id="LayoutB">

<div id="Left">

({* {{{ rankingSideNav *})
<div class="parts rankingSideNav">
<div class="item">
<div class="partsHeading"><h3>被访问数No1</h3></div>
<p>昨天被访问次数较多的会员排行。</p>
<p class="link"><a href="({t_url m=pc a=page_h_ranking})">被访问数No1</a></p>
</div>
<div class="item">
<div class="partsHeading"><h3>({$WORD_MY_FRIEND})数No1</h3></div>
<p>登录({$WORD_MY_FRIEND})数目较多的会员排行。
</p>
<p class="link"><a href="({t_url m=pc a=page_h_ranking})&amp;kind=friend">({$WORD_MY_FRIEND})数No1</a></p>
</div>

<div class="item">
<div class="partsHeading"><h3>参加人数No１({$WORD_COMMUNITY})</h3></div>
<p>参加者较多的({$WORD_COMMUNITY})排行榜。</p>
<p class="link"><a href="({t_url m=pc a=page_h_ranking})&amp;kind=com_member">参加人数No１<br />显示({$WORD_COMMUNITY})</a></p>
</div>

<div class="item">
<div class="partsHeading"><h3>活跃度No１({$WORD_COMMUNITY})</h3></div>
<p>昨日新增帖子数最多({$WORD_COMMUNITY})的排行榜。</p>
<p class="link"><a href="({t_url m=pc a=page_h_ranking})&amp;kind=com_comment">活跃度No１<br />显示({$WORD_COMMUNITY})</a></p>
</div>
</div>
({* }}} *})

</div><!-- Left -->
<div id="Center">

({foreach from=$rank_list key=rank item=list name=ranking})
({if $rank == 1})({assign var=size value=120})({else})({assign var=size value=76})({/if})

({* {{{ rankingList *})
<div class="dparts rankingList"><div class="parts">
({if $rank == 1})
<div class="partsHeading"><p>({strip})
<strong>
({if $kind == "ashiato"})
被访问数No1的会员
({elseif $kind == "friend"})
({$WORD_MY_FRIEND})数No1会员
({elseif $kind == "com_member"})
参加人数No１({$WORD_COMMUNITY})
({elseif $kind == "com_comment"})
活跃度No1({$WORD_COMMUNITY})
({/if})
是 </strong>

({if $kind == "ashiato" || $kind == "friend"})
({$list[0].c_member.nickname}) 
({else})『({$list[0].c_commu.name})』
({/if})
。
({/strip})</p></div>
({/if})
({if $rank > 1})<div class="ditem"><div class="item">({/if})
({foreach from=$list item=item})
<table>
<tr><td class="photo" rowspan="({if $kind == "ashiato" || $kind == "friend"})2({else})4({/if})">({strip})
({if $kind == "ashiato" || $kind == "friend"})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.c_member.image_filename w=$size h=$size noimg=no_image})" alt="" /></a>
({else})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})"><img src="({t_img_url filename=$item.c_commu.image_filename w=$size h=$size noimg=no_logo})" alt="" /></a>
({/if})
({/strip})</td>
<th>第({$rank})位</th>
<td class="name">({strip})
({if $kind == "ashiato" || $kind == "friend"})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">({$item.c_member.nickname})</a> 
({else})
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})">({$item.c_commu.name})</a>
({/if})
 ：
({if $kind == "ashiato"})
被访问({$item.count})次
({elseif $kind == "friend"})
({$item.count})人
({elseif $kind == "com_member"})
({$item.count})人
({elseif $kind == "com_comment"})
话题({$item.count})个
({/if})
({/strip})</td>
</tr>
({if $kind == "ashiato" || $kind == "friend"})
<tr>
<th>自我介绍</th>
<td>({$item.c_member.profile.self_intro.value|t_truncate:36:"":3})</td>
</tr>
({elseif $kind == "com_member" || $kind == "com_comment"})
<tr>
<th>分类</th>
<td>({$item.c_commu.c_commu_category.name})</td>
</tr>
<tr>
<th>管理者</th>
<td>({$item.c_commu.c_member_admin.nickname})</td>
</tr>
<tr>
<th>说明</th>
<td>({$item.c_commu.info|t_truncate:36:"":3})</td>
</tr>
({/if})
</table>
({/foreach})
({if $rank > 1})</div></div>({/if})
</div></div>
({* }}} *})

({/foreach})

</div><!-- Center -->
</div><!-- LayoutB -->
