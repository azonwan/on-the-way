({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="写入下载数据"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

({if $errors})
<p class="actionMsg">
({foreach name=err from=$errors item=i})({$i})<br />({/foreach})
</p>
({/if})
({if $msg})
<p class="actionMsg">
({$msg})<br />
</p>
({/if})
<h2 id ="ttl01">写入下载数据</h2>
<div class="contents">

<p class="info">下载写入的数据。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('download_xml','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<table class="basicType2">
<tr class="cell01">
<th colspan="2">对象</th>
<td style="border-right-style:none">
<input class="basicRadio" name="GET_DATA_TYPE" id="GET_DATA_TYPE_0" type="radio" value="0"({if $requests.GET_DATA_TYPE == 0}) checked="checked"({/if}) /><label for="GET_DATA_TYPE_0">日记</label><br />
<input class="basicRadio" name="GET_DATA_TYPE" id="GET_DATA_TYPE_2" type="radio" value="2"({if $requests.GET_DATA_TYPE == 2}) checked="checked"({/if}) /><label for="GET_DATA_TYPE_2">标题</label><br />
<input class="basicRadio" name="GET_DATA_TYPE" id="GET_DATA_TYPE_4" type="radio" value="4"({if $requests.GET_DATA_TYPE == 4}) checked="checked"({/if}) /><label for="GET_DATA_TYPE_4">活动</label><br />
</td>
<td style="border-left-style:none">
<input class="basicRadio" name="GET_DATA_TYPE" id="GET_DATA_TYPE_1" type="radio" value="1"({if $requests.GET_DATA_TYPE == 1}) checked="checked"({/if}) /><label for="GET_DATA_TYPE_1">日记和评论</label><br />
<input class="basicRadio" name="GET_DATA_TYPE" id="GET_DATA_TYPE_3" type="radio" value="3"({if $requests.GET_DATA_TYPE == 3}) checked="checked"({/if}) /><label for="GET_DATA_TYPE_3">留言和评论</label><br />
<input class="basicRadio" name="GET_DATA_TYPE" id="GET_DATA_TYPE_5" type="radio" value="5"({if $requests.GET_DATA_TYPE == 5}) checked="checked"({/if}) /><label for="GET_DATA_TYPE_5">活动和点评</label><br />
</td>
</tr>
<tr class="cell01">
<th colspan="2" rowspan="2">成员</th>
<td style="border-right-style:none">
<input class="basicRadio" name="SELECT_MEMBER" id="SELECT_MEMBER_0" type="radio" value="0"({if $requests.SELECT_MEMBER == 0}) checked="checked"({/if}) /><label for="SELECT_MEMBER_0">全体</label>
</td>
<td style="border-left-style:none">
<input class="basicRadio" name="SELECT_MEMBER" id="SELECT_MEMBER_1" type="radio" value="1"({if $requests.SELECT_MEMBER == 1}) checked="checked"({/if}) /><label for="SELECT_MEMBER_1">ＩＤ</label>
<input class="basic" name="SELECT_MEMBER_ID" type="text" value="({$requests.SELECT_MEMBER_ID})" size="11" /><br />
</td>
</tr>
<tr>
<td colspan="2"><span class="caution">※把指定ID成员制作的内容当成对象。<br />但也包含非指定ID成员的评论。</span></td>
</tr>
<tr class="cell01">
<th colspan="2">期间</th>
<td colspan = "2">
<input class="basicRadio" name="IS_PERIOD" id="IS_PERIOD_0" type="radio" value="0"({if $requests.IS_PERIOD == 0}) checked="checked"({/if}) /><label for="IS_PERIOD_0">没有指定</label><br />
<input class="basicRadio" name="IS_PERIOD" id="IS_PERIOD_1" type="radio" value="1"({if $requests.IS_PERIOD == 1}) checked="checked"({/if}) /><label for="IS_PERIOD_1">指定期间</label><br />
<input class="basic" name="PERIOD_FROM_YEAR" type="text" value="({$requests.PERIOD_FROM_YEAR})" size="4" />年
<select name="PERIOD_FROM_MONTH">
({foreach from=$date.month item=item})<option value="({$item})"({if $requests.PERIOD_FROM_MONTH == $item}) selected="selected"({/if})>({$item})</option>({/foreach})
</select>月
<select name="PERIOD_FROM_DAY">
({foreach from=$date.day item=item})<option value="({$item})"({if $requests.PERIOD_FROM_DAY == $item}) selected="selected"({/if})>({$item})</option>({/foreach})
</select>日 ～ <br />
<input class="basic" name="PERIOD_TO_YEAR" type="text" value="({$requests.PERIOD_TO_YEAR})" size="4" />年
<select name="PERIOD_TO_MONTH">
({foreach from=$date.month item=item})<option value="({$item})"({if $requests.PERIOD_TO_MONTH == $item}) selected="selected"({/if})>({$item})</option>({/foreach})
</select>月
<select name="PERIOD_TO_DAY">
({foreach from=$date.day item=item})<option value="({$item})"({if $requests.PERIOD_TO_DAY == $item}) selected="selected"({/if})>({$item})</option>({/foreach})
</select>日
</td>
</tr>
<tr class="cell01">
<th colspan="2">指定圈子</th>
<td colspan = "2">
<span class="caution">※只对选择的下载文件有效</span><br />
<input class="basicRadio" name="IS_COMMU" id="IS_COMMU_0" type="radio" value="0"({if $requests.IS_COMMU == 0}) checked="checked"({/if}) /><label for="IS_COMMU_0">没有指定</label><br />
<input class="basicRadio" name="IS_COMMU" id="IS_COMMU_1" type="radio" value="1"({if $requests.IS_COMMU == 1}) checked="checked"({/if}) /><label for="IS_COMMU_1">圈子范围</label>
<select name="CATEGORY_ID">
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})"({if $requests.CATEGORY_ID == $item.c_commu_category_id}) selected="selected"({/if})>({$item.name})</option>
({/foreach})
</select><br />
<input class="basicRadio" name="IS_COMMU" id="IS_COMMU_2" type="radio" value="2"({if $requests.IS_COMMU == 2}) checked="checked"({/if}) /><label for="IS_COMMU_2">圈子ＩＤ</label>
<input class="basic" name="COMMU_ID" type="text" value="({$requests.COMMU_ID})" size="11" />
</td>
</tr>
</table>

<p class="textBtn"><input type="submit" value="下载" /></p>
</form>

({$inc_footer|smarty:nodefaults})
