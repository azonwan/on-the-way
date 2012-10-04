<?php /* Smarty version 2.6.18, created on 2012-10-04 20:16:31
         compiled from file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_ranking.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 't_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_ranking.tpl', 10, false),array('function', 't_img_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_ranking.tpl', 67, false),array('modifier', 't_escape', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_ranking.tpl', 13, false),array('modifier', 't_truncate', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/pc/templates/h_ranking.tpl', 94, false),)), $this); ?>
<div id="LayoutB">

<div id="Left">

<div class="parts rankingSideNav">
<div class="item">
<div class="partsHeading"><h3>被访问数No1</h3></div>
<p>昨天被访问次数较多的会员排行。</p>
<p class="link"><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_ranking'), $this);?>
">被访问数No1</a></p>
</div>
<div class="item">
<div class="partsHeading"><h3><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_MY_FRIEND']); ?>
数No1</h3></div>
<p>登录<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_MY_FRIEND']); ?>
数目较多的会员排行。
</p>
<p class="link"><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_ranking'), $this);?>
&amp;kind=friend"><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_MY_FRIEND']); ?>
数No1</a></p>
</div>

<div class="item">
<div class="partsHeading"><h3>参加人数No１<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
</h3></div>
<p>参加者较多的<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
排行榜。</p>
<p class="link"><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_ranking'), $this);?>
&amp;kind=com_member">参加人数No１<br />显示<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
</a></p>
</div>

<div class="item">
<div class="partsHeading"><h3>活跃度No１<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
</h3></div>
<p>昨日新增帖子数最多<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
的排行榜。</p>
<p class="link"><a href="<?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_h_ranking'), $this);?>
&amp;kind=com_comment">活跃度No１<br />显示<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
</a></p>
</div>
</div>

</div><!-- Left -->
<div id="Center">

<?php $_from = $this->_tpl_vars['rank_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['ranking'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['ranking']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['rank'] => $this->_tpl_vars['list']):
        $this->_foreach['ranking']['iteration']++;
?>
<?php if ($this->_tpl_vars['rank'] == 1): ?><?php $this->assign('size', 120); ?><?php else: ?><?php $this->assign('size', 76); ?><?php endif; ?>

<div class="dparts rankingList"><div class="parts">
<?php if ($this->_tpl_vars['rank'] == 1): ?>
<div class="partsHeading"><p><?php echo '<strong>'; ?><?php if ($this->_tpl_vars['kind'] == 'ashiato'): ?><?php echo '被访问数No1的会员'; ?><?php elseif ($this->_tpl_vars['kind'] == 'friend'): ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_MY_FRIEND']); ?><?php echo '数No1会员'; ?><?php elseif ($this->_tpl_vars['kind'] == 'com_member'): ?><?php echo '参加人数No１'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?><?php echo ''; ?><?php elseif ($this->_tpl_vars['kind'] == 'com_comment'): ?><?php echo '活跃度No1'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?><?php echo ''; ?><?php endif; ?><?php echo '是 </strong>'; ?><?php if ($this->_tpl_vars['kind'] == 'ashiato' || $this->_tpl_vars['kind'] == 'friend'): ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['list'][0]['c_member']['nickname']); ?><?php echo ''; ?><?php else: ?><?php echo '『'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['list'][0]['c_commu']['name']); ?><?php echo '』'; ?><?php endif; ?><?php echo '。'; ?>
</p></div>
<?php endif; ?>
<?php if ($this->_tpl_vars['rank'] > 1): ?><div class="ditem"><div class="item"><?php endif; ?>
<?php $_from = $this->_tpl_vars['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
<table>
<tr><td class="photo" rowspan="<?php if ($this->_tpl_vars['kind'] == 'ashiato' || $this->_tpl_vars['kind'] == 'friend'): ?>2<?php else: ?>4<?php endif; ?>"><?php echo ''; ?><?php if ($this->_tpl_vars['kind'] == 'ashiato' || $this->_tpl_vars['kind'] == 'friend'): ?><?php echo '<a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?><?php echo '&amp;target_c_member_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?><?php echo '"><img src="'; ?><?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['c_member']['image_filename']),'w' => smarty_modifier_t_escape($this->_tpl_vars['size']),'h' => smarty_modifier_t_escape($this->_tpl_vars['size']),'noimg' => 'no_image'), $this);?><?php echo '" alt="" /></a>'; ?><?php else: ?><?php echo '<a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_c_home'), $this);?><?php echo '&amp;target_c_commu_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_id']); ?><?php echo '"><img src="'; ?><?php echo smarty_function_t_img_url(array('filename' => smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu']['image_filename']),'w' => smarty_modifier_t_escape($this->_tpl_vars['size']),'h' => smarty_modifier_t_escape($this->_tpl_vars['size']),'noimg' => 'no_logo'), $this);?><?php echo '" alt="" /></a>'; ?><?php endif; ?><?php echo ''; ?>
</td>
<th>第<?php echo smarty_modifier_t_escape($this->_tpl_vars['rank']); ?>
位</th>
<td class="name"><?php echo ''; ?><?php if ($this->_tpl_vars['kind'] == 'ashiato' || $this->_tpl_vars['kind'] == 'friend'): ?><?php echo '<a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_f_home'), $this);?><?php echo '&amp;target_c_member_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?><?php echo '">'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member']['nickname']); ?><?php echo '</a>'; ?><?php else: ?><?php echo '<a href="'; ?><?php echo smarty_function_t_url(array('m' => 'pc','a' => 'page_c_home'), $this);?><?php echo '&amp;target_c_commu_id='; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_id']); ?><?php echo '">'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu']['name']); ?><?php echo '</a>'; ?><?php endif; ?><?php echo '：'; ?><?php if ($this->_tpl_vars['kind'] == 'ashiato'): ?><?php echo '被访问'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['count']); ?><?php echo '次'; ?><?php elseif ($this->_tpl_vars['kind'] == 'friend'): ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['count']); ?><?php echo '人'; ?><?php elseif ($this->_tpl_vars['kind'] == 'com_member'): ?><?php echo ''; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['count']); ?><?php echo '人'; ?><?php elseif ($this->_tpl_vars['kind'] == 'com_comment'): ?><?php echo '话题'; ?><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['count']); ?><?php echo '个'; ?><?php endif; ?><?php echo ''; ?>
</td>
</tr>
<?php if ($this->_tpl_vars['kind'] == 'ashiato' || $this->_tpl_vars['kind'] == 'friend'): ?>
<tr>
<th>自我介绍</th>
<td><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['c_member']['profile']['self_intro']['value']))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 36, "", 3) : smarty_modifier_t_truncate($_tmp, 36, "", 3)); ?>
</td>
</tr>
<?php elseif ($this->_tpl_vars['kind'] == 'com_member' || $this->_tpl_vars['kind'] == 'com_comment'): ?>
<tr>
<th>分类</th>
<td><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu']['c_commu_category']['name']); ?>
</td>
</tr>
<tr>
<th>管理者</th>
<td><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu']['c_member_admin']['nickname']); ?>
</td>
</tr>
<tr>
<th>说明</th>
<td><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu']['info']))) ? $this->_run_mod_handler('t_truncate', true, $_tmp, 36, "", 3) : smarty_modifier_t_truncate($_tmp, 36, "", 3)); ?>
</td>
</tr>
<?php endif; ?>
</table>
<?php endforeach; endif; unset($_from); ?>
<?php if ($this->_tpl_vars['rank'] > 1): ?></div></div><?php endif; ?>
</div></div>

<?php endforeach; endif; unset($_from); ?>

</div><!-- Center -->
</div><!-- LayoutB -->