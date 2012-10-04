<div id="LayoutC">
<div id="Center">

({* {{{ commentList *})
<div class="dparts commentList"><div class="parts">
<div class="partsHeading"><h3>删除下列相册留言？</h3></div>

({foreach from=$target_album_comment_list item=target_album_comment})
<dl>
<dt>({$target_album_comment.r_datetime|date_format:"%m-%d-%Y<br>%H:%M"})</dt>
<dd>
({if $target_album_comment.nickname})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_album_comment.c_member_id})">({$target_album_comment.nickname|default:"&nbsp;"})</a>
({else})
&nbsp;
({/if})
<div class="body">
<p class="text">
({$target_album_comment.body|nl2br|default:"&nbsp;"})
</p>
</div>
</dd>
</dl>
({/foreach})

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_fh_album_delete_c_album_comment})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_album_comment_id" value="({$target_c_album_comment_id})">
({foreach from=$target_album_comment_list item=target_album_comment})
<input type="hidden" name="target_c_album_comment_id[]" value="({$target_album_comment.c_album_comment_id})">
({/foreach})
<input type="submit" class="input_submit" value=" 删除 " />
({/t_form_block})
</li><li>
({t_form_block _method=get m=pc a=page_fh_album})
<input type="hidden" name="target_c_album_id" value="({$target_album.c_album_id})">
<input type="submit" class="input_submit" value=" 取消 " />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
