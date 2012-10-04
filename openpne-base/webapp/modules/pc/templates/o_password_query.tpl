<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>密码再发行</h3></div>

<div class="partsInfo">
<p>请输入登录用的邮件地址和密码提示的问题及答案。<br />输入正确时系统会把新密码发送到登录时使用的邮件地址中。</p>
</div>

({t_form_block m=pc a=do_o_password_query})
<table>
<tr><th>邮件地址</th><td><input type="text" class="text" name="pc_address" value="" /></td></tr>
<tr><th>密码提示问题</th><td>
<select name="c_password_query_id">
<option value="" selected="selected">请选择</option>
({foreach from=$c_password_query_list key=key item=item})
<option value="({$key})">({$item})</option>
({/foreach})
</select>
</td></tr>
<tr><th>密码提示答案</th><td><input type="text" class="text" name="c_password_query_answer" value="" /></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　送　信　" /></li>
</ul>
</div>
({/t_form_block})

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
