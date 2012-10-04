<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function create_message_friend_invite($u, $body, $target_c_member_id)
{
    $msg_subject = '邀请成为朋友短信';

    $c_member = db_member_c_member4c_member_id_LIGHT($u);
    $p = array('target_c_member_id' => $target_c_member_id);
    $url = openpne_gen_url('pc', 'page_f_home', $p);

    $msg_body = <<<EOD
{$c_member['nickname']}已发送邀请成为朋友短信。

短信：
$body

这个成员URL：
$url
EOD;
    return array($msg_subject, $msg_body);
}

function create_message_commu_invite($u, $body, $c_commu_id)
{
    $msg_subject = WORD_COMMUNITY . '邀请成为圈子会员短信';

    $c_member = db_member_c_member4c_member_id_LIGHT($u);
    $c_commu = db_commu_c_commu4c_commu_id($c_commu_id);
    $p = array('target_c_commu_id' => $c_commu_id);
    $url = openpne_gen_url('pc', 'page_c_home', $p);
    $WORD_COMMUNITY = WORD_COMMUNITY;

    $msg_body = <<<EOD
{$c_member['nickname']}从{$WORD_COMMUNITY}已发送邀请短信。

{$WORD_COMMUNITY}名：
{$c_commu['name']}

短信：
$body

{$WORD_COMMUNITY}的URL
$url
EOD;
    return array($msg_subject, $msg_body);
}

function create_message_event_invite($u, $body, $c_commu_topic_id)
{
    $msg_subject = '邀请参加活动短信';

    $c_member = db_member_c_member4c_member_id_LIGHT($u);
    $c_commu_topic = db_commu_c_commu_topic4c_commu_topic_id($c_commu_topic_id);
    $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
    $url = openpne_gen_url('pc', 'page_c_event_detail', $p);

    $msg_body = <<<EOD
{$c_member['nickname']}已发送邀请。

圈子：
{$c_commu_topic['name']}

短信：
$body

此活动的URL
$url
EOD;
    return array($msg_subject, $msg_body);
}

function create_message_event_message($u, $body, $c_commu_topic_id)
{
    $msg_subject = '活动举办通知';

    $c_member = db_member_c_member4c_member_id_LIGHT($u);

    $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
    $url = openpne_gen_url('pc', 'page_c_event_detail', $p);

    $msg_body = <<<EOD
活动主办者{$c_member['nickname']}已发送活动举办通知。

短信：
$body

此活动的URL
$url
EOD;
    return array($msg_subject, $msg_body);
}

function create_message_commu_admin_request($u, $body, $target_c_commu_id)
{
    $msg_subject = WORD_COMMUNITY . '邀请成为管理员';

    $c_member = db_member_c_member4c_member_id_LIGHT($u);
    $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);
    $WORD_COMMUNITY = WORD_COMMUNITY;

    $msg_body = <<<EOD
{$c_member['nickname']}发送 {$c_commu['name']} {$WORD_COMMUNITY}的管理者交替希望短信到达了 。

短信：
{$body}

关于这个请求，请从同意等候名单选择。
EOD;
    return array($msg_subject, $msg_body);
}

function create_message_commu_sub_admin_request($u, $body, $target_c_commu_id)
{
    $msg_subject = WORD_COMMUNITY . '邀请成为副管理员';

    $c_member = db_member_c_member4c_member_id_LIGHT($u);
    $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);
    $WORD_COMMUNITY = WORD_COMMUNITY;

    $msg_body = <<<EOD
{$c_member['nickname']} 发送{$c_commu['name']} {$WORD_COMMUNITY}的副管理者交替希望短信到达了。

短信：
{$body}

关于这个请求，请从同意等候名单选择。
EOD;
    return array($msg_subject, $msg_body);
}

function create_message_commu_join_request($u, $body, $target_c_commu_id)
{
    $msg_subject = WORD_COMMUNITY . '参加圈子申请短信';

    $c_member = db_member_c_member4c_member_id_LIGHT($u);
    $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

    $msg_body = <<<EOD
{$c_member['nickname']} 希望参加{$c_commu['name']} {$WORD_COMMUNITY}已发送申请。

短信：
{$body}

关于这个请求，请从同意等候名单选择。
EOD;
    return array($msg_subject, $msg_body);
}

function create_message_friend_link_request($u, $body)
{
    $msg_subject = WORD_FRIEND . '链接请求消息';

    $c_member_id_from = $u;
    $c_member = db_member_c_member4c_member_id_LIGHT($u);
    $WORD_FRIEND = WORD_FRIEND;

    $msg_body = <<<EOD
{$c_member['nickname']} 从{$WORD_FRIEND}发送链接请求的消息到达了。

短信：
{$body}

关于这个请求，请从同意等候名单选择。
EOD;
    return array($msg_subject, $msg_body);
}


?>
