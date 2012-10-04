<div id="LayoutC">
<div id="Center">

({* {{{ descriptionBox *})
<div class="dparts descriptionBox"><div class="parts">
<div class="partsHeading"><h3>会员注册</h3></div>
<div class="block">
<p>请仔细阅读使用条款，<br />由使用者本人同意后，再点击“同意”按钮。</p>
</div>
</div></div>
({* }}} *})

({* {{{ descriptionBox *})
<div class="dparts descriptionBox"><div class="parts">
<div class="partsHeading"><h3>使用规则</h3></div>
<div class="block">
<p>
({if $c_siteadmin != ""})
({$c_siteadmin|t_url2a|nl2br})
({else})
使用规则正在在准备之中。
({/if})
</p>
</div>
</div></div>
({* }}} *})

({* {{{ buttonLine *})
<div class="parts buttonLine">
({if $c_member_session})
({t_form_block m=pc a=page_o_invite_insert_c_member_pre})
请输入邮箱地址：<input type="text" class="input_text" name="mail" value="" size="40" />
<input type="hidden" name="mode" value="input" />
<input type="hidden" name="target_c_member_id" value="({$c_member_id})" />
<input type="hidden" name="sid" value="({$sid})" />
<input type="submit" class="input_submit" value="同意" />
({/t_form_block})
({else})
({t_form_block m=pc a=page_o_regist_prof})
<input type="hidden" name="mode" value="input" />
<input type="hidden" name="sid" value="({$sid})" />
<input type="submit" class="input_submit" value="同意" />
({/t_form_block})
({/if})
</div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
