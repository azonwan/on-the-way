({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="CSV导入"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>CSV导入</h2>
<div class="contents">

({if $requests.msg})
<p class="actionMsg">({$requests.msg})</p>
({/if})

<p>用CSV格式的文件上传成员信息，能登记成员。</p>

<ul class="caution">
<li>※每个文件只能登记处理1000行，其他的将不被登记。</li>
<li>※字符编码请注意文件格式。</li>
</ul>

<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('import_c_member','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<p><input type="file" name="member_file" /></p>
<p class="textBtn"><input type="submit" class="submit" value="登录" /></p>
</form>

<h3 class="item">成员信息CSV格式文件</h3>
<ul>
<li>编码： UTF-8</li>
<li>文件扩展名： .csv</li>
</ul>
<p>第一行记载标题，第二行以后记载会员信息。</p>
<p>以下的项目记载标题。</p>
<table class="basicType2">
({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})
<tr><th>login_id ※</th><td>登录ID</td></tr>
({/if})
<tr><th>nickname ※</th><td>昵称</td></tr>
<tr><th>mail_address ※</th><td>邮件地址（PC邮件地址、手机邮件地址无论输入哪个都可以）</td></tr>
<tr><th>password ※</th><td>密码</td></tr>
<tr><th>birth_year</th><td>出生年</td></tr>
<tr><th>birth_month</th><td>出生月</td></tr>
<tr><th>birth_day</th><td>生日</td></tr>
<tr><th>public_flag_birth_year</th><td>出生年公开设定（public, friend, private）</td></tr>
<tr><th>public_flag_birth_month_day</th><td>出生月・生日公开设定（public, friend, private）</td></tr>
<tr><th>profile[识别名]</th><td>上传项目（用[]内<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile','page')})">上传项目设定</a>的识别名输入）<br />
<br />
当form类型为“单选”或者“复选”时，从第二行以后，输入个人资料选项的ID。<br />
“复选”时，个人资料选择的ID用逗号（，）区分，便可复数输入。</td></tr>
</table>
<p>※({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})「login_id」({/if})「nickname」「mail_address」「password」为必填项目。</p>

<h3 class="item">CSV例子</h3>
<textarea cols="120" rows="5" readonly="readonly">
({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})login_id,({/if})nickname,mail_address,password,birth_year,birth_month,birth_day,profile[blood_type],profile[self_intro],profile[sample]
({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})"user1",({/if})"张三","张三@example.com","password1",1977,3,25,3,"请多关照。","150,151"
({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})"user2",({/if})"李四","李四@example.com","password2",1985,12,2,5,"加油。","152"
</textarea>
({$inc_footer|smarty:nodefaults})
