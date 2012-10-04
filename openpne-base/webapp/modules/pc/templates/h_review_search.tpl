<div id="LayoutC">
<div id="Center">

({* {{{ searchFormBox *})
<div class="dparts searchFormBox"><div class="parts">
<div class="partsHeading"><h3>点评检索排列</h3></div>
<div class="item">

({t_form_block m=pc a=page_h_review_search})
<p class="form">
<span class="label">排列</span>
<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;category=({$category})&amp;orderby=r_num">登录数順</a>
|
<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;category=({$category})&amp;orderby=r_datetime">创建日順</a>
</p>

<p class="form">
<label for="keyword">关键字</label>
<input type="text" class="text" name="keyword" id="keyword" value="({$keyword})" size="15" />
<label for="category">分类</label>
<select name="category" id="category">
<option value="">无指定</option>
({html_options options=$category_disp selected=$category})
</select>
<input type="submit" class="input_submit" value=" 检 索 " />
</p>
({/t_form_block})

<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_review_add})">发表点评</a></li>
</ul>

<div class="block">
<dl class="category">
<dt><span class="label">分类</span></dt>
<dd><p>
({foreach from=$category_disp key=key item=item})
({if $key!=1}) - ({/if})
<a href="({t_url m=pc a=page_h_review_search})&amp;category=({$key})">({$item})</a>
({/foreach})
</p></dd>
</dl>
</div>

</div>
</div></div>
({* }}} *})

({if $total_num})
({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>点评一览</h3><p>*** ({$total_num})条符合条件。</p></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword})&amp;category=({$category})&amp;orderby=({$orderby})&amp;page=({$page-1})">上一页</a></p>({/if})
<p class="number">({$start_num})条～({$end_num})条 记录</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword})&amp;category=({$category})&amp;orderby=({$orderby})&amp;page=({$page+1})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$result item=item})
<dl>
<dt>
<a href="({$item.url})" target="_blank"><img src="({if $item.image_medium})({$item.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" /></a>
<span><a href="({$item.url})" target="_blank">浏览详细</a></span>
</dt>
<dd>
<table><tr class="title">
<th>标题</th>
<td>({$item.title})</td>
</tr><tr>
<th>最新点评</th>
<td>
({$item.body|nl2br})
<p class="operation"><a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">浏览全部点评 (({$item.write_num|default:0}))</a></p>
</td>
</tr><tr>
<th>发表时间</th>
<td>({$item.r_datetime2|date_format:"%Y年%m月%d日 %H:%M"})</td>
</tr></table>
</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>点评一览</h3></div>
<div class="block">
<p>没有符合条件的点评。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
