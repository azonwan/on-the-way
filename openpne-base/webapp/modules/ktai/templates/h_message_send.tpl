({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">ﾒｯｾｰｼﾞの送信</a></font><br>
</td></tr></table>

({t_form m=ktai a=do_h_message_send_insert_message})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})">
({if $msg})<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>({/if})
<font color="#({$ktai_color_config.font_06})">宛先：</font><br>
<select name="target_c_member_id">
({foreach from=$c_friend_list item=c_friend})
<option value="({$c_friend.c_member_id_to})">({$c_friend.nickname})
({/foreach})
</select>
<br>
<font color="#({$ktai_color_config.font_06})">※宛先の選択肢はﾗﾝﾀﾞﾑとなっています。送りたいﾒﾝﾊﾞｰがﾘｽﾄに表示されなかった場合、
<a href="({t_url m=ktai a=page_h_message_send})&amp;({$tail})">ここ</a>を押して画面を更新してください。</font><br>
<br>
<font color="#({$ktai_color_config.font_06})">件名：</font><br>
<input type="text" name="subject"><br>
<br>
<font color="#({$ktai_color_config.font_06})">本文：</font><br>
<textarea name="body" rows="6"></textarea><br>
<center>
<input type="submit" value="ﾒｯｾｰｼﾞを送る">
</center>
</form>
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_message_box})&amp;({$tail})">ﾒｯｾｰｼﾞﾎﾞｯｸｽ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
