<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>计划内容修改</h3></div>

({t_form_block _enctype=file m=biz a=do_fh_biz_schedule_edit})
<input type="hidden" name="schedule_id" value="({$schedule_id})" />

<table>
<tr>
<th>计划内容修改</th>
<td>
<div class="checkList"><ul>
<li><input type='radio' name='sc_rp' value='0' ({if !$is_rep}) checked="checked"({/if}) />返回</li>
<li><select name='sc_bn'>
({section name=i loop=$bn_num})
<option value="({$bn_num[i]})" ({if $banner == $bn_num[i]}) selected="selected"({/if})>({$bn_num[i]})日间</option>
({/section})
</select></li>
</ul></div>
<div class="checkList"><ul>
<li><input type='radio' name='sc_rp' value='true' ({if $is_rep}) checked="checked"({/if}) />返回</li>
<li><select name='sc_rcount'>
({section name=i loop=$rp_count})
<option value='({$rp_count[i]})' ({if $repeat_term == $rp_count[i]}) selected="selected"({/if})>({$rp_count[i]})一周</option>
({/section})
</select></li>
</ul></div>
<div class="checkList">

({section name=i loop=$wk})
<input type='checkbox' name="sc_rwk[]" value='({$smarty.section.i.index})' ({if $rep_type[i]}) checked="checked"({/if}) />({$wk[i]})
({/section})<br />
({if $is_rep})
<input type='checkbox' name="iskeep" value='0' checked="checked" />编辑
({else})
<input type='hidden' name='iskeep' value='0' />
({/if})
</div>
</td>
</tr><tr>
<th>開始日</th>
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
<th>时 间</th>
<td>
<select name='sc_b_hour'>
<option value='' ({if $begin_hour == null}) selected="selected"({/if})>--时</option>
({section name=i loop=$hours})
<option value="({if $hours[i] < 10 })0({/if})({$hours[i]})"({if $hours[i] == $begin_hour})({if $begin_hour != null}) selected="selected"({/if})({/if})>({$hours[i]})时</option>
({/section})
</select>
<select name='sc_b_minute'>
<option value=''({if $begin_min == null}) selected="selected"({/if})>--分</option>
({section name=i loop=$mins})
<option value="({if $mins[i] < 10 })0({/if})({$mins[i]})"({if $mins[i] == $begin_min}) ({if $begin_min != null}) selected="selected"({/if})({/if})>({$mins[i]})分</option>
({/section})
</select>～
<select name='sc_f_hour'>
<option value=''({if $finish_hour == null}) selected="selected"({/if})>--时</option>
({section name=i loop=$hours})
<option value="({if $hours[i] < 10 })0({/if})({$hours[i]})"({if $hours[i] == $finish_hour}) ({if $finish_hour != null}) selected="selected"({/if})({/if})>({$hours[i]})时</option>
({/section})
</select>
<select name='sc_f_minute'>
<option value=''({if $finish_min == null}) selected="selected"({/if})>--分</option>
({section name=i loop=$mins})
<option value="({if $mins[i] < 10 })0({/if})({$mins[i]})"({if $mins[i] == $finish_min}) ({if $finish_min != null}) selected="selected"({/if})({/if})>({$mins[i]})分</option>
({/section})
</select>
</td>
</tr><tr>
<th>标题</th>
<td>
<input class="text" type='text' name='sc_title' value="({$title})" size="60" />
</td>
</tr><tr>
<th>内容</th>
<td>
<textarea class="text" name='sc_memo' cols="50" rows="5">({$value})</textarea>
</td>
</tr>
<tr>
<th>参加者</th>
<td>
<input type="hidden" name="biz_group_id" value="0" />
<div class="checkList"><ul>
({foreach name=i from=$members item=item})
({if $item})
<li><input name='sc_j_mem[]' value='({$item.c_member_id})' type='checkbox'({if $item.checkflag}) checked="checked"({/if}) />({$item.nickname})</li>
({/if})
({if !$smarty.foreach.i.last && $smarty.foreach.i.iteration%3==0})</ul><ul>({/if})
({/foreach})
</ul></div>
</td>
</tr><tr>
<th>公开范围</th>
<td>
<div class="checkList"><ul>
<li><input type='radio' name='public_flag' value='public' ({if $public_flag == 'public'})checked="checked"({/if}) />对全体公开</li>
</ul></div>
<div class="checkList"><ul>
<li><input type='radio' name='public_flag' value='private' ({if $public_flag == 'private'})checked="checked"({/if})/>只对参加者公开</li>
</ul></div>
</td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type='submit' class="input_submit" name='entry' value='确定' /></li>
</ul>
</div>

({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
