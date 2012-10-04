({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="链接设定"})
({ext_include file="inc_tree_adminPortalConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})
<p class="actionMsg">({$msg})</p>
({elseif $error_msg})
<p class="actionMsg errorMsg">({$error_msg})</p>
({/if})
<h2>SNS网站创建</h2>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
   <tr>
   ({ext_include file="inc_menu_adminPortalConfig.tpl"})
       <td class="detail">
           <h3>({$page_name})</h3>
           <p>
           「SNS网站」链接设定。<br />
           请输入想显示链接的文本和URL。最多显示10个链接。<br />
           链接，按「顺序」从小值开始显示 。<br />
           <br />
           显示位置，请到[内容设定]页设定。
           </p>

           <p class="caution" id="c01">
           ※「显示」避开kara检查的话，「SNS网站」里不会显示那个链接。<br />
            ※「新建窗口」打开的话，链接将在新窗口打开。
            </p>

            <form action="./" method="post" />
            <input type="hidden" name="m" value="({$module_name})" />
            <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_link','do')})" />
            <input type="hidden" name="sessid" value="({$PHPSESSID})" />

            <table id="link_area">
            <thead>
            <tr>
                <th>链接文本</th>
                <th>URL</th>
                <th>顺序</th>
                <th>新建窗口</th>
                <th>显示</th>
            </tr>
            </thead>
            <tbody>
            ({section loop=10 name=item})
            ({assign var=i value=$smarty.section.item.index})
            ({assign var=portal_link value=$portal_link_list[$i]})
            <input type="hidden" name="link_list[({$i+1})][id]" value="({$portal_link.portal_link_id|default:''})" />
            <tr>
                <td><input type="text" class="basic link_title" name="link_list[({$i+1})][title]" value="({$portal_link.title|default:''})" /></td>
                <td><input type="text" class="basic link_url" name="link_list[({$i+1})][url]" value="({$portal_link.url|default:''})" /></td>
                <td><input type="text" class="basic link_sort_order" name="link_list[({$i+1})][sort_order]" value="({$portal_link.sort_order|default:'0'})" /></td>
                <td align="center"><input type="checkbox" class="basic link_is_target_blank" name="link_list[({$i+1})][is_target_blank]" value="1"({if $portal_link.is_target_blank || !$portal_link.portal_link_id}) checked="checked"({/if}) /></td>
                <td align="center"><input type="checkbox" class="basic link_is_enabled" name="link_list[({$i+1})][is_enabled]" value="1"({if $portal_link.is_enabled || !$portal_link.portal_link_id}) checked="checked"({/if}) /></td>
            </tr>
            ({/section})
            </tbody>
            </table>
           <p class="textBtn"><input type="submit" value="变更" /></p>
            </form>
       </td>
   </tr>
</table>
<div class="contents">

({$inc_footer|smarty:nodefaults})
