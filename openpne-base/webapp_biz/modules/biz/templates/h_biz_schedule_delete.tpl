<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>真的要删除此计划吗？</h3></div>
<div class="block">
<ul class="moreInfo button">
<li>
({t_form_block m=biz a=do_h_biz_schedule_delete})
<input type="hidden" name="schedule_id" value="({$schedule_id})" />
<input value="({$is_rep})" type="hidden" name="is_rep" />
<input type="submit" class="input_submit" value="　是　" />
({/t_form_block})
</li><li>
({t_form_block m=biz a=page_fh_biz_schedule_view})
<input type="hidden" name="id" value="({$schedule_id})" />
<input type="submit" class="input_submit" value="　否　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
