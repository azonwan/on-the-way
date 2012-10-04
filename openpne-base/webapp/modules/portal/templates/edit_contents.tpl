({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminPortalConfig.tpl"})

({assign var="page_name" value="内容设定"})
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
           <p>「SNS网站」请决定显示的内容和显示的位置<br />
根据左侧的表里号码确定其位置。<br />
在页眉里，如果选择了[显示SNS名]会显示SNS名，选择了[手动输入]，则会显示手动输入的内容。</p>
           <p class="caution">※不想显示的内容请选择「不显示」。<br />
           ※两处不能设为同一号码。</p>
            ({if $smarty.const.CHECK_IMG_AUTH})
            <p class="caution">※设定图片认证有效将不能显示「最新({$WORD_COMMUNITY})写入」「({$WORD_COMMUNITY})热烈排列次序的」图片。想显示图片，把config.php 的 CHECK_IMG_AUTH 做为 false 之后再进行设定。</p>
            ({/if})

           <form action="./" method="post">
           <input type="hidden" name="m" value="({$module_name})" />
           <input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_contents','do')})" />
           <input type="hidden" name="sessid" value="({$PHPSESSID})" />

           <table class="contents" cellpadding="0" cellspacing="0" border="0">
           <tr>
           <td class="menu">
           <dl>
           <dt>&nbsp;</dt>
           <dd>
           <img src="./modules/portal/admin/user_contents.gif" width="210" alt="" />
           </dd>
           </dl>
           </td>
           <td class="contents">

           <table class="contents">
           <tbody>
           <tr>
           <th>显示标题</th>
           <td>
               <input type="radio" name="header_text_type" value="0"({if $portal_config.header_text_type == $smarty.const.PORTAL_CONFIG_HEAD_TEXT_TYPE_SNS }) checked="checked"({/if}) />显示SNS名<br />
               <input type="radio" name="header_text_type" value="1"({if $portal_config.header_text_type == $smarty.const.PORTAL_CONFIG_HEAD_TEXT_TYPE_MANUAL}) checked="checked"({/if}) />手动输入
               <input name="header_text" type="text" class="basic" value="({$portal_config.header_text})" size="30" />
           </td>
           </tr>
           <tr>
           <th>写入最新({$WORD_COMMUNITY})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_COMMUNITY})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})({if $smarty.const.CHECK_IMG_AUTH}) disabled="disabled" ({/if})/>({$WORD_COMMUNITY})图片显示
           </td>
           </tr>

           <tr>
           <th>最新审查</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_REVIEW})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})/>商品图片显示
           </td>
           </tr>

           <tr>
           <th>成员排名</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_ACCESS_RANKING})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
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
           <th>({$WORD_COMMUNITY})排名上升</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_COMMUNITY_RANKING})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})({if $smarty.const.CHECK_IMG_AUTH}) disabled="disabled" ({/if})/>({$WORD_COMMUNITY})图片显示
           </td>
           </tr>

           <tr>
           <th>预报</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_EVENT})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
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
           <th>({$portal_rss_list.1.name|default:'RSS列表1'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_RSS1})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})/>文章图片显示
           </td>
           </tr>

           <tr>
           <th>({$portal_rss_list.2.name|default:'RSS列表2'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_RSS2})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})/>文章图片显示
           </td>
           </tr>

           <tr>
           <th>({$portal_rss_list.3.name|default:'RSS列表3'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_RSS3})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})/>文章图片显示
           </td>
           </tr>

           <tr>
           <th>({$portal_rss_list.4.name|default:'RSS列表4'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_RSS4})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})/>文章图片显示
           </td>
           </tr>

           <tr>
           <th>({$portal_rss_list.5.name|default:'RSS列表5'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_RSS5})
               <select class="basic" name="({$name})">
               ({foreach key=key item=value from=$portal_layout.position_list })
                   ({if $key == $portal_config.layout_config.$name})
                   <option value="({$key})" selected="selected">({$value})</option>
                   ({else})
                   <option value="({$key})">({$value})</option>
                   ({/if})
               ({/foreach})
               </select>
               <input type="checkbox" name="({$name})_is_image" value="1" ({if $portal_config.layout_config.is_image.$name})checked="checked" ({/if})/>文章图片显示
           </td>
           </tr>

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

           <tr>
           <th>({$portal_free_area_list.5.name|default:'自由区域5'})</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_FREE5})
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
           <th>链接</th>
           <td>
               ({assign var="name" value=$smarty.const.PORTAL_LAYOUT_LINK})
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
