({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="点评管理"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>点评管理</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('review_list','page')})" />
<h3 class="item">检索关键字</h3>
<input class="basic" type="text" name="keyword" value="({$keyword})" />
<span class="textBtnS"><input type="submit" value="检索" /></span>
</form>

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('review_list','page')})" />
<h3 class="item">ID検索</h3>
<input class="basic" type="text" name="target_c_review_comment_id" value="({$target_c_review_comment_id})" />
<span class="textBtnS"><input type="submit" value="检索" /></span>
</form>

({if !$review_list})

<p class="info">符合条件的点评不存在</p>

({else})

({capture name="pager"})
<div class="listControl">
<p class="display">
显示({$total_num})件中的 ({$start_num})-({$end_num})件
</p>
<p class="listMove">
({if $page_list})({foreach from=$page_list item=item})({if $page!=$item})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('review_list','page')})&amp;page=({$item})&amp;keyword=({$keyword_encode})">({$item})</a>({else})<b>({$item})</b>({/if})&nbsp;&nbsp;({/foreach})&nbsp;({/if})
({if $prev})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('review_list','page')})&amp;page=({$page-1})&amp;keyword=({$keyword_encode})">＜＜前</a>　({/if})
({if $next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('review_list','page')})&amp;page=({$page+1})&amp;keyword=({$keyword_encode})">后＞＞</a>({/if})
</p>
</div>
({/capture})

<div class="listControl" id="pager01">
({$smarty.capture.pager|smarty:nodefaults})
</div>

({foreach from=$review_list item=item})
<table class="basicType2">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
({$item.c_review_comment_id})
</td>
</tr>
({****})
<tr>
<th>标题</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})" target="_blank">({$item.c_review.title})</a>
</td>
</tr>
({****})
<tr>
<th>说明</th>
<td>
({$item.c_review.release_date})<br />
({$item.c_review.manufacturer})<br />
({$item.c_review.artist})({$item.c_review.author})
</td>
</tr>
({****})
<tr>
<th>点评</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" target="_blank">({$item.c_member.nickname})</a>
</td>
</tr>
({****})
<tr>
<th>发表日</th>
<td>
({$item.r_datetime})
</td>
</tr>
({****})
<tr>
<th>内容</th>
<td width="500">
({$item.body|nl2br})
</td>
</tr>
({****})
<tr>
<td class="formbutton" colspan="2">
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_review')})" />
<input type="hidden" name="target_c_review_comment_id" value="({$item.c_review_comment_id})" />
<span class="textBtnS"><input type="submit" value="删除" /></span>
</form>
</td>
</tr>
</tbody>
</table>
({/foreach})

<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
</div>

({/if})

({$inc_footer|smarty:nodefaults})
