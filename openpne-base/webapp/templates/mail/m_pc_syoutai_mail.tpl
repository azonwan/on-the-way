({$c_member.nickname})邀请您参加({$SNS_NAME})

您好！这是({$CATCH_COPY})({$SNS_NAME})网站发来的通知。

({$c_member.nickname})邀请您参加({$SNS_NAME})。
 

({if $invite_message})
---------< ({$c_member.nickname}) >给您的留言 ---------

({$invite_message})

--------------------------------------------------
({/if})

点击以下链接，实现会员登录(免费)，
便可参加({$SNS_NAME}) 。


■ 参加({$SNS_NAME})请点击以下链接进行注册。
({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne'})
({if $smarty.const.SLAVEPNE_SYOUTAI_URL_PC})
({$smarty.const.SLAVEPNE_SYOUTAI_URL_PC})
({else})
({$smarty.const.SLAVEPNE_SYOUTAI_URL_KTAI})
({/if})
({else})
({t_url_mail m=pc a=page_o_ri})&sid=({$sid})
({/if})


■ ({$SNS_NAME}) 是什么？
({$SNS_NAME})是参加者互相介绍朋友，
扩展自己的人际关系的交流互动型网站。


◆不知道是谁发的短信
如果您不知道是谁发的邮件，有可能是发信者误发了E-mail。
麻烦您按以下方式与我们联系。

({$ADMIN_EMAIL})


({$inc_signature})
