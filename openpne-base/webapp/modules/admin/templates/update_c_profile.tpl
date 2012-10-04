({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="parent_page_name" value="上传项目管理"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})({/capture})

({assign var="page_name" value="个人资料项目编辑"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>个人资料项目编辑</h2>
<div class="contents">

<form action="./" method="post">
<table class="basicType2">
<tr>
<th><input type="hidden" name="m" value="({$module_name})" /><input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_profile','do')})" /><input type="hidden" name="sessid" value="({$PHPSESSID})" /><input type="hidden" name="c_profile_id" value="({$requests.c_profile_id})" />项目名</th>
<td><input type="text" class="basic" name="caption" value="({$c_profile.caption})" size="30" /></td>
</tr>
<tr>
<th>识别名</th>
<td><input type="text" class="basic" name="name" value="({$c_profile.name})" size="20" />　<span class="caution">※只能填写半角英文数字和下划线符号_ </span></td>
</tr>
<tr>
<th>必须</th>
<td><input type="checkbox" name="is_required" value="1"({if $c_profile.is_required}) checked="checked"({/if}) /></td>
</tr>
<tr>
<th>选择公开设定</th>
<td>
<label><input type="radio" name="public_flag_edit" value="0"({if !$c_profile.public_flag_edit}) checked="checked"({/if}) />固定</label>
<label><input type="radio" name="public_flag_edit" value="1"({if $c_profile.public_flag_edit}) checked="checked"({/if}) />用户选择</label></td>
</tr>
<tr>
<th>公开设定<br>默认值</th>
<td><select class="basic" name="public_flag_default">
<option value="public"({if $c_profile.public_flag_default == 'public'}) selected="selected"({/if})>对全员公开</option>
<option value="friend"({if $c_profile.public_flag_default == 'friend'}) selected="selected"({/if})>只对({$WORD_MY_FRIEND})公开</option>
<option value="private"({if $c_profile.public_flag_default == 'private'}) selected="selected"({/if})>不公开</option>
</select></td>
</tr>
<tr>
<th>排列顺序</th>
<td><input type="text" class="basic" name="sort_order" value="({$c_profile.sort_order})" size="10" /></td>
</tr>
<tr>
<th>用户注册时</th>
<td>
<label><input type="radio" name="disp_regist" value="1"({if $c_profile.disp_regist}) checked="checked"({/if}) />显示</label>
<label><input type="radio" name="disp_regist" value="0"({if !$c_profile.disp_regist}) checked="checked"({/if}) />不显示</label></td>
</tr>
<tr>
<th>前台个人资料变更设置中</th>
<td>
<label><input type="radio" name="disp_config" value="1"({if $c_profile.disp_config}) checked="checked"({/if}) />显示</label>
<label><input type="radio" name="disp_config" value="0"({if !$c_profile.disp_config}) checked="checked"({/if}) />不显示</label></td>
</tr>
<tr>
<th>会员分类检索时</th>
<td>
<label><input type="radio" name="disp_search" value="1"({if $c_profile.disp_search}) checked="checked"({/if}) />显示</label>
<label><input type="radio" name="disp_search" value="0"({if !$c_profile.disp_search}) checked="checked"({/if}) />不显示</label></td>
</tr>
<tr>
<th>提示/说明</th>
<td><input type="text" name="info" value="({$c_profile.info})" size="30"></td>
</tr>
<tr>
<th>表单类型</th>
<td><select class="basic" name="form_type">
<option value="text"({if $c_profile.form_type == 'text'}) selected="selected"({/if})>文本框</option>
<option value="textlong"({if $c_profile.form_type == 'textlong'}) selected="selected"({/if})>文本框(长)</option>
<option value="textarea"({if $c_profile.form_type == 'textarea'}) selected="selected"({/if})>文本框(复数行)</option>
<option value="select"({if $c_profile.form_type == 'select'}) selected="selected"({/if})>单选(选择框)</option>
<option value="radio"({if $c_profile.form_type == 'radio'}) selected="selected"({/if})>单选(单选按钮)</option>
<option value="checkbox"({if $c_profile.form_type == 'checkbox'}) selected="selected"({/if})>复选(复选框)</option>
</select></td>
</tr>
<tr>
<td colspan="2" class="caution">以下项目只有在表单类型为「文本框」、「文本框(复数行)」时才有效。</td>
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
<td><input type="text" class="basic" name="val_min" value="({if $c_profile.val_min != 0})({$c_profile.val_min})({/if})" size="10">&#xff5e;<input type="text" class="basic" name="val_max" value="({if $c_profile.val_max != 0})({$c_profile.val_max})({/if})" size="10" /><br />
<span class="caution">※输入值类型为数值类型时，数值的范围、其外的场合为(半角)文字数</span></td>
</tr>
<tr>
<th>正规表达</th>
<td><input type="text" class="basic" name="val_regexp" value="({$c_profile.val_regexp})" size="30" /><br />
<span class="caution">※只有在选择输入类型为「正规表达」时才有效，使用(PHP的Perl互换(PCRE)正规表现函数)<br />例： /^[a-c]\d+$/</span></td>
</tr>
</table>
<p class="textBtn"><input type="submit" value="添 加" /></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})">返回个人资料项目设定</a></p>
({$inc_footer|smarty:nodefaults})
