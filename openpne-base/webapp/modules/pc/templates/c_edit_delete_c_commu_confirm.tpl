<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>可以删除吗？</h3></div>

<div class="block">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_edit_delete_c_commu})
<input type="hidden" name="target_c_commu_id" value="({$c_commu_id})" />
<input type="submit" class="input_submit" value="　删　除　" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=pc a=page_c_edit})
<input type="hidden" name="target_c_commu_id" value="({$c_commu_id})" />
<input type="hidden" name="target_c_member_id" value="({$target_c_diary.c_member_id})" />
<input type="submit" class="input_submit" value="取　消" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
