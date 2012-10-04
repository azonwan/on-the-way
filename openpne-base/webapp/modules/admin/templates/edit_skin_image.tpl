({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})
({assign var="page_name" value="网站风格更换"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>网站风格更换</h2>
<div class="contents">

<script type="text/javascript">
function toggleDisplay(targetId) {
    var tgt = document.getElementById(targetId);
    var btn = document.getElementById("skin_changer_openclose_button");
    if ( tgt.style.display == "none" ) {
        tgt.style.display = "block";
        document.cookie = "skinChangerArea=1";
        btn.value = '不显示';
    } else {
        tgt.style.display = "none";
        document.cookie = "skinChangerArea=0";
        btn.value = '显示';
    }
}
function getCookie() {
        var cook = new Array();
        var tmp = document.cookie.split("; ");
        for (var i = 0; i < tmp.length; i++) {
            var parts = tmp[i].split("=");
            cook[parts[0]] = parts[1];
        }

        return cook;
}
</script>

<h3 class="item" id="subttl01">默认风格&nbsp;<span class="textBtnS"><input id="skin_changer_openclose_button" type="button" value="不显示" onclick="toggleDisplay('skin_changer_area');" /></span></h3>
<p class="caution" id="c01">※变更默认风格设定，变更后将显示为当前设定。</p>

<form action="./" method="post">
<table class="basicType2" id="skin_changer_area">
<tr>
<td>
({foreach from=$theme_list item=item})
<dl class="box">
<dd>
<a href="./skin/({$item.name})/({$item.link})" target="_blank"><img src="./skin/({$item.name})/({$item.thumbnail})" width="180" /></a><br />
<input type="radio" name="value" id="skin_theme_({$item.name})" value="({$item.name})"({if $item.name == $smarty.const.OPENPNE_SKIN_THEME}) checked="checked"({/if}) />
<label for="skin_theme_({$item.name})">({$item.caption})</label>
</dd>
</dl>
({/foreach})

<br class="clear" />
<div class="submitTheme">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_theme','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})"/>
<span class="textBtnS"><input type="submit" value="变更" /></span>
</div>

</td>
</tr>
</table>
</form>

<script type="text/javascript">
var c = getCookie();
if ( c['skinChangerArea'] == 0 ) { toggleDisplay('skin_changer_area'); }
</script>

<h3 class="item" id="subttl02">默认设定</h3>
<p class="pageNavi"><a href="#skin1">进入页</a> | <a href="#skin2">菜单、画面上部图像&nbsp;[1]</a> | <a href="#skin3">菜单、画面上部图像&nbsp;[2]</a> | <a href="#skin4">画面下部画像</a> | <a href="#skin5">NoImage画像</a> | <a href="#skin6">图片按钮</a> | <a href="#skin7">点评图标</a> | <a href="#skin8">小物画像&nbsp;[1]</a> | <a href="#skin9">小图片&nbsp;[2]</a> | <a href="#skin10">小图片&nbsp;[3]</a> | <a href="#skin11">小图片&nbsp;[4]</a> | <a href="#skin12">手机版</a> | <a href="#skin13"></a> | </p>
<p class="caution" id="c02">※如果设定图像的尺寸与规定的不同、可能会显示不出或不正确。</p>

