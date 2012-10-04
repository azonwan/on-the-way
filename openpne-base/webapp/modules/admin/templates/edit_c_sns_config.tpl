({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})
({assign var="page_name" value="配色设定・CSS颜色修改"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

<script type="text/javascript">
<!--
function reflect_color(n) {
    var str_1 = n.name ;
    var color = document.forms["color"].elements[str_1].value ;
    var str_2 = "preview_display_"+str_1 ;
    var str_3 = "#" + color ;
    document.getElementById(str_2).style.backgroundColor = str_3 ;
    for (key in bgcolors) {
        if (key == str_1) {
            bgcolors[str_1] = color;
        }
    }
    set_textarea_for_color_config();
}

function set_preset_color(target, color) {
    document.forms["color"].elements[target].value = color;
    var str_1 = "preview_display_" + target ;
    var str_2 = "#" + color;
    document.getElementById(str_1).style.backgroundColor = str_2;
    bgcolors[target] = color;
}

function set_textarea_for_color_config() {
    var str_1 = "[color]\n"
        + "caption = \"接收\"\n"
        + "color_0 = \"FFFFFF\"\n";
    for (key in bgcolors) {
        if (key.indexOf("color") == -1) {
            continue;
        }
        str_1 += key + " = \"" + bgcolors[key] + "\"\n";
    }
    document.forms["color"].elements["copy_area"].value = str_1;
}

bgcolors = new Array();
({foreach from=$bgcolor_scheme_names key=key item=item})
bgcolors['({$key})'] = "({$c_config_color_list[0][$key]})";
({/foreach})

({foreach from=$c_config_color_list key=key item=item})
function assign_color_({$key})() {
({foreach from=$bgcolor_scheme_names key=key2 item=item2})
    set_preset_color ("({$key2})","({$item[$key2]})");
({/foreach})
    set_textarea_for_color_config ();
    return 0;
}
({/foreach})
// -->
</script>

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>配色设定</h2>
<div class="contents">

<div class="sampleColors">
<h3 class="item" id="subttl01">颜色设定</h3>
<p class="caution" id="c01">※调用初期设定色后一定要点击『确定颜色变更』，来确定配色。</p>

({foreach from=$c_config_color_list key=key item=item})
<dl class="box">
	<dt>({$item.caption|default:"&nbsp;"})</dt>
	<dd style="background:#({$item.color_0|default:"FFFFFF"});"><p class="textBtn"><input type="button" value="调用此设定" onclick="assign_color_({$key})()" /></p></dd>
</dl>
({/foreach})

<br class="clear" />

</div>

<form action="./" method="post" name="color">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_sns_config','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<div class="bg">
<h3 class="item" id="subttl02">颜色代码设置</h3>

<p class="caution" id="c02">※颜色设置请使用16进制颜色代码来表示。</p>
<p class="caution" id="c03">※选择新的颜色后，默认为预览模式，所以一定要点击【变更】使其更改生效。</p>

({foreach from=$bgcolor_scheme_names key=key item=item})
<dl class="box">
	<dt>({$smarty.foreach.color_scheme.iteration}). ({$item})</dt>
	<dd>#&nbsp;<input type="text" class="basic" name="({$key})" value="({$c_config_color_list[0][$key]})" onchange="reflect_color(this)" size="8" maxlength="6" /></dd>
	<dd class="pre_color" style="background-color:#({$c_config_color_list[0][$key]});"><div>&nbsp;变更前&nbsp;</div></dd>
	<dd class="color" style="background-color:#({$c_config_color_list[0][$key]});" id="preview_display_({$key})"><div>&nbsp;变更后&nbsp;</div></dd>
</dl>
({/foreach})
<br class="clear" />
</div>

<p class="textBtn" id="c04"><input type="submit" value="确定变更颜色" /></p>

<p id="c05">备份配色设定时，请复制以下内容，保存成文本文件。</p>

<textarea name="copy_area" id="copy_area" rows="20" cols="60">
[color]
caption = "备份"
({foreach from=$bgcolor_scheme_names key=key item=item})({$key}) = "({$c_config_color_list[0][$key]})"
({/foreach})
</textarea>

</form>

</div>({*/div class="contents"*})

<h2 id="ttl02">添加新的CSS样式</h2>
<div class="contents">
<p id="c06">可以在这里填写新的div+css ，可通过更改模板文件（.tpl）直接调用这里的CSS</p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_siteadmin_css','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<textarea id="customCss" name="body" cols="72" rows="20">({$inc_custom_css})</textarea>
<p class="textBtn"><input type="submit" value="添加其他CSS" /></p>
</form>

({$inc_footer|smarty:nodefaults})
