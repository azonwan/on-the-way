<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>回复确认</h3></div>
<div class="partsInfo">
<p>是否确认发表以下内容？</p>
</div>
<table>
<tr><th>内  容</th><td>({$topic_write.body|nl2br|t_url2cmd:'community':$u|t_cmd:'community'})</td></tr>
({if $topic_write.image_filename1})
<tr><th>照　片 1</th><td>({$topic_write.image_filename1})</td></tr>
({/if})
({if $topic_write.image_filename2})
<tr><th>照　片 2</th><td>({$topic_write.image_filename2})</td></tr>
({/if})
({if $topic_write.image_filename3})
<tr><th>照　片 3</th><td>({$topic_write.image_filename3})</td></tr>
({/if})
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
({if $topic_write.filename4_original_filename})
<tr><th>文件</th><td>({$topic_write.filename4_original_filename})</td></tr>
({/if})
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_topic_write_insert_c_commu_topic_comment})
({foreach from=$topic_write key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="发  表" />
({/t_form_block})
</li>
<li>
({t_form_block _form_action=#commentForm m=pc a=page_c_topic_detail})
({foreach from=$topic_write key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="修　改" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
