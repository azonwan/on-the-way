<div id="LayoutA">
<div id="Left">

({* {{{ homePhotoBox *})
<div class="dparts homePhotoBox">
<div class="parts">
<p class="photo"><img src="({t_img_url filename=$group.image_filename w=180 h=180 noimg=no_image})" alt="" /></p>
</div>
<p class="text">({$group.name})</p>
</div>
({* }}} *})

</div><!-- Left -->
<div id="Center">

({* {{{ homeMainTable *})
<div class="dparts homeMainTable"><div class="parts">
<div class="partsHeading"><h3>团体信息</h3></div>
<table>
<tr><th>团体名称</th><td>({$group.name})</td></tr>
<tr><th>管理者</th><td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$admin_data.c_member_id})">({$admin_data.nickname})</a></td></tr>
<tr><th>人数</th><td>({$member_count|default:"0"})人</td></tr>
<tr><th>团队简介/说明</th><td>({$group.info|t_url2a|nl2br})</td></tr>
({if $is_admin})
<tr><th></th><td>
<div class="moreInfo"><ul class="moreInfo">
<li><a href="({t_url m=biz a=page_h_biz_group_edit})&amp;target_id=({$group.biz_group_id})">管理员设定</a></li>
</ul></div>
</td></tr>
({/if})
</table>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutA -->

({if $calendar_head})
({$calendar_head|smarty:nodefaults})
({$calendar_value|smarty:nodefaults})
({$calendar_foot|smarty:nodefaults})
({/if})
