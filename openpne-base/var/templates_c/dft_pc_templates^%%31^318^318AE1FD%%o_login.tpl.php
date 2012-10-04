<?php /* Smarty version 2.6.18, created on 2012-10-04 20:14:41
         compiled from file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/o_login.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 't_img_url_skin', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/o_login.tpl', 5, false),array('function', 't_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/o_login.tpl', 15, false),array('function', 't_img_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/o_login.tpl', 16, false),array('modifier', 't_escape', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/o_login.tpl', 15, false),array('block', 't_form_block', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/o_login.tpl', 25, false),)), $this); ?>
<?php $this->assign('INC_HEADER_is_login', true); ?>
<?php $this->assign('INC_FOOTER_is_login', true); ?>

<div id="container_login"><div class="w_screen">
<img src="<?php echo smarty_function_t_img_url_skin(array('filename' => 'skin_login_open'), $this);?>
" class="bg" alt="" />

<?php if ($this->_tpl_vars['top_banner_html_before'] || $this->_tpl_vars['top_banner_html_after']): ?>
<div class="banner">
<?php echo $this->_tpl_vars['top_banner_html_before']; ?>

</div>
<?php elseif ($this->_tpl_vars['INC_PAGE_HEADER']['c_banner_id']): ?>
<div class="banner">
<?php echo ''; ?><?php if ($this->_tpl_vars['INC_PAGE_HEADER']['a_href']): ?><?php echo '<a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'do_o_click_banner'), $this);?><?php echo '&amp;target_c_banner_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['INC_PAGE_HEADER']['c_banner_id']); ?><?php echo '" target="_blank"><img src="'; ?><?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['INC_PAGE_HEADER']['image_filename'])), $this);?><?php echo '" alt="" /></a>'; ?><?php else: ?><?php echo '<img src="'; ?><?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['INC_PAGE_HEADER']['image_filename'])), $this);?><?php echo '" alt="" />'; ?><?php endif; ?><?php echo ''; ?>

</div>
<?php endif; ?>

<?php $this->_tag_stack[] = array('t_form_block', array('_attr' => 'name="login" id="login"','m' => 'pc','a' => 'do_o_login')); $_block_repeat=true;smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
<input type="hidden" name="login_params" value="<?php echo smarty_modifier_t_escape($this->_tpl_vars['requests']['login_params']); ?>
" />
<input type="text" class="input_text" name="username" id="username" tabindex="1" />
<input type="password" class="input_text" name="password" id="password" tabindex="2" />
<input type="image" name="submit" src="./skin/dummy.gif" id="button_login" tabindex="4" alt="登录" />
<?php if (! $this->_tpl_vars['IS_CLOSED_SNS'] && ( ( @OPENPNE_REGIST_FROM ) & ( @OPENPNE_REGIST_FROM_PC ) )): ?>
<a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_o_public_invite'), $this);?>
" id="button_new_regist"><img src="./skin/dummy.gif" alt="注册" /></a>
<?php endif; ?>
<div class="msg lh_130">
<input type="checkbox" class="input_checkbox" name="is_save" id="is_save" value="1" tabindex="3" /><label for="is_save">下次自动登录</label><br />
<?php if (@OPENPNE_AUTH_MODE == 'slavepne'): ?>
<?php if (@SLAVEPNE_PASSWORD_QUERY_URL_PC): ?>
<span class="password_query"><a href="<?php echo smarty_modifier_t_escape(@SLAVEPNE_PASSWORD_QUERY_URL_PC); ?>
">&gt;忘记密码请访问这里</a></span>
<?php endif; ?>
<?php else: ?>
<span class="password_query"><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_o_password_query'), $this);?>
">&gt;忘记密码请访问这里</a></span>
<?php endif; ?>
<?php if ($this->_tpl_vars['SSL_SELECT_URL']): ?>
<br /><a href="<?php echo smarty_modifier_t_escape($this->_tpl_vars['SSL_SELECT_URL']); ?>
"><?php if ($this->_tpl_vars['HTTPS']): ?>标准(http)<?php else: ?>SSL(https)<?php endif; ?>在这里</a>
<?php endif; ?>
</div>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_t_form_block($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
<div class="footer">
<p><?php echo $this->_tpl_vars['inc_page_footer']; ?>
</p>
</div>
</div></div>