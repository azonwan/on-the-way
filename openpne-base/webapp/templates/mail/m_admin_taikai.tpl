【({$SNS_NAME})】({$c_member.nickname})已经退会。

退会者数据

会员ID : ({$c_member.c_member_id})
({$WORD_NICKNAME}) : ({$c_member.nickname})
({if $smarty.const.OPENPNE_USE_POINT_RANK})
等级 : ({$c_member.rank.name})
积分 : ({$c_member.point})
({/if})
最终登录 : ({$c_member.access_date})
登录日 : ({$c_member.r_date})
邀请人 : ({$c_member.c_member_id_invite}) (({$c_member.c_member_invite.nickname}))
出生年月日 : ({if $c_member.birth_year})({$c_member.birth_year})年({/if})({if $c_member.birth_month})({$c_member.birth_month})月({/if})({if $c_member.birth_day})({$c_member.birth_day})日({/if})

({foreach from=$c_profile_list item=prof})
({if $prof.name != 'PNE_POINT'})
({if $prof.form_type == "checkbox"})
({$prof.caption}) : ({$c_member.profile[$prof.name].value|@t_implode:", "})
({else})
({$prof.caption}) : ({$c_member.profile[$prof.name].value})
({/if})
({/if})
({/foreach})

PC地址 : ({$c_member.secure.pc_address})
手机地址 : ({$c_member.secure.ktai_address})
登录时地址 : ({$c_member.secure.regist_address})

({if $reason})
退会理由
---------------------------------------------------
({$reason})
---------------------------------------------------
({else})
被管理人强制退会
({/if})


({$inc_signature})
