【({$SNS_NAME})】({$smarty.now|date_format:"%m/%d"})预定通知
({$c_member.nickname}) ，早上好。

这是从({$SNS_NAME})发来的通知。
日程表中的日程已到预定当日。
今天的预定为

({foreach from=$c_schedule_list item=item})
标题：({$item.title})
({/foreach})

点击以下URL确认详细信息。
邮件的通知设定可在做成预定时更改。

({t_url_mail m=pc a=page_h_calendar})

如果不想接受邮件或者更改邮件地址，请在设定变更中进行。

({$SNS_NAME})登录窗口
({$OPENPNE_URL})


({$inc_signature})