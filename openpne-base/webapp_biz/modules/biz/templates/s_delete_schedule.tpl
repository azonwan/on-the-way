<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>真的要删除吗？</h3></div>
<div class="block">
<ul class="moreInfo button">
<li>
({t_form_block m=biz a=do_s_delete_schedule})
<input type="hidden" name="shisetsu_id" value="({$target_id})" />
<input type="submit" class="input_submit" value="　是　" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=biz a=page_s_list})
<input type="submit" class="input_submit" value="　否　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