<table class="basicType2">
({*******})
<tr class="skin1">
<th><a name="skin1">进入页</a></th>
</tr>
<tr class="skin1">
<td>
<dl class="box">
<dt><strong>进入画面</strong></dt>
<dd class="image">({assign var=skinname value=skin_login_open})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})"/>
<input type="hidden" name="skinname" value="skin_login_open" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/01.gif" target="preview">确认详细</a></p>
</td>
</tr>
({*******})
<tr class="skin2">
<th><a name="skin2">菜单、画面上部图像&nbsp;[1]</a></th>
</tr>
<tr class="skin2">
<td>
<dl class="box">
<dt><strong>进入后的header</strong></dt>
<dd class="image">({assign var=skinname value=skin_after_header})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="skin_after_header" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<dl class="box">
<dt><strong>进入后的header(滚动式)</strong></dt>
<dd class="image">({assign var=skinname value=skin_after_header_2})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="skin_after_header_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<dl class="box">
<dt><strong>个人页面菜单</strong></dt>
<dd class="image">({assign var=skinname value=skin_navi_h})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>他人主页菜单</strong></dt>
<dd class="image">({assign var=skinname value=skin_navi_f})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>({$WORD_COMMUNITY})菜单</strong></dt>
<dd class="image">({assign var=skinname value=skin_navi_c})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<dl class="box">
<dt><strong>自己页面菜单(滚动式)</strong></dt>
<dd class="image">({assign var=skinname value=skin_navi_h_2})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>他人页面菜单(滚动式)</strong></dt>
<dd class="image">({assign var=skinname value=skin_navi_f_2})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>({$WORD_COMMUNITY})菜单(滚动式)</strong></dt>
<dd class="image">({assign var=skinname value=skin_navi_c_2})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<dl class="box">
<dt><strong>检索图片</strong></dt>
<dd class="image">({assign var=skinname value=icon_search})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_search" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>检索按钮１</strong></dt>
<dd class="image">({assign var=skinname value=button_search_1})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回默初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_search_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>检索按钮２</strong></dt>
<dd class="image">({assign var=skinname value=button_search_2})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_search_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>检索按钮３</strong></dt>
<dd class="image">({assign var=skinname value=button_search_3})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_search_3" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>检索按钮４</strong></dt>
<dd class="image">({assign var=skinname value=button_search_4})<img src="({t_img_url_skin filename=$skinname})" style="width:62px;height:20px;"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_search_4" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/02.gif" target="preview">确认详细</a></p>
</td>
</tr>
({*******})
<tr class="skin3">
<th><a name="skin3">菜单、画面上部画像&nbsp;[2]</a></th>
</tr>
<tr class="skin3">
<td>
<dl class="box">
<dt><strong>生日图片</strong></dt>
<dd class="image">({assign var=skinname value=birthday_f})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="birthday_f" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>马上过生日图片</strong></dt>
<dd class="image">({assign var=skinname value=birthday_f_2})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="birthday_f_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>自己的生日图片</strong></dt>
<dd class="image">({assign var=skinname value=birthday_h})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="birthday_h" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<dl class="box">
<dt><strong>情报栏图标</strong></dt>
<dd class="image">({assign var=skinname value=icon_information})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_information" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>进入前的header</strong></dt>
<dd class="image">({assign var=skinname value=skin_before_header})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="skin_before_header" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/03.gif" target="preview">确认详细</a></p>
</td>
</tr>
({*******})
<tr class="skin4">
<th><a name="skin4">画面下部图像</a></th>
</tr>
<tr class="skin4">
<td>
<dl class="box">
<dt><strong>共同的footer</strong></dt>
<dd class="image">({assign var=skinname value=skin_footer})<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" width="180"></a></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="skin_footer"/>
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/04.gif" target="preview">确认详细</a></p>
</td>
</tr>
({*******})
<tr class="skin5">
<th><a name="skin5">NoImage画像</a></th>
</tr>
<tr class="skin5">
<td>
<dl class="box">
<dt><strong>no_image</strong></dt>
<dd class="image">({assign var=skinname value=no_image})<img src="({t_img_url_skin filename=$skinname w=180 h=180})"></dd>
<dd class="default">({if $skin_list[$skinname] != "skin_$skinname.gif" && substr($skin_list[$skinname], 0, 12) != "skin_default"})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="no_image" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>no_logo</strong></dt>
<dd class="image">({assign var=skinname value=no_logo})<img src="({t_img_url_skin filename=$skinname w=180 h=180})"></dd>
<dd class="default">({if $skin_list[$skinname] != "skin_$skinname.gif" && substr($skin_list[$skinname], 0, 12) != "skin_default"})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="no_logo" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>no_logo_small</strong></dt>
<dd class="image">({assign var=skinname value=no_logo_small})<img src="({t_img_url_skin filename=$skinname w=76 h=76})"></dd>
<dd class="default">({if $skin_list[$skinname] != "skin_$skinname.gif" && substr($skin_list[$skinname], 0, 12) != "skin_default"})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="no_logo_small" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/05.gif" target="preview">确认详细</a></p>
</td>
</tr>
({*******})
<tr class="skin6">
<th><a name="skin6">图像按钮</a></th>
</tr>
<tr class="skin6">
<td>
<dl class="box">
<dt><strong>「照片编辑」</strong></dt>
<dd class="image">({assign var=skinname value=button_edit_photo})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_edit_photo" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>「上传确认」</strong></dt>
<dd class="image">({assign var=skinname value=button_prof_conf})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_prof_conf" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>「查阅照片」</strong></dt>
<dd class="image">({assign var=skinname value=button_show_photo})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_show_photo" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<dl class="box">
<dt><strong>「拒绝」</strong></dt>
<dd class="image">({assign var=skinname value=button_kyohi})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_kyohi" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>「删除」</strong></dt>
<dd class="image">({assign var=skinname value=button_sakujo})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_sakujo" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>「确定」</strong></dt>
<dd class="image">({assign var=skinname value=button_shonin})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_shonin" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>「查看详细」</strong></dt>
<dd class="image">({assign var=skinname value=button_shosai})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="button_shosai" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>其他的按钮背景图片</strong></dt>
<dd class="image">({assign var=skinname value=bg_button})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="bg_button" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/06.gif" target="preview">确认详细</a></p>
</td>
</tr>
({*******})
<tr class="skin7">
<th><a name="skin7">点评用图像</a></th>
</tr>
<tr class="skin7">
<td>
<dl class="box">
<dt><strong>点评满意度１</strong></dt>
<dd class="image">({assign var=skinname value=satisfaction_level_1})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="satisfaction_level_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>点评满意度2</strong></dt>
<dd class="image">({assign var=skinname value=satisfaction_level_2})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="satisfaction_level_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>点评满意度3</strong></dt>
<dd class="image">({assign var=skinname value=satisfaction_level_3})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="satisfaction_level_3" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>点评满意度4</strong></dt>
<dd class="image">({assign var=skinname value=satisfaction_level_4})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="satisfaction_level_4" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>点评满意度5</strong></dt>
<dd class="image">({assign var=skinname value=satisfaction_level_5})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="satisfaction_level_5" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/07.gif" target="preview">确认详细</a></p>
</td>
</tr>
({*******})
<tr class="skin8">
<th><a name="skin8">小图片&nbsp;[1]</a></th>
</tr>
<tr class="skin8">
<td>
<dl class="box">
<dt><strong>标题1</strong></dt>
<dd class="image">({assign var=skinname value=icon_title_1})<img src="({t_img_url_skin filename=$skinname})" class="c_10"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_title_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>标题２</strong></dt>
<dd class="image">({assign var=skinname value=content_header_1})<img src="({t_img_url_skin filename=$skinname})" class="c_11"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="content_header_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>箭形符号图标1</strong></dt>
<dd class="image">({assign var=skinname value=icon_arrow_1})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_arrow_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>箭形符号图标2</strong></dt>
<dd class="image">({assign var=skinname value=icon_arrow_2})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_arrow_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>回复图标1</strong></dt>
<dd class="image">({assign var=skinname value=icon_1})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>回复图标2</strong></dt>
<dd class="image">({assign var=skinname value=icon_2})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>回复图标3</strong></dt>
<dd class="image">({assign var=skinname value=icon_3})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_3" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/08.gif" target="preview">确认详细</a></p>
</td>
</tr>
({*******})
<tr class="skin9">
<th><a name="skin9">小图片&nbsp;[2]</a></th>
</tr>
<tr class="skin9">
<td>
<dl class="box">
<dt><strong>警报图标</strong></dt>
<dd class="image">({assign var=skinname value=icon_alert_l})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_alert_l" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>管理员图标</strong></dt>
<dd class="image">({assign var=skinname value=icon_crown})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_crown" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>有图像图标</strong></dt>
<dd class="image">({assign var=skinname value=icon_camera})<img src="({t_img_url_skin filename=$skinname})"></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_camera" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/09.gif" target="preview">确认详细</a></p>
</td>
</tr>
({*******})
<tr class="skin10">
<th><a name="skin10">小图片&nbsp;[3]</a></th>
</tr>
<tr class="skin10">
<td>
<dl class="box">
<dt><strong>礼物图标</strong></dt>
<dd class="image">({assign var=skinname value=icon_birthday})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_birthday" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>活动图标1</strong></dt>
<dd class="image">({assign var=skinname value=icon_event_B})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_event_B" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>活动图标2</strong></dt>
<dd class="image">({assign var=skinname value=icon_event_R})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_event_R" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>日历图标</strong></dt>
<dd class="image">({assign var=skinname value=icon_pen})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_pen" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>天气图标</strong></dt>
<dd class="image">({assign var=skinname value=icon_weather_FC})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_weather_FC" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>日历图标</strong></dt>
<dd class="image">({assign var=skinname value=icon_schedule})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_schedule" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/10.gif" target="preview">确认详细</a></p>
</td>
</tr>
({*******})
<tr class="skin11">
<th><a name="skin11">小图片&nbsp;[4]</a></th>
</tr>
<tr class="skin11">
<td>
<dl class="box">
<dt><strong>未读邮件图标</strong></dt>
<dd class="image">({assign var=skinname value=icon_mail_1})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_mail_1" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>已读邮件图标</strong></dt>
<dd class="image">({assign var=skinname value=icon_mail_2})<img src="({t_img_url_skin filename=$skinname})"/></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_mail_2" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>邮件发送完毕图标</strong></dt>
<dd class="image">({assign var=skinname value=icon_mail_3})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_mail_3" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>邮件回信完毕图标</strong></dt>
<dd class="image">({assign var=skinname value=icon_mail_4})<img src="({t_img_url_skin filename=$skinname})" /></dd>
<dd class="default">({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]({/if})</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="icon_mail_4" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/11.gif" target="preview">确认详细</a></p>
</td>
</tr>
({*******})
<tr class="skin13">
<th><a name="skin13">文字装饰画像</a></th>
</tr>
<tr class="skin13">
<td>
({foreach from=$c_config_decoration_list item=item})
<dl class="box">
<dt><strong>({$item.caption})</strong></dt>
<dd class="image">({assign var=skinname value=deco_`$item.tagname`})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" /></a>
</dd>
<dd class="default">
({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]<br />({/if})
</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
({/foreach})
({if $smarty.const.OPENPNE_USE_ALBUM})
<dl class="box">
<dt><strong>插入相册</strong></dt>
<dd class="image">({assign var=skinname value=deco_op_image})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" /></a>
</dd>
<dd class="default">
({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]<br />({/if})
</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
({/if})
<dl class="box">
<dt><strong>（DoCoMo）文字插入</strong></dt>
<dd class="image">({assign var=skinname value=deco_op_emoji_docomo})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" /></a>
</dd>
<dd class="default">
({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]<br />({/if})
</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
({if !$smarty.const.OPENPNE_EMOJI_DOCOMO_FOR_PC})
<dl class="box">
<dt><strong>（Au）文字插入</strong></dt>
<dd class="image">({assign var=skinname value=deco_op_emoji_au})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" /></a>
</dd>
<dd class="default">
({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]<br />({/if})
</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>（SoftBank）文字插入</strong></dt>
<dd class="image">({assign var=skinname value=deco_op_emoji_softbank})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" /></a>
</dd>
<dd class="default">
({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]<br />({/if})
</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<dl class="box">
<dt><strong>小窗口介绍</strong></dt>
<dd class="image">({assign var=skinname value=deco_op_cmd})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" /></a>
</dd>
<dd class="default">
({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]<br />({/if})
</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="({$skinname})" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
({/if})
<br class="clear" />
</td>
</tr>
({*******})
<tr class="skin12">
<th><a name="skin12">手机版</a></th>
</tr>图像
<tr class="skin12">
<td>
<dl class="box">
<dt><strong>标志图像</strong></dt>
<dd class="image">({assign var=skinname value=skin_ktai_header})
({if $smarty.const.OPENPNE_USE_KTAI_LOGO})
<a href="({t_img_url_skin filename=$skinname})" target="_blank"><img src="({t_img_url_skin filename=$skinname w=180 h=180})" /></a>
({else})
没有图像
({/if})
</dd>
<dd class="default">
({if $smarty.const.OPENPNE_USE_KTAI_LOGO})
({if $skin_list[$skinname]})[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_skin_image','do')})&amp;skinname=({$skinname})&amp;sessid=({$PHPSESSID})">返回初始风格</a>]<br />({/if})
[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('update_c_admin_config_use_ktai_logo','do')})&amp;sessid=({$PHPSESSID})">不显示图像</a>]
({else})
[<a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('update_c_admin_config_use_ktai_logo','do')})&amp;sessid=({$PHPSESSID})">返回到默认值</a>]
({/if})
</dd>
<dd class="submit">
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_skin_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="skinname" value="skin_ktai_header" />
<input type="file" name="upfile" /><span class="textBtnS"><input type="submit" value="变更" /></span>
</form></dd>
</dl>
<br class="clear" />
<p class="detailLink"><a href="modules/admin/img/12.gif" target="preview">确认详细</a></p>
</td>
</tr>
({*******})
</table>
({$inc_footer|smarty:nodefaults})
