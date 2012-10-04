({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="发送邀请邮件"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>邀请邮件送信确认</h2>
<div class="contents">

({if $requests.pc_mails})
({if !(($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_PC))})
被设定成从PC无法登录。<br>
<div class="caution">※以下邮件地址无法送信</div>
({else})
<dl class="invitesAdd">
	<dt><strong>【PC邮件地址】</strong></dt>
({/if})
<dd>({foreach from=$requests.pc_mails item=item name=pm})<strong>({$item})</strong>({if !$smarty.foreach.pm.last})&nbsp;／&nbsp;({/if})({/foreach})</dd>
</dl>
({/if})
({if $requests.ktai_mails})
({if !(($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_KTAI))})
被设定成从手机无法登录。<br>
<div class="caution">※以下邮件地址无法送信</div>
({else})
<dl class="invitesAdd">
	<dt><strong>【手机邮件地址】</strong></dt>
({/if})
	<dd>({foreach from=$requests.ktai_mails item=item name=km})<strong>({$item})</strong>({if !$smarty.foreach.km.last})&nbsp;／&nbsp;({/if})({/foreach})</dd>
</dl>
({/if})
({if $smarty.const.IS_GET_EASY_ACCESS_ID == 2 || $smarty.const.IS_GET_EASY_ACCESS_ID == 3})
<dl class="invitesAdd">
    <dt><strong>【手机个体识别号码登录】</strong></dt>
    ({if $requests.is_disable_regist_easy_access_id})
    <dd><strong>非必须</strong></dd>
    ({else})
    <dd><strong>必须</strong></dd>
    ({/if})
</dl>
({if $smarty.const.IS_GET_EASY_ACCESS_ID == 2})
<div class="caution">※只适用手机手机邮件地址邀请。</div>
({/if})
({/if})
({if $requests.error_mails})
<dl class="invitesAdd" id="warning">
	<dt><strong>以下邮件地址因为已经登录到被拒绝列表之中，无法送信。</strong></dt>
	<dd>({foreach from=$requests.error_mails item=item name=em})<strong>({$item})</strong>({if !$smarty.foreach.em.last})&nbsp;／&nbsp;({/if})({/foreach})</dd>
</dl>
({/if})

({if !$cannot_send})
<p class="caution" id="c02">可以送信吗？</p>
({/if})
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_invites','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="mails" value="({$requests.mails})" />
<input type="hidden" name="message" value="({$requests.message})" />
<input type="hidden" name="is_disable_regist_easy_access_id" value="({$requests.is_disable_regist_easy_access_id})" />
({if !$cannot_send})<p class="textBtn"><input name="complete" type="submit" value="送信"></p>({/if})<p class="textBtn"><input name="input" type="submit" value="修改"></p>
</form>
<br class="clear" />
({if $pc_subject || $ktai_subject})
<h3>邀请函内容确认<span>(※不能变更)</span></h3>

({if $pc_subject})
<h4>【面向PC】</h4>
<dl class="invitesDetail">
<dt><strong>件名</strong></dt>
<dd>({$pc_subject})</dd>
<dt><strong>内容</strong></dt>
<dd><textarea rows="10" cols="72" readonly="readonly">({$pc_body})</textarea></dd>
</dl>
({/if})
({if $ktai_subject})
<h4>【面向手机】</h4>
<dl class="invitesDetail">
<dt><strong>件名</strong></dt>
<dd>({$ktai_subject})</dd>
<dt><strong>内容</strong></dt>
<dd><textarea rows="10" cols="72" readonly="readonly">({$ktai_body})</textarea></dd>
</dl>

({/if})
({/if})

({$inc_footer|smarty:nodefaults})
