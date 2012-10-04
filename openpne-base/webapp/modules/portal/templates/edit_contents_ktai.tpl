({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="手机版内容设定"})
({ext_include file="inc_tree_adminPortalConfig.tpl"})
</div>

({*ここまで:navi*})
({if $msg})
<p class="actionMsg">({$msg})</p>
({elseif $error_msg})
<p class="actionMsg errorMsg">({$error_msg})</p>
({/if})
<h2>SNS网站建设</h2>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
   <tr>
   ({ext_include file="inc_menu_adminPortalConfig.tpl"})
       <td class="detail">

           <h3>({$page_name})</h3>
           <p>请决定显示的内容和显示的位置「SNS网站」。<br />
根据左侧的表里号码确定其位置。<br />
           <p class="caution" id="c01">※不想显示的内容请选择「不显示」。<br />
           ※两处不能设为同一号码。</p>

           <form action="./" method="post">
           <input type="hidden" name="m" value="({$module_name})" />
           <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_contents_ktai','do')})" />
           <input type="hidden" name="sessid" value="({$PHPSESSID})" />

           <table class="contents" cellpadding="0" cellspacing="0" border="0">
           <tr>
           <td class="menu">
           <dl>
           <dt>&nbsp;</dt>
           <dd>
           <img src="./modules/portal/admin/user_contents_ktai.gif" width="217" alt="" />
           </dd>
           </dl>
           </td>
           <td class="contents">

           <table class="contents">
           <tbody>

           <tr>
           <th>({$portal_free_area_list.1.name|default:'自由区域1'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_FREE1})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list})
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
           </td>
           </tr>

           <tr>
           <th>({$portal_free_area_list.2.name|default:'自由区域2'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_FREE2})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list})
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
           </td>
           </tr>

           <tr>
           <th>({$portal_free_area_list.3.name|default:'自由区域3'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_FREE3})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list})
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
           </td>
           </tr>

           <tr>
           <th>({$portal_free_area_list.4.name|default:'自由区域4'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_FREE4})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list})
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
           </td>
           </tr>
           </tbody>
           </table>

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
