({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="CMD設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

<script type="text/javascript">
//<![CDATA[
    var permit_list = new Array(
    ({foreach from=$permit_list item=permit name=permits})
    "({$permit})"({if !$smarty.foreach.permits.last}),({/if})
    ({/foreach})
    );
    /***
     * チェックボックスによる小窓使用範囲設定の可否を切り替える
     *
     * 「使用許可」セレクトボックス選択後に呼ばれる
     *
     * @param string cmd_name CMD名称
     */
    function changePermitEnable(cmd_name)
    {
        var select_using = document.getElementById("select_using_" + cmd_name);
        var permit_prefix = "check_permit_";

        for (var i=0; i < permit_list.length; i++) {
            var permit_name = permit_list[i];
            var permit = document.getElementById(permit_prefix + cmd_name + "_" + permit_name);
            if (select_using.selectedIndex == 1) {  // 「使用しない」が選択されている
                permit.setAttribute('disabled', 'disabled');
            } else {  // 「使用する」が選択されている
                permit.removeAttribute('disabled');
                permit.setAttribute('checked', 'checked');  // 全使用範囲を選択済に
            }
        }
    }
//]]>
</script>

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>CMD設定</h2>
<div class="contents">

<p>※使用许可「不使用」的部分，适用范围的设定不生效。</p>
<p>※用小窗分配角色功能被登记了的小窗不能再进行变更。</p>
<p>※小窗是指：用JS方式使链接页面直接在原来的窗口显示而不打开新的页面。例如视频、地图等。CMD功能可将其链接指向页面转换为网页页面。</p>
<p>※下面表示的使用范围是指，在什么场合下，链接可以转换成网页显示，即CMD生效。</p>
<table class="basicType2">
<thead>
<tr>
<th>CMD名称</th>
<th>使用许可</th>
<th>使用范围</th>
<th colspan='2'>操作</th>
</tr>
</thead>
<tbody>

({foreach from=$c_cmd_list item=c_cmd key=cmd_name})
<tr>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_cmd','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="name" value="({$cmd_name})" />
<input type="hidden" name="c_cmd_id" value="({$c_cmd.c_cmd_id|default:0})" />

<td>({$cmd_name})</td>
<td>
<select name="using" id="select_using_({$cmd_name})" onchange="changePermitEnable('({$cmd_name})')">
    <option value="0">使用
    <option value="1"({if $c_cmd.disabled}) selected="selected"({/if})>不使用
	
</select>
</td>
<td>

<table>
<tr>
<td>
<input name="permit[]" type="checkbox" value="1" id="check_permit_({$cmd_name})_community" ({if $c_cmd.permit.community || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_community">({$WORD_COMMUNITY})</label><br />
<input name="permit[]" type="checkbox" value="2" id="check_permit_({$cmd_name})_diary"({if $c_cmd.permit.diary || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_diary">({$WORD_DIARY})</label><br />
<input name="permit[]" type="checkbox" value="4" id="check_permit_({$cmd_name})_profile"({if $c_cmd.permit.profile || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_profile">上传</label><br />
<input name="permit[]" type="checkbox" value="64" id="check_permit_({$cmd_name})_message"({if $c_cmd.permit.message || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_message">消息</label><br />
</td>
<td>
<input name="permit[]" type="checkbox" value="8" id="check_permit_({$cmd_name})_side_banner"({if $c_cmd.permit.side_banner || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_side_banner">banner</label><br />
<input name="permit[]" type="checkbox" value="16" id="check_permit_({$cmd_name})_info"({if $c_cmd.permit.info || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_info">通告</label><br />
<input name="permit[]" type="checkbox" value="32" id="check_permit_({$cmd_name})_entry_point"({if $c_cmd.permit.entry_point || is_null($c_cmd.permit)}) checked="checked"({/if})({if $c_cmd.disabled}) disabled="disabled"({/if}) /><label for="check_permit_({$c_cmd.c_cmd_id})_entry_point">插入模板</label><br />
</td>
</tr>
</table>

</td>
<td><span class="textBtnS"><input type="submit" class="submit" value="　变　更　" /></span></td>
</form>
</tr>
({foreachelse})
<tr>
<td colspan="5">小窗无法登录</td>
</tr>
({/foreach})
</tbody>

</table>

({$inc_footer|smarty:nodefaults})
