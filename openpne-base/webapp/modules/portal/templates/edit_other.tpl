({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="其他设定"})
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
           <form action="./" method="post">
           <input type="hidden" name="m" value="({$module_name})" />
           <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_other','do')})" />
           <input type="hidden" name="sessid" value="({$PHPSESSID})" />

           <table id="input_area">
               <tr>
                   <td>
                   <dl>
                   <dt><strong class="title">自定义CSS（高级设置）</strong></dt>
                   <dd><p>在这里你可以进行一套标准风格的设定。</p>
                   <p class="caution" id="c01">
                   ※在不清楚的情况下，可以什么都不输入。<br />
                   ※※「SNS网站」的页眉和页脚的图片、 <a href="?m=({$smarty.const.ADMIN_MODULE_NAME})&amp;a=page_({$hash_tbl->hash('edit_skin_image', 'page')})">[设计:皮肤图片变更]</a> 以及「进入前页眉」「共通页脚」的图片设定。想变更页眉和页脚的图片，请到另一页变更。</p></dd>

                   <dd><textarea name="custom_css" rows="10" cols="80">({$portal_config.custom_css})</textarea></dd>
                   </dl>
                   <br /><br />
                   <dl>
                   <dt><strong class="title">meta标记设定（任意输入）</strong></dt>
                   <dd><p>meta标记设定可进行keywords设定、description设定。<br />
                   keywords是想让搜索引擎检索到的关键字。<br />
                   description是搜索引擎检索结果一览中的描述性语言。</p></dd>

                   <dd>
                        <table class="inputForm">
                        <tr><th>keywords</th>
                        <td><input class="basic" type="text" name="meta_keywords" value="({$portal_config.meta_keywords})" /></td></tr>
                       <tr><th>description</th>
                        <td><input class="basic" type="text" name="meta_description" value="({$portal_config.meta_description})" /></td></tr>
                        </table></dd>
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
