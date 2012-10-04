({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="RSS设定"})
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
           在「SNS」里可以设定5个RSS。<br />
           请输入想表示RSS信息的博客URL。显示最新5个RSS信息。<br />
           <br />
           显示位置，请以[内容设定]页设定。
           </p>

           <p class="caution" id="c01">
           ※不仅博客，也能直接输入RSS的URL。
           </p>

           <form action="./" method="post">
           <input type="hidden" name="m" value="({$module_name})" />
           <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_rss','do')})" />
           <input type="hidden" name="sessid" value="({$PHPSESSID})" />

           <table id="input_area">
               <tr>
                   <td>
                       <dl>
                        <dt class="title"><input type="text" class="basic" name="rss_name_1" value="({$portal_rss.rss_name_1|default:"RSS 1"})" size="30" /></dt>
                       <dd>URL&nbsp;<input type="text" class="basic" name="rss_1" value="({$portal_rss.rss_1})" size="100" /></dd></dl>

                       <dl>
                        <dt class="title"><input type="text" class="basic" name="rss_name_2" value="({$portal_rss.rss_name_2|default:"RSS 2"})" size="30" /></dt>
                       <dd>URL&nbsp;<input type="text" class="basic" name="rss_2" value="({$portal_rss.rss_2})" size="100" /></dd></dl>

                       <dl>
                        <dt class="title"><input type="text" class="basic" name="rss_name_3" value="({$portal_rss.rss_name_3|default:"RSS 3"})" size="30" /></dt>
                       <dd>URL&nbsp;<input type="text" class="basic" name="rss_3" value="({$portal_rss.rss_3})" size="100" /></dd></dl>

                       <dl>
                        <dt class="title"><input type="text" class="basic" name="rss_name_4" value="({$portal_rss.rss_name_4|default:"RSS 4"})" size="30" /></dt>
                       <dd>URL&nbsp;<input type="text" class="basic" name="rss_4" value="({$portal_rss.rss_4})" size="100" /></dd></dl>

                       <dl>
                        <dt class="title"><input type="text" class="basic" name="rss_name_5" value="({$portal_rss.rss_name_5|default:"RSS 5"})" size="30" /></dt>
                       <dd>URL&nbsp;<input type="text" class="basic" name="rss_5" value="({$portal_rss.rss_5})" size="100" /></dd></dl>
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
