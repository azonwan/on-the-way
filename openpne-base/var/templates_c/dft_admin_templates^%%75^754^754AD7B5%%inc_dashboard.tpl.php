<?php /* Smarty version 2.6.18, created on 2012-10-04 20:13:49
         compiled from file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/inc_dashboard.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 't_assign_sns_info', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/inc_dashboard.tpl', 5, false),array('function', 't_assign_sns_ranking', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/inc_dashboard.tpl', 20, false),array('function', 't_url', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/inc_dashboard.tpl', 28, false),array('function', 't_assign_sns_message', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/inc_dashboard.tpl', 42, false),array('function', 't_assign_sns_new_diary', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/inc_dashboard.tpl', 56, false),array('function', 't_assign_sns_new_topic', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/inc_dashboard.tpl', 70, false),array('function', 't_assign_sns_new_review', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/inc_dashboard.tpl', 84, false),array('function', 't_assign_sns_new_member', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/inc_dashboard.tpl', 98, false),array('modifier', 't_escape', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/inc_dashboard.tpl', 8, false),array('modifier', 'number_format', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/inc_dashboard.tpl', 8, false),array('modifier', 'date_format', 'file:/usr/local/nginx/html/openpne-base/webapp/modules/admin/templates/inc_dashboard.tpl', 49, false),)), $this); ?>
    <div class="noticeTypeA">
        <div class="box" id="counter">
            <h2>SNS信息</h2>
            <div class="innerBox">
<?php echo smarty_function_t_assign_sns_info(array('var' => 'sns_info'), $this);?>

<dl>
    <dt>总成员数</dt>
    <dd><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['sns_info']['info_member_count']))) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
人 (昨日注册 <?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['sns_info']['info_member_count_yesterday']))) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
人)</dd>
    <dt>总<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
数</dt>
    <dd><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['sns_info']['info_commu_count']))) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
</dd>
    <dt>百分率</dt>
    <dd><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['sns_info']['info_member_rate_active']))) ? $this->_run_mod_handler('number_format', true, $_tmp, 2) : number_format($_tmp, 2)); ?>
%</dd>
    <dt>平均<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_FRIEND']); ?>
数</dt>
    <dd><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['sns_info']['info_friend_count_avg']))) ? $this->_run_mod_handler('number_format', true, $_tmp, 2) : number_format($_tmp, 2)); ?>
人</dd>
    <dt>今日<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
数</dt>
    <dd><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['sns_info']['info_diary_count_today']))) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
件 (昨日<?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['sns_info']['info_diary_count_yesterday']))) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
件)</dd>
</dl>
            </div>
        </div>
<?php echo smarty_function_t_assign_sns_ranking(array('var' => 'sns_rank'), $this);?>

        <div class="box" id="ranking">
            <h2>排列次序</h2>
            <?php if ($this->_tpl_vars['sns_rank']['rank_ashiato'] || $this->_tpl_vars['sns_rank']['rank_friend'] || $this->_tpl_vars['sns_rank']['rank_com_member'] || $this->_tpl_vars['sns_rank']['rank_com_comment']): ?>
            <div class="innerBox">
<dl>
    <?php if ($this->_tpl_vars['sns_rank']['rank_ashiato']): ?>
    <dt>访问数No.1</dt>
    <dd><a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['sns_rank']['rank_ashiato'][1][0]['c_member']['c_member_id']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['sns_rank']['rank_ashiato'][1][0]['c_member']['nickname']); ?>
</a> (<?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['sns_rank']['rank_ashiato'][1][0]['count']))) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
访问)</dd><?php endif; ?>
    <?php if ($this->_tpl_vars['sns_rank']['rank_friend']): ?>
    <dt><?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_MY_FRIEND']); ?>
数No.1</dt>
    <dd><a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['sns_rank']['rank_friend'][1][0]['c_member']['c_member_id']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['sns_rank']['rank_friend'][1][0]['c_member']['nickname']); ?>
</a> (<?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['sns_rank']['rank_friend'][1][0]['count']))) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
人)</dd><?php endif; ?>
    <?php if ($this->_tpl_vars['sns_rank']['rank_com_member']): ?>
    <dt>参加人数No.1<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
</dt>
    <dd><a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_c_home'), $this);?>
&amp;target_c_commu_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['sns_rank']['rank_com_member'][1][0]['c_commu_id']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['sns_rank']['rank_com_member'][1][0]['c_commu']['name']); ?>
</a> (<?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['sns_rank']['rank_com_member'][1][0]['count']))) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
人)</dd><?php endif; ?>
    <?php if ($this->_tpl_vars['sns_rank']['rank_com_comment']): ?>
    <dt>受欢迎度No.1<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
</dt>
    <dd><a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_c_home'), $this);?>
&amp;target_c_commu_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['sns_rank']['rank_com_comment'][1][0]['c_commu_id']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['sns_rank']['rank_com_comment'][1][0]['c_commu']['name']); ?>
</a> (写入<?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['sns_rank']['rank_com_comment'][1][0]['count']))) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
件)</dd><?php endif; ?>
</dl>
            </div>
            <?php endif; ?>
        </div>
<?php echo smarty_function_t_assign_sns_message(array('var' => 'sns_message'), $this);?>

        <div class="box" id="message">
            <h2>所有未读信息 <span class="unread">(<a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_h_message_box'), $this);?>
" target="_blank"><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['sns_message']['unread_messsage_count']))) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
</a>件)</span></h2>
            <?php if ($this->_tpl_vars['sns_message']['unread_message_list']): ?>
            <div class="innerBox">
<dl>
<?php $_from = $this->_tpl_vars['sns_message']['unread_message_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
    <dt><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m/%d %H:%M") : smarty_modifier_date_format($_tmp, "%m/%d %H:%M")); ?>
</dt>
    <dd><a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_h_message'), $this);?>
&amp;target_c_message_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_message_id']); ?>
&amp;jyusin_c_message_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_message_id']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['subject']); ?>
</a> <span class="origin">(<a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id_from']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member']['nickname']); ?>
</a>)</span></dd>
<?php endforeach; endif; unset($_from); ?>
</dl>
            </div>
            <?php endif; ?>
        </div>
<?php echo smarty_function_t_assign_sns_new_diary(array('var' => 'new_diary_list'), $this);?>

        <div class="box" id="diary">
            <h2>最新<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_DIARY']); ?>
</h2>
            <?php if ($this->_tpl_vars['new_diary_list']): ?>
            <div class="innerBox">
<dl>
<?php $_from = $this->_tpl_vars['new_diary_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
    <dt><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m/%d %H:%M") : smarty_modifier_date_format($_tmp, "%m/%d %H:%M")); ?>
</dt>
    <dd><a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_fh_diary'), $this);?>
&amp;target_c_diary_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_diary_id']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['subject']); ?>
 (<?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['count_comments']))) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
) </a> <span class="origin">(<a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member']['nickname']); ?>
</a>)</span></dd>
<?php endforeach; endif; unset($_from); ?>
</dl>
            </div>
            <?php endif; ?>
        </div>
<?php echo smarty_function_t_assign_sns_new_topic(array('var' => 'new_topic_list'), $this);?>

        <div class="box" id="community">
            <h2>最新建立<?php echo smarty_modifier_t_escape($this->_tpl_vars['WORD_COMMUNITY']); ?>
</h2>
            <?php if ($this->_tpl_vars['new_topic_list']): ?>
            <div class="innerBox">
<dl>
<?php $_from = $this->_tpl_vars['new_topic_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
    <dt><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m/%d %H:%M") : smarty_modifier_date_format($_tmp, "%m/%d %H:%M")); ?>
</dt>
    <dd><a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_c_topic_detail'), $this);?>
&amp;target_c_commu_topic_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_topic_id']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['name']); ?>
 (<?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['count_comments']))) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
)</a> <span class="origin">(<a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_c_home'), $this);?>
&amp;target_c_commu_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_commu_id']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['commu_name']); ?>
</a>)</span></dd>
<?php endforeach; endif; unset($_from); ?>
</dl>
            </div>
            <?php endif; ?>
        </div>
<?php echo smarty_function_t_assign_sns_new_review(array('var' => 'new_review_list'), $this);?>

        <div class="box" id="review">
            <h2>最新评论</h2>
            <?php if ($this->_tpl_vars['new_review_list']): ?>
            <div class="innerBox">
<dl>
<?php $_from = $this->_tpl_vars['new_review_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
    <dt><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_datetime']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m/%d %H:%M") : smarty_modifier_date_format($_tmp, "%m/%d %H:%M")); ?>
</dt>
    <dd><a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_h_review_list_product'), $this);?>
&amp;c_review_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_review_id']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_review']['title']); ?>
 (<?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['count_comments']))) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
)</a> <span class="origin">(<a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member']['nickname']); ?>
</a>)</span></dd>
<?php endforeach; endif; unset($_from); ?>
</dl>
            </div>
            <?php endif; ?>
        </div>
<?php echo smarty_function_t_assign_sns_new_member(array('var' => 'new_member_list'), $this);?>

        <div class="box" id="member">
            <h2>最近加入的成员</h2>
            <?php if ($this->_tpl_vars['new_member_list']): ?>
            <div class="innerBox">
<dl>
<?php $_from = $this->_tpl_vars['new_member_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
    <dt><?php echo ((is_array($_tmp=smarty_modifier_t_escape($this->_tpl_vars['item']['r_date']))) ? $this->_run_mod_handler('date_format', true, $_tmp, "%m/%d %H:%M") : smarty_modifier_date_format($_tmp, "%m/%d %H:%M")); ?>
</dt>
    <dd><a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['nickname']); ?>
</a> <span class="origin">(招待者: <a href="<?php echo smarty_function_t_url(array('_absolute' => 1,'m' => 'pc','a' => 'page_f_home'), $this);?>
&amp;target_c_member_id=<?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_id_invite']); ?>
" target="_blank"><?php echo smarty_modifier_t_escape($this->_tpl_vars['item']['c_member_invite']['nickname']); ?>
</a>)</span></dd>
<?php endforeach; endif; unset($_from); ?>
</dl>
            </div>
            <?php endif; ?>
        </div>
    </div>
    <br class="clear" />