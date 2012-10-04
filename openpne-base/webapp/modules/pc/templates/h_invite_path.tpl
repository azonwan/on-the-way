<div id="LayoutC">
<div id="Center">

<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>通过链接邀请朋友({$smarty.const.SNS_NAME})</h3></div>

<img src="./skin/dummy.gif" class="v_spacer_l">
<script> 
    function oCopy(obj){ 
    obj.select(); 
    js=obj.createTextRange(); 
    js.execCommand("Copy") 
    } 
</script> 

<tr>
<td class="container main_content" align="center">
<table class="container" border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="comleft_content" align="center" valign="top">
    <table border="0" cellspacing="0" cellpadding="0" style="width:732px;" class="bg_02">
<tr>
    <td class="" style="width:732px;">
        <table class="" style="width:732px;" border="0" cellspacing="0" cellpadding="0">
    <td class="" style="padding:5px 0 0 0 ;"valign="top" colspan="3">
<div style="width:732px;">
<div class="xsnazzy">
    <b class="xtop">
        <b class="xb1"></b>
        <b class="xb2"></b>
        <b class="xb3"></b>
        <b class="xb4"></b>
    </b>
<div class="xboxcontent">


<table border="0" cellspacing="0" align="center" cellpadding="0" style="width:712px;" class="bg_11">
    <tr>
    <td style="padding:2px 26px;" class="bg_06"><span class="b_b c_00">邀请朋友：</span></td>
    </tr>
</table>
<table border="0" cellspacing="0" align="center" cellpadding="0" style="width:712px;" class="border_01">
    <tr>
        <td style="width:712px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
    </tr>
    <tr>
        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
        <td style="width:710px;height:32px;" class="bg_02" align="center" valign="middle">
            <table>
            <tr>
            </form>
            ({t_form _method=get m=pc a=page_c_edit})
            <input type="hidden" name="target_c_commu_id" value="({$c_commu_id})">
            <td>
                <span class="c_01" style="padding:5px;">
                链接地址
                </span>
                <img src="./skin/dummy.gif" class="v_spacer_s">
                </td>
                <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
                <td style="width:483px;" class="bg_02" align="left" valign="middle">
                <div class="padding_s">
<!--
        <div style="overflow:auto;">({$url})</div>
        <div align="center" style="text-align:center;padding:6px;">
        <input type="submit" class="submit" value="　复制链接　"onclick="doufucopy();>
-->
        <input type=text name=runcode0 id=runcode0 value="({$url})">
		<input type="button" style="border-left:1px solid #B1B4CD;border-right:1px solid #494D74;border-top:1px solid 
#B1B4CD;;border-bottom:1px solid #494D74;background:#696D81;color:#FFFFFF;"value="复制链接" onclick="oCopy
(runcode0)">
        
                </div>
            </td>
            </form>
            </tr>
            </table>

        </td>
        <td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
    </tr>
    <tr>
        <td style="width:712px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
    </tr>
</table>
</div>
<b class="xbottom"><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></b>
</div>
</div>
<img src="./skin/dummy.gif" class="v_spacer_l">

</td>
            </tr>
        </table>
    </td>
</tr>
</table>

</div><!-- Center -->
</div><!-- LayoutC -->