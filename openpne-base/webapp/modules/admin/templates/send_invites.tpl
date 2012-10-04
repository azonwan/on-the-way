({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="发送邀请邮件"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})


<h2>发送邀请邮件</h2>
<div class="contents">
({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_NONE})
<p>被设定为无法登录注册,不能送信。</p>
({else})

<p class="info">向输入的电子邮件中,发送「({$SNS_NAME})」邀请函。</p>
<ul class="caution" id="c01">
	<li>被作为ID为１的用户发送的邀请邮件。</li>
	<li>无法向已经登录完毕的邮件中发信。</li>
	<li>一次性向大批量的邮件地址中发信,系统可能无法全部发送。</li>
</ul>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_invites','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<dl>
<dt class="mails"><strong>电子邮件</strong></dt>
<dd class="mails"><textarea cols="50" rows="8" name="mails">({$requests.mails})</textarea></dd>
<dd class="caution" id="c02">※向复数邮件地址中送信时,请用改行区分。</dd>
<dt class="message"><strong>邀请函</strong></dt>
<dd class="message"><textarea cols="60" rows="5" name="message">({$requests.message})</textarea></dd>
({if $smarty.const.IS_GET_EASY_ACCESS_ID == 2 || $smarty.const.IS_GET_EASY_ACCESS_ID == 3})
<dt><strong>手机个体识别号码登录</strong></dt>
<dd>
    <input type="radio" name="is_disable_regist_easy_access_id" value="0" ({if $requests.is_disable_regist_easy_access_id === 0}) checked="checked" ({/if}) />必须<br />
    <input type="radio" name="is_disable_regist_easy_access_id" value="1" ({if $requests.is_disable_regist_easy_access_id !== 0}) checked="checked" ({/if}) />不必须<br />
</dd>
<dd class="caution" id="c02">※选择“不需要”时，邀请的成员，不用登录手机个体识别号码也可以登录系统。
({if $smarty.const.IS_GET_EASY_ACCESS_ID == 2})<br />※只适用邀请手机登陆邮件。({/if})</dd>
({/if})
</dl>
<p class="textBtn"><input type="submit" value="确认"></p>
</form>
({/if})
({$inc_footer|smarty:nodefaults})
