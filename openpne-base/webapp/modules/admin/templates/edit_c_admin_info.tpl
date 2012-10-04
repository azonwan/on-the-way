({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})

({assign var="page_name" value="通知・使用条款设定"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

<h2>通知・使用条款设定</h2>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
<tr>
<td class="menu">
<dl>
<dt><strong class="item">网站首页通知设置</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=h_home">【PC版】 h_home通知栏内容</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=k_h_home">【手机】 h_home通知</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=k_fh_diary">【手机】 fh_diary通知</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=k_f_home">【手机】 f_home通知</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=k_c_home">【手机】 c_home通知</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=daily_news_head">每日新闻上部</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=daily_news_foot">每日新闻下部</a></li>
</ul>
</dd>
<dt><strong class="item">使用条款</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=sns_kiyaku">使用条款</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})&amp;target=sns_privacy">个人隐私保护</a></li>
</ul>
</dd>
</dl>
</td>
<td class="detail">
<h3>
({if $requests.target == 'h_home'})
＜ＰＣ版＞首页通知栏内容
({elseif $requests.target == 'k_h_home'})
＜手机版＞首页通知
({elseif $requests.target == 'k_fh_diary'})
＜手机版＞日记页面通知
({elseif $requests.target == 'k_f_home'})
＜手机版＞朋友页面通知
({elseif $requests.target == 'k_c_home'})
＜手机版＞圈子页面通知
({elseif $requests.target == 'sns_kiyaku'})
使用条款
({elseif $requests.target == 'sns_privacy'})
个人隐私保护
({elseif $requests.target == 'daily_news_head'})
每日新闻上部
({elseif $requests.target == 'daily_news_foot'})
每日新闻下部
({/if})
</h3>
({if $msg})<p class="actionMsg">({$msg})</p>({/if})
({if $requests.target == 'sns_kiyaku' || $requests.target == 'sns_privacy'})
<p class="caution" id="c01">※HTML标签<strong>不能使用</strong></p>
({elseif $requests.target == 'daily_news_head' || $requests.target == 'daily_news_foot'})
({elseif $requests.target == 'k_h_home' || $requests.target == 'k_fh_diary' || $requests.target == 'k_f_home' || $requests.target == 'k_c_home'})
<p class="caution" id="c01">※能够使用HTML标签，编写内容<br />
※手机版本的通知中，如果含有外部网站链接，跳转到外部网站时，可能会泄漏“第三者可能登录的信息”。</p>
({else})
<p class="caution" id="c01">※能够使用HTML、JS代码编写内容。</p>
({/if})

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_c_admin_info','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target" value="({$requests.target})" />
<textarea name="body" cols="({$cols|default:60})" rows="({$rows|default:10})">({$c_siteadmin.body})</textarea>
<p class="textBtn"><input type="submit" value="变更" /></p>
</form>
({if $requests.target == 'k_h_home' || $requests.target == 'k_fh_diary' || $requests.target == 'k_f_home'|| $requests.target == 'k_c_home'})
<h4>【手机版】通知插入位置对应图[ ({if $requests.target == 'k_h_home'})
首页
({elseif $requests.target == 'k_f_home'})
({$WORD_FRIEND})页
({elseif $requests.target == 'k_c_home'})
({$WORD_COMMUNITY})页
({elseif $requests.target == 'k_fh_diary'})
({$WORD_DIARY})页
({/if}) ]</h4>
<p class="image">
<img src="modules/admin/img/admin_info_({$requests.target}).gif" />
</p>
({/if})
</td>
</tr>
</table>

<div class="contents">
({$inc_footer|smarty:nodefaults})
