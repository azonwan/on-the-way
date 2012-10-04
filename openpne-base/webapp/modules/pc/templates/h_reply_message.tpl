({assign var=no_use_alert value=true})
<div id="LayoutC">
<div id="Center">

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({if $msg == 1})发送消息({elseif $msg == 2})消息保存至草稿箱({else})&nbsp;({/if})</h3></div>
<div class="block">
<p>({if $msg == 1})送信完成。({if $inc_entry_point[3]})({$inc_entry_point[3]|smarty:nodefaults|t_url2cmd:'entry_point'|t_cmd:'entry_point'})({/if})
({elseif $msg == 2})短信保存为草稿了。
({else})&nbsp;({/if})</p>
</div>
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
({if $msg == 1})
<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=outbox">已发送短信一览</a></li>
({elseif $msg == 2})
<li><a href="({t_url m=pc a=page_h_message_box})&amp;box=savebox">草稿箱短信一览</a></li>
({/if})
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
