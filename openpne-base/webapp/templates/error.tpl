<html>
<head>
<title>({if defined('SNS_NAME')})({$smarty.const.SNS_NAME})({else})页面无法显示({/if})</title>
</head>
<body>
({if $errors})({*デバッグ用エラー画面*})
<p>发生错误。</p>
<ul>
({foreach from=$errors item=item})
<li>({$item})</li>
({/foreach})
</ul>

({else})({*本番用*})

({if $notfound})
({*NotFound*})
<p>页面没有发现。</p>
({else})
({*维护页面*})
<p>
({if $smarty.const.OPENPNE_MAINTENANCE_TEXT})
({$smarty.const.OPENPNE_MAINTENANCE_TEXT|smarty:nodefaults})
({else})
目前服务器访问量过多或者正在维护。<br>
非常抱歉，请您过一段时间再来访问。
({/if})
十分对不起，请您等一段时间再来访问。</p>
({/if})

({/if})

<p>({if defined('SNS_NAME')})({$smarty.const.SNS_NAME})<br>({/if})
<a href="({$smarty.const.OPENPNE_URL})">({$smarty.const.OPENPNE_URL})</a></p>
</body>
</html>
