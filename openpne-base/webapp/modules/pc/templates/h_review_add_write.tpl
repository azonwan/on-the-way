<div id="LayoutC">
<div id="Center">

({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>点评</h3></div>
({t_form_block m=pc a=page_h_review_add_write_confirm})
<input type="hidden" name="asin" value="({$asin})" />
<input type="hidden" name="category_id" value="({$category_id})" />

<dl>
<dt>
<a href="({$product.DetailPageURL})" target="_blank"><img src="({if $product.MediumImage})({$product.MediumImage.URL})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" /></a>
<span><a href="({$product.DetailPageURL})" target="_blank">浏览详情</a></span>
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
</td>
</tr><tr>
<th>点   评</th>
<td><textarea name="body" rows="8" cols="40">({$body})</textarea></td>
</tr><tr>
<th>满 意 度</th>
<td>
<select name="satisfaction_level">
<option value="0">----</option>
({html_options options=$satisfaction selected=$satisfaction_level})
</select>
<p>评价：５等级（５是最高，１是最低）</p>
</td>
</tr></table>
</dd>
</dl>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value=" 确认 " /></li>
</ul>
</div>

({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
