({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="布局设定"})
({ext_include file="inc_tree_adminPortalConfig.tpl"})
</div>

({*ここまで:navi*})
({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>SNS网站创建</h2>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
    <tr>
    ({ext_include file="inc_menu_adminPortalConfig.tpl"})
        <td class="detail">
            <h3>({$page_name})</h3>

       <p>请从以下三个选项中选择“ sns网站”的布局。</p>

       <form action="./" method="post">
       <input type="hidden" name="m" value="({$module_name})" />
       <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_layout','do')})" />
       <input type="hidden" name="sessid" value="({$PHPSESSID})" />

       <table id="layout_changer_area">
       <tr>
       <td>

       <dl class="box">
       <dd>
       <img src="./modules/portal/admin/layout01.jpg" width="180" alt="布局1（5:5）" /><br />
       <input type="radio" name="layout_type" value="1"({if $portal_config.layout_type == '1'}) checked="checked"({/if}) /> 布局1（5:5）
       </dd>
       </dl>

       <dl class="box">
       <dd>
       <img src="./modules/portal/admin/layout02.jpg" width="180" alt="布局2（4:6）" /><br />
       <input type="radio" name="layout_type" value="2"({if $portal_config.layout_type == '2'}) checked="checked"({/if}) /> 布局2（4:6）
       </dd>
       </dl>

       <dl class="box">
       <dd>
       <img src="./modules/portal/admin/layout03.jpg" width="180" alt="布局3（6:4）" /><br />
       <input type="radio" name="layout_type" value="3"({if $portal_config.layout_type == '3'}) checked="checked"({/if}) /> 布局3（6:4）
       </dd>
       </dl>

       <br class="clear" />

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
