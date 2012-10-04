({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="颜色设定"})
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
           <p>请选择喜欢的颜色设定 边框的设计和颜色变化</p>
           <p class="caution" id="c01">※「SNS网站」的页眉和页脚的图片，<a href="?m=({$smarty.const.ADMIN_MODULE_NAME})&amp;a=page_({$hash_tbl->hash('edit_skin_image', 'page')})">[设计:皮肤图片变更]</a> 也有「进入前页眉」「共通页脚」的图片设定。想变更页眉和页脚的图片，请到另一页变更。 </p>

           <form action="./" method="post">
           <input type="hidden" name="m" value="({$module_name})" />
           <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_color','do')})" />
           <input type="hidden" name="sessid" value="({$PHPSESSID})" />

           <table id="color_changer_area">
               <tr>
                   <td>

                    ({foreach from=$skin item=item key=key})
                   <dl class="box"><dd>
                        ({if $item.thumbnail})
                       <img src="./modules/portal/skin/({$key})/({$item.thumbnail})" width="100" alt="({$item.caption})" /><br />
                        ({else})
                        <div class="color_sample" style="background-color:({$item.color});">&nbsp;</div>
                        ({/if})
                       <input type="radio" name="color_type" value="({$key})"({if $portal_config.color_type == $key}) checked="checked"({/if}) />({$item.caption})
                   </dd></dl>
                    ({/foreach})

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

