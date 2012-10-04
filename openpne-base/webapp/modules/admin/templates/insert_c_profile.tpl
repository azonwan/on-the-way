({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="个人资料信息增减设定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>个人资料信息增减设定</h2>
<div class="contents">
<form action="./" method="post">
<table class="basicType2">
<tr>
<th><input type="hidden" name="m" value="({$module_name})" /><input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_profile','do')})" /><input type="hidden" name="sessid" value="({$PHPSESSID})" />项目名</th>
<td><input type="text" class="basic" name="caption" value="" size="30" /></td>
</tr>
<tr>
<th>识别名</th>
<td><input type="text" class="basic" name="name" value="" size="20" />　<span class="caution">※只限于半角英文数字和 _ </span></td>
</tr>
<tr>
<th>必须</th>
<td><input type="checkbox" name="is_required" value="1" /></td>
</tr>
<tr>
<th>选择公开设定</th>
<td>
<label><input type="radio" name="public_flag_edit" value="0" checked="checked" />固定</label>
<label><input type="radio" name="public_flag_edit" value="1" />用户选择</label></td>
</tr>
<tr>
<th>公开设定<br>默认值</th>
<td><select class="basic" name="public_flag_default">
<option value="public">向全体公开</option>
<option value="friend">只对({$WORD_MY_FRIEND})公开</option>
<option value="private">不公开</option>
</select></td>
</tr>
<tr>
<th>排序</th>
<td><input type="text" class="basic" name="sort_order" value="" size="10" /></td>
</tr>
<tr>
<th>注册登录</th>
<td>
<label><input type="radio" name="disp_regist" value="1" checked="checked" />显示</label>
<label><input type="radio" name="disp_regist" value="0" />不显示</label></td>
</tr>
<tr>
<th>个人资料变更</th>
<td>
<label><input type="radio" name="disp_config" value="1" checked="checked" />显示</label>
<label><input type="radio" name="disp_config" value="0" />不显示</label></td>
</tr>
<tr>
<th>会员检索</th>
<td>
<label><input type="radio" name="disp_search" value="1" checked="checked" />显示</label>
<label><input type="radio" name="disp_search" value="0" />不显示</label></td>
</tr>
<tr>
<th>说明</th>
<td><input type="text" name="info" value="({$c_profile.info})" size="30"></td>
</tr>
<tr>
<th>表单类型</th>
<td><select class="basic" name="form_type">
<option value="text" selected="selected">文本框</option>
<option value="textlong">文本框(长)</option>
<option value="textarea">文本框(复数行)</option>
<option value="select">单选(下拉框)</option>
<option value="radio">单选(单选框)</option>
<option value="checkbox">多选(多选框)</option>
</select></td>
</tr>
<tr>
<td colspan="2" class="caution">以下项目当表单类型为「文本框」、「文本框(复数行)」的才有效。</td>
</tr>
<tr>
<th>输入值类型</th>
<td><select class="basic" name="val_type">
<option value="string"({if $c_profile.val_type == 'string'}) selected="selected"({/if})>文字列</option>
<option value="int"({if $c_profile.val_type == 'int'}) selected="selected"({/if})>数值</option>
<option value="regexp"({if $c_profile.val_type == 'regexp'}) selected="selected"({/if})>正规表达</option>
</select></td>
</tr>
<tr>
<th>最小值&#xff5e;最大值</th>
<td><input type="text" class="basic" name="val_min" value="({if $c_profile.val_min != 0})({$c_profile.val_min})({/if})" size="10" />&#xff5e;<input type="text" class="basic" name="val_max" value="({if $c_profile.val_max != 0})({$c_profile.val_max})({/if})" size="10" /><br />
<span class="caution">※输入值类型为「数值」时，数值的范围、其他场合，为(半角)文字数</span></td>
</tr>
<tr>
<th>正规表达</th>
<td><input type="text" class="basic" name="val_regexp" value="({$c_profile.val_regexp})" size="30" /><br />
<span class="caution">※只有在输入值类型中选择「正规表达」时有效(使用PHP的Perl互换(PCRE)正规表达函数)<br />
例： /^[a-c]\d+$/</span></td>
</tr>
</table>
<p class="textBtn"><input type="submit" value="添加" /></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})">返回个人资料项目设定</a></p>
({$inc_footer|smarty:nodefaults})
