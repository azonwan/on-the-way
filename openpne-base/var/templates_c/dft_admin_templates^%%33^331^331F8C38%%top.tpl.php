<?php /* Smarty version 2.6.18, created on 2012-10-04 20:13:49
         compiled from file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/top.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 't_escape', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/top.tpl', 9, false),array('function', 'ext_include', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/top.tpl', 14, false),)), $this); ?>
<?php echo $this->_tpl_vars['inc_header']; ?>

<div class="subNavi"></div>
</div>



<?php if ($this->_tpl_vars['msg']): ?>
<p class="actionMsg"><?php echo smarty_modifier_t_escape($this->_tpl_vars['msg']); ?>
</p>
<?php endif; ?>

<div class="contents">

<?php echo smarty_function_ext_include(array('file' => "inc_dashboard.tpl"), $this);?>


<?php echo $this->_tpl_vars['inc_footer']; ?>
