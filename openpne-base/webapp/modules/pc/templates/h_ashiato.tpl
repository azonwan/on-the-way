<div id="LayoutC">
<div id="Center">

({if $c_ashiato_list})

({* {{{ ashiatoList *})
<div class="dparts ashiatoList"><div class="parts">
<div class="partsHeading"><h3>访客</h3></div>
<div class="partsInfo">
<p>({$c_member.nickname})的访问者。最新显示到30件，同一人物、同一日期的访问者只表示最新到访时间。 </p>
</div>
<div class="item">
<p>页面全体的访问数：<strong>({$c_ashiato_num})</strong> 次</p>
<ul class="list">
({foreach from=$c_ashiato_list item=c_ashiato})
<li><div class="ashiatoTime">({$c_ashiato.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</div><div class="ashiatoPic"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_ashiato.c_member_id_from})"><img src="({t_img_url filename=$c_ashiato.image_filename w=40 h=40 noimg=no_image})" alt="" /></a></div><div class="ashiatoName"> <a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_ashiato.c_member_id_from})">({$c_ashiato.nickname|default:"&nbsp;"})</a></div></li>
({/foreach})
</ul>
</div>
</div></div>
({* }}} *})

({else})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>访客</h3></div>
<div class="block">
<p>目前还没有朋友访问过你的主页。</p>
</div>
</div></div>
({* }}} *})

({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
