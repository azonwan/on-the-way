<div id="LayoutC">
<div id="Center">

({* {{{ searchFormBox *})
<div class="dparts searchFormBox"><div class="parts">
<div class="partsHeading"><h3>发表点评</h3></div>
<div class="item">

<p class="desc">检索项发表评论的商品。<br />
输入关键字、请选择符合条件的分类。</p>

({t_form_block m=pc a=page_h_review_add})
<input type="hidden" name="search_flag" value="1" />
<p class="form">
<label for="keyword">关键字</label> <input type="text" class="text" name="keyword" id="keyword" value="({$keyword})" size="15" />
<label for="category_id">分类</label> <select name="category_id" id="category_id">
<option value="" selected="selected">选择</option>
({html_options options=$category_disp selected=$category_id})
</select>
<input type="submit" class="input_submit" name="button" value="　检 索　" />
</p>
({/t_form_block})

</div>
</div></div>
({* }}} *})

({if $search_result})
({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>({$keyword})的检索结果</h3><p>*** ({$total_num})条符合条件。</p></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_review_add})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;search_flag=1&amp;category_id=({$category_id})&amp;page=({$page-1})">上一页</a></p>({/if})
<p class="number">({$start_num})条～({$end_num})条 记录</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_review_add})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;search_flag=1&amp;category_id=({$category_id})&amp;page=({$page+1})">下一页</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$search_result item=product key=key})
<dl>
<dt>
<a href="({$product.DetailPageURL})" target="_blank"><img src="({if $product.MediumImage})({$product.MediumImage.URL})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" /></a>
<span><a href="({$product.DetailPageURL})" target="_blank">浏览详细</a></span>
</dt>
<dd>
<table><tr class="title">
<th>标   题</th>
<td>({$product.ItemAttributes.Title})</td>
</tr><tr>
<th>说   明</th>
<td>
({if $product.ItemAttributes.PublicationDate})({$product.ItemAttributes.PublicationDate})<br />({/if})
({if $product.ItemAttributes.Manufacturer})({$product.ItemAttributes.Manufacturer})<br />({/if})
({$product.artist})({$product.author})
<p class="operation"><a href="({t_url m=pc a=page_h_review_add_write})&amp;category_id=({$category_id})&amp;asin=({$product.ASIN})">发表点评</a></p>
</td>
</tr>
</table>
</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
