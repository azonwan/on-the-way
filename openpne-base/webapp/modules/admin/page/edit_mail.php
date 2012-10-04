<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メール文言更新
class admin_page_edit_mail extends OpenPNE_Action
{
    function execute($requests)
    {
        $pc = array(
            'm_pc_ashiato' => '访问履历和通知邮件',
            'm_pc_bbs_info' => '圈子投稿通知邮件',
            'm_pc_birthday_mail' => '我的朋友的生日通知邮件',
            'm_pc_change_mail' => 'PC邮件地址变更确认邮件',
            'm_pc_daily_news' => '每日新闻',
            'm_pc_friend_intro' => '我的朋友写的介绍文通知邮件',
            'm_pc_invite_end' => '登录完成邮件',
            'm_pc_join_commu' => '圈子参加通知邮件',
            'm_pc_message_event_message' => '活动通知短信通知邮件',
            'm_pc_message_event_invite' => '活动介绍短信通知邮件',
            'm_pc_message_syoukai_commu' => '圈子介绍短信通知邮件',
            'm_pc_message_syoukai_member' => '成员介绍短信通知邮件',
            'm_pc_message_syounin' => '承认短信通知邮件',
            'm_pc_message_zyushin' => '短信通知邮件',
            'm_pc_password_query' => '密码再发行邮件',
            'm_pc_schedule_mail' => '日历通知邮件',
            'm_pc_syounin_friend' => '承认朋友链接通知邮件',
            'm_pc_syoutai_mail' => 'SNS邀请邮件',
            'm_pc_taikai_end' => '退会完成邮件',
            'm_pc_rank_up' => '排位提高通知邮件',
        );
        $ktai = array(
            'm_ktai_ashiato' => '访问履历通知邮件',
            'm_ktai_bbs_info' => '圈子留言通知邮件',
            'm_ktai_change_ktai' => '手机邮件地址变更通知邮件',
            'm_ktai_login_get' => '手机版登录地址通知邮件',
            'm_ktai_login_regist_end' => '登录完成邮件',
            'm_ktai_message_zyushin' => '短信通知邮件',
            'm_ktai_password_query' => '密码再发行邮件',
            'm_ktai_regist_get' => '登录注册邮件(开放制)',
            'm_ktai_regist_invite' => '邀请邮件',
            'm_ktai_taikai_end' => '退会完成邮件',
            'm_ktai_rank_up' => '排位提高通知邮件',
        );
        $admin = array(
            'm_admin_taikai' => '退会成员信息邮件',
            'm_admin_rank_up' => '排位提高通知邮件',
        );

        $this->set('pc', $pc);
        $this->set('ktai', $ktai);
        $this->set('admin', $admin);
        $source = get_c_template_mail_source($requests['target']);
        if ($requests['target'] == 'inc_signature') {
            $subject = '';
            $body = $source;
        } else {
            list($subject, $body) = explode("\n", $source, 2);
        }
        $this->set('subject', $subject);
        $this->set('body', $body);
        return 'success';
    }
}

?>
