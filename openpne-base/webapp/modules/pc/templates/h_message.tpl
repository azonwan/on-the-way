<div id="LayoutB">

<div id="Left">

({* {{{ sideNav *})
<div class="parts sideNav">

<div class="item pageNav"><ul>
({if $box != "inbox"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=inbox">收信箱</a></li>
({else})<li class="looking"><a href="({t_url m=pc a=page_h_message_box})&amp;box=inbox">收信箱</a></li>
({/if})
({if $box != "outbox"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=outbox">送信箱</a></li>
({else})<li class="looking"><a href="({t_url m=pc a=page_h_message_box})&amp;box=outbox">送信箱</a></li>
({/if})
({if $box != "savebox"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=savebox">草稿</a></li>
({else})<li class="looking"><a href="({t_url m=pc a=page_h_message_box})&amp;box=savebox">草稿</a></li>
({/if})
({if $box != "trash"})<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=trash">回收站</a></li>
({else})<li class="looking"><a href="({t_url m=pc a=page_h_message_box})&amp;box=trash">回收站</a></li>
({/if})
</ul></div>

</div>
({* }}} *})

</div><!-- Left -->
<div id="Center">

({* {{{ messageDetailBox *})
<div class="dparts messageDetailBox"><div class="parts">
<div class="partsHeading"><h3>短信详情</h3></div>

({if $prev_c_message_id || $next_c_message_id})
<div class="block prevNextLinkLine">
({if $prev_c_message_id})<p class="prev"><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$prev_c_message_id})&amp;({if $box == 'outbox'})box=({$box})({else})jyusin_c_message_id=({$prev_c_message_id})({/if})">上一页</a></p>({/if})
({if $next_c_message_id})<p class="next"><a href="({t_url m=pc a=page_h_message})&amp;target_c_message_id=({$next_c_message_id})&amp;({if $box == 'outbox'})box=({$box})({else})jyusin_c_message_id=({$next_c_message_id})({/if})">下一页</a></p>({/if})
</div>
({/if})

<table>
<tr><td class="photo" rowspan="3"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({if $c_message.is_received})({$c_message.c_member_id_from})({else})({$c_message.c_member_id_to})({/if})">
<img src="({t_img_url filename=$c_message.image_filename_disp w=120 h=120 noimg=no_image})" alt="" /></a></td>
<th>({if $c_message.is_received})发信人({else})地址({/if})</th>
<td>({if $c_message.is_received})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_message.c_member_id_from})">({$c_message.c_member_nickname_from})</a>
({else})<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_message.c_member_id_to})">({$c_message.c_member_nickname_to})</a>({/if})</td>
</tr><tr>
<th>日期</th>
<td>({$c_message.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</td>
</tr><tr>
<th>题目</th>
<td>({$c_message.subject})</td>
</tr>
</table>

<div class="block">
({if $c_message.image_filename_1||$c_message.image_filename_2||$c_message.image_filename_3})
<ul class="photo">
<li>({if $c_message.image_filename_1})<a href="({t_img_url filename=$c_message.image_filename_1})" target="_blank"><img src="({t_img_url filename=$c_message.image_filename_1 w=120 h=120})" alt="" /></a>({/if})</li>
<li>({if $c_message.image_filename_2})<a href="({t_img_url filename=$c_message.image_filename_2})" target="_blank"><img src="({t_img_url filename=$c_message.image_filename_2 w=120 h=120})" alt="" /></a>({/if})</li>
<li>({if $c_message.image_filename_3})<a href="({t_img_url filename=$c_message.image_filename_3})" target="_blank"><img src="({t_img_url filename=$c_message.image_filename_3 w=120 h=120})" alt="" /></a>({/if})</li>
</ul>
({/if})
<p class="text">({$c_message.body|nl2br|t_url2cmd:'message':$c_message.c_member_id_from|t_cmd:'message'})</p>
</div>

({if $c_message.filename && $smarty.const.OPENPNE_USE_FILEUPLOAD})
<div class="block attachFile"><ul>
<li><a href="({t_url m=pc a=do_h_message_file_download})&amp;target_c_message_id=({$c_message.c_message_id})&amp;sessid=({$PHPSESSID})">({$c_message.original_filename})</a></li>
</ul></div>
({/if})

<div class="operation">
({t_form_block m=pc a=do_h_message_box_delete_message _attr='class="delete"'})
<input type="hidden" name="c_message_id[]" value="({$c_message.c_message_id})" />
<input type="hidden" name="box" value="({$box})" />
<ul class="moreInfo button">
({if $box == 'trash'})
<li><input type="submit" class="input_submit" name="move" value="返 回" /></li>
({/if})
<li><input type="submit" class="input_submit" name="remove" value="删 除" /></li>
</ul>
({/t_form_block})
({if ($box == 'inbox' || !$box) && $c_message.c_member_nickname_from})
({t_form_block m=pc a=page_f_message_send _attr='class="send"'})
<input type="hidden" name="target_c_message_id" value="({$c_message.c_message_id})" />
<input type="hidden" name="jyusin_c_message_id" value="({$jyusin_c_message_id})" />
<input type="hidden" name="target_c_member_id" value="({$c_message.c_member_id_from})" />
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" name="hensin2" value="回 信" /></li>
</ul>
({/t_form_block})
({/if})
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutB -->
