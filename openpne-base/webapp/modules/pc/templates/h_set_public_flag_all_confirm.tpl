<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>({$WORD_DIARY})公开范围总体设定</h3></div>

<div class="block">
({t_form_block m=pc a=do_h_set_public_flag_all})
<input type="hidden" name="public_flag_diary_all" value="({$public_flag_diary_all})" />
<p>設定内容 ： ({if $public_flag_diary_all == 'private'})不公开({elseif $public_flag_diary_all == 'friend'})对({$WORD_MY_FRIEND})公开({else})对全体公开({/if})</p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" name="ok" value="设定一览" /></li>
<li><input type="submit" class="input_submit" value="取消" /></li>
</ul>
({/t_form_block})
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
