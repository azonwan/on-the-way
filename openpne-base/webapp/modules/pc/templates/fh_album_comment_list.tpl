<div id="LayoutC">
<div id="Center">
({* {{{ formTable *})
<div class="dparts recentList"><div class="parts">
<div class="partsHeading"><h3>最近的留言一览</h3></div>



({if $new_comment_list})
<div class="pagerRelative">共({$ltag.number_for})({$pager.end})条留言</div>

({foreach from=$new_comment_list item=new_comment })
<dl>
<dt>
({$new_comment.r_datetime|date_format:"%m-%d-%Y %H:%M"})
</dt>
<dd>
<a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$new_comment.c_album_id})#comment">
({$new_comment.body|t_truncate:"36"})</a> 
({if $new_comment.nickname})(({$new_comment.nickname}))({/if})
</dd>
</dl>
({/foreach})
({else})
<tr>
<td style="width:634px;" align="center" class="bg_02">
<div class="padding_w_m"><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;没有任何人留言
&nbsp;<br/>&nbsp;
</div>
</td>
</tr>
({/if})
<tr>
<td style="width:634px;" class="bg_02" align="right" valign="middle">
<div class="padding_s">
({if $is_prev})
<a href="({t_url m=pc a=page_fh_album_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page})&amp;direc=-1">({$ltag.album_forward})</a>&nbsp;&nbsp;
({/if})


<div class="pagerRelative">共({$ltag.number_for})({$pager.end})条留言</div>
({if $is_next})
&nbsp;&nbsp;<a href="({t_url m=pc a=page_fh_album_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page})&amp;direc=1">({$ltag.album_backward})</a>
({/if})
</div>
</td>
</tr>
</div>
</div>
</div>	
</td>
</tr>

</form>

</div>
</div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
