<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>以下的内容可以吗？</h3></div>

<table>
<tr><th>点   评</th><td>({$body|nl2br})</td></tr>
<tr><th>满 意 度</th><td><img src="({t_img_url_skin filename=satisfaction_level_`$satisfaction_level`})" alt="" /></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_review_add})
<input type="hidden" name="category_id" value="({$category_id})" />
<input type="hidden" name="asin" value="({$asin})" />
<input type="hidden" name="body" value="({$body})" />
<input type="hidden" name="satisfaction_level" value="({$satisfaction_level})" />
<input type="submit" class="input_submit" value="　发   表　" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=pc a=page_h_review_add_write})
<input type="hidden" name="category_id" value="({$category_id})" />
<input type="hidden" name="asin" value="({$asin})" />
<input type="hidden" name="body" value="({$body})" />
<input type="hidden" name="satisfaction_level" value="({$satisfaction_level})" />
<input type="submit" class="input_submit" value="　修　改　" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
