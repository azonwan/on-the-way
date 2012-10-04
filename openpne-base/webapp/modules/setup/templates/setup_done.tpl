({ext_include file="inc_header.tpl"})

<p>安装完成。</p>
<p>更详细的网站初期设定，可以在管理画面的菜单"SNS设定变更"中设定。</p>

<ul>
<li><a href="({t_url m=pc})">登录页面</a></li>
<li><a href="({t_url m=$smarty.const.ADMIN_MODULE_NAME})">管理页面</a></li>
</ul>

<ul>
<li><a href="http://sns.openpne.org.cn/?m=pc&amp;a=page_o_public_invite" target="_blank">OpenPNE中文官方SNS网站用户注册</a></li>
</ul>
<p>如果还需安装一些高级设置，请直接修改config.php文件，详细内容请参考<a href="http://openpne.org.cn">OpenPNE中文官方网站</a></p>
<ul class="caution">
<li>请手动删除网站根目录下的install.php文件，否则后果自负。</li>
</ul>

({ext_include file="inc_footer.tpl"})
