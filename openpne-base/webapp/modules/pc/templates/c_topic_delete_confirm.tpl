<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>真的要删除吗？</h3>（请注意：该帖回复也将被删除。）</div>

<div class="block">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_bbs_delete_c_commu_topic})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})" />
<input type="submit" class="input_submit" value="删　除" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=pc a=page_c_topic_edit})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})" />
<input type="submit" class="input_submit" value="取　消" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
