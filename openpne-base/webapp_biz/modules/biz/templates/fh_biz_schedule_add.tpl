<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>任务计划</h3></div>

({t_form_block _enctype=file m=biz a=do_fhg_biz_schedule_add})
<input type="hidden" name="target_c_member_id" value="({$target_c_member_id})" />

<table>
<tr>
<th>持续周期</th>
<td>
<div class="checkList"><ul>
<li><input type='radio' name='sc_rp' value='0' ({if !$sc_rp}) checked="checked"({/if}) />按天计算</li>
<li><select name='sc_bn'>
({section name=i loop=$bn_num})
<option value="({$bn_num[i]})" ({if $bn_num[i]==$sc_bn}) selected="selected"({/if})>({$bn_num[i]})天</option>
({/section})
</select></li>
</ul></div>
<div class="checkList"><ul>
<li><input type='radio' name='sc_rp' value='true' ({if $sc_rp}) checked="checked"({/if}) />按周计算</li>
<li><select name='sc_rcount'>
({section name=i loop=$rp_count})
<option value='({$rp_count[i]})' ({if $rp_count[i]==$sc_rcount}) selected="selected"({/if})>({$rp_count[i]})周</option>
({/section})
</select></li>
</ul></div>
<div class="checkList">
请选择每周内的哪几天实施计划：
({section name=i loop=$wk})
<input type='checkbox' name="sc_rwk[]" value='({$smarty.section.i.index})' ({if $sc_rwk_chk[i].checkflag}) checked="checked"({/if}) />({$wk[i]})
({/section})
</div>
</td>
</tr><tr>
<th>开始日期</th>
<td>
<select name='sc_b_year'>
({$years|smarty:nodefaults})
</select>
<select name='sc_b_month'>
({$monthes|smarty:nodefaults})
</select>
<select name='sc_b_date'>
({$days|smarty:nodefaults})
</select>
</td>
</tr><tr>
<th>时间</th>
<td>
<select name='sc_b_hour'>
<option value='' ({if $begin_hour == null}) selected="selected"({/if})>--时</option>
({section name=i loop=$hours})
<option value="({$hours[i]|string_format:"%02d"})" ({if $begin_hour})({if ($hours[i]|string_format:"%02d") == $begin_hour}) selected="selected"({/if})({/if})>({$hours[i]})时</option>
({/section})
</select>
<select name='sc_b_minute'>
<option value=''>--分</option>
({section name=i loop=$mins})
<option value="({$mins[i]|string_format:"%02d"})" ({if $begin_min})({if ($mins[i]|string_format:"%02d") == $begin_min}) selected="selected"({/if})({/if})>({$mins[i]})分</option>
({/section})
</select>～
<select name='sc_f_hour'>
<option value=''>--时</option>
({section name=i loop=$hours})
<option value="({$hours[i]|string_format:"%02d"})" ({if $finish_hour})({if ($hours[i]|string_format:"%02d") == $finish_hour}) selected="selected"({/if})({/if})>({$hours[i]})时</option>
({/section})
</select>
<select name='sc_f_minute'>
<option value=''>--分</option>
({section name=i loop=$mins})
<option value="({$mins[i]|string_format:"%02d"})" ({if $finish_min})({if ($mins[i]|string_format:"%02d") == $finish_min}) selected="selected"({/if})({/if})>({$mins[i]})分</option>
({/section})
</select>
</td>
</tr><tr>
<th>标题</th>
<td>
<input class="text" type='text' name='sc_title' size="60" value="({$sc_title})" />
</td>
</tr><tr>
<th>内容</th>
<td>
<textarea class="text" name='sc_memo' cols="50" rows="5">({$sc_memo})</textarea>
</td>
</tr><tr>
<th>参加者<br />※默认为对全体公开</th>
<td>
<div class="checkList"><ul>
({foreach from=$members item=item name=mem})
({if $item})
<li><input name='sc_j_mem[]' value='({$item.c_member_id})' type='checkbox' ({if $item.checkflag}) checked="checked"({/if}) />({$item.nickname})</li>
({/if})
({if !$smarty.foreach.mem.last && $smarty.foreach.mem.iteration%3 == 0})</ul><ul>({/if})
({/foreach})
</ul></div>
</td>
</tr><tr>
<th>公开范围</th>
<td>
<div class="checkList"><ul>
<li><input type='radio' name='public_flag' value='public' checked="checked" />全体公开</li>
</ul></div>
<div class="checkList"><ul>
<li><input type='radio' name='public_flag' value='private' />只对参加者公开</li>
</ul></div>
</td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type='submit' name='entry' value='确定'({if $is_g}) onclick="allSelect(this.form, 'sc_j_mem[]')"({/if}) /></li>
</ul>
</div>

({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
