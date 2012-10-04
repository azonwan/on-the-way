<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>加入此({$WORD_COMMUNITY})</h3></div>

<div class="block">
<p>真的要加入({$c_commu.name|default:""})吗？</p>
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_inc_join_c_commu})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<input type="submit" class="input_submit" value="加  入" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=pc a=page_c_home})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<input type="submit" class="input_submit" value="不加入" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
