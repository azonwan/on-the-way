<div id="LayoutC">
<div id="Center">

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>会员登录</h3></div>
<div class="block">
<p>使用此服务请遵守以下规则。<br />使用者同意会员规则后，完成会员登录。</p>
</div>
</div></div>
({* }}} *})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>使用规则</h3></div>
<div class="block">
({if $c_siteadmin != ""})
<p>({$c_siteadmin|t_url2a|nl2br})</p>
({else})
<p>使用规则正在读取中。</p>
({/if})
</div>
</div></div>
({* }}} *})

({* {{{ buttonLine *})
<div class="parts buttonLine">
({t_form_block m=pc a=page_h_regist_prof})
<input type="hidden" name="mode" value="input" />
<input type="submit" class="input_submit" value="同意登录手续" />
({/t_form_block})
</div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
