<div id="LayoutC">
<div id="Center">

({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>要发表以下点评吗？</h3></div>

({foreach from=$c_member_review item=review})
<dl>
<dt><a href="({$review.url})" target="_blank"><img src="({if $review.image_medium})({$review.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" /></a></dt>
<dd>
<table><tr class="title">
<th>标  题</th>
<td>({$review.title})</td>
</tr><tr>
<th>说  明</th>
<td>
({if $review.release_date})({$review.release_date})<br />({/if})
({if $review.manufacturer})({$review.manufacturer})<br />({/if})
({if $review.author})({$review.author})<br />({/if})
</td>
</tr><tr>
<th>点评内容</th>
<td>({$review.body|nl2br})</td>
</tr><tr>
<th>发表时间</th>
<td>({$review.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</td>
</tr><tr>
<th>满意度</th>
<td><img src="({t_img_url_skin filename=satisfaction_level_`$review.satisfaction_level`})" alt="" /></td>
</tr><tr>
<th>分  类</th>
<td>({$review.category_disp})</td>
</tr>
</table>
</dd>
</dl>
({/foreach})

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_member_review_insert_c_commu_review})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
({foreach from=$c_review_id item=item})
<input type="hidden" name="c_review_id[]" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="是" />
({/t_form_block})
</li>
<li>
({t_form_block _method=get m=pc a=page_c_member_review_add})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<input type="submit" class="input_submit" value="否" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})">[({$c_commu.name})]返回({$WORD_COMMUNITY})首页</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
