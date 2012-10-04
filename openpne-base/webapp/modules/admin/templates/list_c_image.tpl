({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="上传图像一览"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2 id="ttl01">上传图像一览</h2>
<div class="contents">
<form action="./" method="get">
<p id="numberDisplays">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_image')})" />
<strong>显示件数</strong>：
<select class="basic" name="page_size">
<option value="20"({if $pager.page_size==20}) selected="selected"({/if})>20件</option>
<option value="50"({if $pager.page_size==50}) selected="selected"({/if})>50件</option>
<option value="100"({if $pager.page_size==100}) selected="selected"({/if})>100件</option>
<option value="500"({if $pager.page_size==500}) selected="selected"({/if})>500件</option>
</select>
<span class="textBtnS"><input type="submit" value="变更"></span><span class="btnCaution">※显示件数过多，会加重处理，增加服务器负荷。</span>
</p>
</form>


<div class="listControl" id="pager01">
<p class="display">
显示({$pager.total_num}) 件中的第 ({$pager.start_num}) - ({$pager.end_num})件</p>
({capture name="pager"})
<p class="listMove">
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})">上一页</a>({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})&nbsp;|&nbsp;<strong>({$i})</strong>({else})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})&amp;page=({$i})&amp;page_size=({$pager.page_size})">({$i})</a>({/if})
({/foreach})
({if $pager.next_page})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})">下一页</a>({/if})
</p>
({/capture})

({$smarty.capture.pager|smarty:nodefaults})
</div>({*/div class="listControl"*})



<div class="imageListTable">

({foreach name=c_image from=$c_image_list item=item})
<div class="cell">
<dl>
<dt class="day">({$item.r_datetime|date_format:"%Y/%m/%d %H:%M"})</dt>
<dd class="upImage"><a href="({t_img_url filename=$item.filename})" target="_blank"><img src="({t_img_url filename=$item.filename w=120 h=120})" /></a></dd>
<dd class="fileName">({$item.filename})</dd>
<dd class="delete">&nbsp;
({if strpos($item.filename, 'skin_') !== 0 && strpos($item.filename, 'no_') !== 0})
[&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_image_confirm')})&amp;target_c_image_id=({$item.c_image_id})">删除</a>&nbsp;]
({/if})
({if $item.param})
&nbsp;[<a href="({t_url _absolute=1 m=pc})({$item.param})" target="_blank">链接</a>]
({/if})
&nbsp;</dd>
</dl>
</div>
({/foreach})

<br class="clear" />
</div>({*/div class="imageListTable"*})



<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
<p class="display">显示({$pager.total_num}) 件中的第 ({$pager.start_num}) - ({$pager.end_num})件</p>
</div>({*/div class="listControlBtm"*})
</div>({*/div class="contents"*})

<h2 id="ttl02">图像管理</h2>

<div class="contents">

<div class="otherControl">
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_image')})">图像上传、删除页面</a></p>
</div>({*/div class="otherControl"*})
({$inc_footer|smarty:nodefaults})
