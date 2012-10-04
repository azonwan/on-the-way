({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="SNS设定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>SNS网站内部名称设定</h2>
<div class="contents">
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_admin_config_word','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<table class="basicType2">
<tr>
<th rowspan="4">朋友名称</th>
<th>朋友</th>
<td>
<span class="info">SNS内其他「朋友」名称设定</span><br />
<input class="basic" name="WORD_FRIEND" type="text" value="({$WORD_FRIEND})" size="30" />
</td>
</tr>
<tr>
<th>我的朋友</th>
<td>
<span class="info">SNS内其他「我的朋友」名称设定</span><br />
<input class="basic" name="WORD_MY_FRIEND" type="text" value="({$WORD_MY_FRIEND})" size="30" />
</td>
</tr>
<tr>
<th>朋友（手机）</th>
<td>
<span class="info">SNS内其他「朋友」（手机）名称设定</span><br />
<input class="basic" name="WORD_FRIEND_HALF" type="text" value="({$WORD_FRIEND_HALF})" size="30" />
</td>
</tr>
<tr>
<th>朋友（手机）</th>
<td>
<span class="info">SNS内其他「朋友」（手机）名称设定</span><br />
<input class="basic" name="WORD_MY_FRIEND_HALF" type="text" value="({$WORD_MY_FRIEND_HALF})" size="30" />
</td>
</tr>
<tr>
<th rowspan="2">日记名称</th>
<th>日記</th>
<td>
<span class="info">SNS内其他「日记」名称设定</span><br />
<input class="basic" name="WORD_DIARY" type="text" value="({$WORD_DIARY})" size="30" />
</td>
</tr>
<tr>
<th>日记（手机）</th>
<td>
<span class="info">SNS内其他「日记」（手机）名称设定</span><br />
<input class="basic" name="WORD_DIARY_HALF" type="text" value="({$WORD_DIARY_HALF})" size="30" />
</td>
</tr>
<tr>
<th rowspan="2">圈子名称变更</th>
<th>圈子</th>
<td>
<span class="info">SNS内其他「圈子」名称设定</span><br />
<input class="basic" name="WORD_COMMUNITY" type="text" value="({$WORD_COMMUNITY})" size="30" />
</td>
</tr>
<tr>
<th>圈子（手机）</th>
<td>
<span class="info">SNS内其他「圈子」（手机）名称设定</span><br />
<input class="basic" name="WORD_COMMUNITY_HALF" type="text" value="({$WORD_COMMUNITY_HALF})" size="30" />
</td>
</tr>
<tr>
<th rowspan="2">昵称名称</th>
<th>昵称</th>
<td>
<span class="info">SNS内其他「昵称」名称设定</span><br />
<input class="basic" name="WORD_NICKNAME" type="text" value="({$WORD_NICKNAME})" size="30" />
</td>
</tr>
<tr>
<th>昵称（手机）</th>
<td>
<span class="info">SNS内其他「昵称」（手机）名称设定</span><br />
<input class="basic" name="WORD_NICKNAME_HALF" type="text" value="({$WORD_NICKNAME_HALF})" size="30" />
</td>
</tr>
</table>
<p class="textBtn"><input type="submit" value="设定变更" /></p>
</form>

({$inc_footer|smarty:nodefaults})
