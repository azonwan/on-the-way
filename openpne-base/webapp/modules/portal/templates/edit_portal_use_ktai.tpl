({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="手机版使用设定"})
({ext_include file="inc_tree_adminPortalConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>SNS网站建设</h2>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
   <tr>
   ({ext_include file="inc_menu_adminPortalConfig.tpl"})
       <td class="detail">

           <h3>({$page_name})</h3>
           <p>
           作为进入页，是否使用「SNS网站」默认进入页请选择。
           </p>

           <p class="caution" id="c01">
           ※如果现在使用手机版外部进入页，在这里选择「使用」的话，SNS设定的[因为手机版外部进入页URL ]被写在上面请注意。
           </p>

           <form action="./" method="post">
           <input type="hidden" name="m" value="({$module_name})" />
           <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_portal_use_ktai','do')})" />
           <input type="hidden" name="sessid" value="({$PHPSESSID})" />

           <table id="input_area">
               <tr>
                   <td>
                       <dl>
                       <dt><strong class="title">SNS网站</strong></dt>
                       <dd>
                       <select class="basic" name="use_portal">
                       <option value="1"({if $portal_config.use_portal == '1'}) selected="selected"({/if})>使用</option>
                       <option value="0"({if $portal_config.use_portal == '0'}) selected="selected"({/if})>禁用</option>
                       </select>
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

