【({$SNS_NAME})】网站消息 [({$smarty.now|date_format:"%Y. %m. %d"})]
━━ ({$OPENPNE_URL}) ━━━━━━━━━━━━━━━━

({$CATCH_COPY})({$SNS_NAME})

本日的最新信息及排行榜[({$smarty.now|date_format:"%Y. %m. %d/%a"})]

----------------------------------------------------------

({$c_member.nickname}),您好。

这是({$CATCH_COPY})({$SNS_NAME})发来的网站消息

({if $daily_news_head|smarty:nodefaults})
({$daily_news_head|smarty:nodefaults})

({/if})
----------------------------------------------------------
■INDEX■
----------------------------------------------------------

◆({$WORD_MY_FRIEND})的最新({$WORD_DIARY})
◆参加({$WORD_COMMUNITY})的最新话题
◆({$c_member.nickname})的页面访问量
◆昨天的排行榜No.1？


----------------------------------------------------------
◆({$WORD_MY_FRIEND})的最新({$WORD_DIARY})◆
----------------------------------------------------------

({foreach from=$diary_friend_list item=item})
◇({$WORD_NICKNAME})：({$item.nickname})
　标题：({$item.subject})
　({t_url_mail m=pc a=page_fh_diary})&target_c_diary_id=({$item.c_diary_id})

({/foreach})

----------------------------------------------------------
◆参加({$WORD_COMMUNITY})的最新话题◆
----------------------------------------------------------

({$c_member.nickname})参加的({$WORD_COMMUNITY})最新话题。

({foreach from=$c_commu_topic_comment_list item=item})
◇圈子：({$item.c_commu_name})
　话题：({$item.c_commu_topic_name})
　({t_url_mail m=pc a=page_c_topic_detail})&target_c_commu_topic_id=({$item.c_commu_topic_id})

({/foreach})

----------------------------------------------------------
◆({$c_member.nickname})的页面访问数◆
----------------------------------------------------------

◇最近，访问({$c_member.nickname})的人
（确认朋友足迹）

　→　({t_url_mail m=pc a=page_h_ashiato})

◇({$c_member.nickname})的被访问量为：({$ashiato_num})人次


----------------------------------------------------------
◆昨天的排行榜No.1？◆
----------------------------------------------------------

◇昨天访问数No.1的用户？
　→　({t_url_mail m=pc a=page_h_ranking})&kind=ashiato

◇昨天追加({$WORD_MY_FRIEND})数No.1的用户？
　→　({t_url_mail m=pc a=page_h_ranking})&kind=friend

◇昨天参加人数No.1的圈子？
　→　({t_url_mail m=pc a=page_h_ranking})&kind=com_member

◇昨天人气度No.1的圈子？
　→　({t_url_mail m=pc a=page_h_ranking})&kind=com_comment

({if $daily_news_foot|smarty:nodefaults})
({$daily_news_foot|smarty:nodefaults})

({/if})
----------------------------------------------------------

邮件收信设定变更请登录后在「设定变更」中执行

◆◇({$SNS_NAME})网站消息是什么？

　把您的({$WORD_MY_FRIEND})的最新情报，参加的圈子投稿等情报，用邮件方式通知您。 

◆◇({$SNS_NAME})网站消息拒收请点击以下链接。
　→　({t_url_mail m=pc a=page_h_config})


({$inc_signature})
