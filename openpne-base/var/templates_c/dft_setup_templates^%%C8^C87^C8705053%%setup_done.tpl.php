<?php /* Smarty version 2.6.18, created on 2012-10-04 20:11:53
         compiled from file:/usr/local/nginx/html/openpne-base/webapp/modules/setup/templates/setup_done.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'ext_include', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/setup/templates/setup_done.tpl', 1, false),array('function', 't_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/setup/templates/setup_done.tpl', 7, false),array('modifier', 't_escape', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/setup/templates/setup_done.tpl', 8, false),)), $this); ?>
<?php echo smarty_function_ext_include(array('file' => "inc_header.tpl"), $this);?>


<p>安装完成。</p>
<p>更详细的网站初期设定，可以在管理画面的菜单"SNS设定变更"中设定。</p>

<ul>
<li><a href="<?php echo smarty_function_t_url(array('m' => 'pc'), $this);?>
">登录页面</a></li>
<li><a href="<?php echo smarty_function_t_url(array('m' => smarty_modifier_t_escape(@ADMIN_MODULE_NAME)), $this);?>
">管理页面</a></li>
</ul>

<ul>
<li><a href="http://sns.openpne.org.cn/?m=pc&amp;a=page_o_public_invite" target="_blank">OpenPNE中文官方SNS网站用户注册</a></li>
</ul>
<p>如果还需安装一些高级设置，请直接修改config.php文件，详细内容请参考<a href="http://openpne.org.cn">OpenPNE中文官方网站</a></p>
<ul class="caution">
<li>请手动删除网站根目录下的install.php文件，否则后果自负。</li>
</ul>

<?php echo smarty_function_ext_include(array('file' => "inc_footer.tpl"), $this);?>
