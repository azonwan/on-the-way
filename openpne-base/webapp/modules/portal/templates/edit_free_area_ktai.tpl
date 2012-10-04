({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="手机版自由区域设定"})
({ext_include file="inc_tree_adminPortalConfig.tpl"})
</div>

({*ここまで:navi*})

<script type="text/javascript">
<!--
function fireOnClickEventByKeyPress(e, obj)  // 特定キーが押下された場合のみ、指定されたオブジェクトの OnClick イベントを発行する
{
    var key;

    if (!document.all) {
        return false;
    }

    if (e) {
        key = e.keyCode;
    } else {
        key = e.charCode;
    }

    if (key == 13 || key == 32 || key == 3) {
        obj.onclick();
    }
}

function toggleImageInsertArea(id)
{
    var imageInsertArea = document.getElementById(id);
    if (imageInsertArea.style.display == "none" || !imageInsertArea.style.display) {
        imageInsertArea.src = "?m=({$module_name})&a=page_({$hash_tbl->hash('edit_portal_image', 'page')})&target_area=target_" + id;
        imageInsertArea.style.display = "block";
    } else {
        imageInsertArea.style.display = "none";
    }
}
//-->
</script>

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>SNS网站</h2>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
    <tr>
    ({ext_include file="inc_menu_adminPortalConfig.tpl"})
        <td class="detail">
            <h3>({$page_name})</h3>
            <p>
                       可用HTML制作5个自由页面。<br />
                     可以制作自己的SNS的介绍和标志图片等。<br />
            <br />
            显示位置，请到[内容设定]页设定。 
            </p>
            <p class="caution" id="c01">
                       ※使用HTML标记时，请注意关闭标记以免出现问题。
            </p>

            <form action="./" method="post">
            <input type="hidden" name="m" value="({$module_name})" />
            <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_free_area_ktai','do')})" />
            <input type="hidden" name="sessid" value="({$PHPSESSID})" />

            <table id="input_area">
                <tr>
                    <td>
                        <dl>
                        <dt class="title"><input type="text" name="free_area_ktai_name_1" value="({$portal_free_area_ktai.free_area_ktai_name_1|default:'自由区域1'})" /></dt>
                        <dd class="button">
                            <p class="textBtn"><button type="button" onclick="toggleImageInsertArea('image_insert_area_1')" onkeypress="fireOnClickEventByKeyPress(event, this)">图片的插入/上传</button></p></dd>
                        <dd class="textarea"><textarea cols="100" rows="6" name="free_area_ktai_1" id="target_image_insert_area_1">({$portal_free_area_ktai.free_area_ktai_1})</textarea></dd>
                        <dd class="image"><iframe src="about:blank" id="image_insert_area_1" class="image_insert_area" frameborder="0" scrolling="no"></iframe></dd>

                        <dt class="title"><input type="text" name="free_area_ktai_name_2" value="({$portal_free_area_ktai.free_area_ktai_name_2|default:'自由区域2'})" /></dt>
                        <dd class="button">
                            <p class="textBtn"><button type="button" onclick="toggleImageInsertArea('image_insert_area_2')" onkeypress="fireOnClickEventByKeyPress(event, this)">图片的插入/上传</button></p></dd>
                        <dd class="textarea"><textarea cols="100" rows="6" name="free_area_ktai_2" id="target_image_insert_area_2">({$portal_free_area_ktai.free_area_ktai_2})</textarea></dd>
                        <dd class="image"><iframe src="about:blank" id="image_insert_area_2" class="image_insert_area" frameborder="0" scrolling="no"></iframe></dd>

                        <dt class="title"><input type="text" name="free_area_ktai_name_3" value="({$portal_free_area_ktai.free_area_ktai_name_3|default:'自由区域3'})" /></dt>
                        <dd class="button">
                            <p class="textBtn"><button type="button" onclick="toggleImageInsertArea('image_insert_area_3')" onkeypress="fireOnClickEventByKeyPress(event, this)">图片的插入/上传</button></p></dd>
                        <dd class="textarea"><textarea cols="100" rows="6" name="free_area_ktai_3" id="target_image_insert_area_3">({$portal_free_area_ktai.free_area_ktai_3})</textarea></dd>
                        <dd class="image"><iframe src="about:blank" id="image_insert_area_3" class="image_insert_area" frameborder="0" scrolling="no"></iframe></dd>

                        <dt class="title"><input type="text" name="free_area_ktai_name_4" value="({$portal_free_area_ktai.free_area_ktai_name_4|default:'自由区域4'})" /></dt>
                        <dd class="button">
                            <p class="textBtn"><button type="button" onclick="toggleImageInsertArea('image_insert_area_4')" onkeypress="fireOnClickEventByKeyPress(event, this)">图片的插入/上传</button></p></dd>
                        <dd class="textarea"><textarea cols="100" rows="6" name="free_area_ktai_4" id="target_image_insert_area_4">({$portal_free_area_ktai.free_area_ktai_4})</textarea></dd>
                        <dd class="image"><iframe src="about:blank" id="image_insert_area_4" class="image_insert_area" frameborder="0" scrolling="no"></iframe></dd>
                        </dl>

                        <p class="textBtn"><input type="submit" value="变更" /></p>

                    </td>
                </tr>
            </table>
            </form>
        </td>
    </tr>
</table>
<div class="contents">

({$inc_footer|smarty:nodefaults})
