({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="SNS设定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>SNS网站基本信息设定</h2>
<div class="contents">
<p class="caution" id="c01">※所有信息更改完毕后，请按「设定变更」按钮，确定更新修改内容。</p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_admin_config','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<table class="basicType2">
<tr class="cell01">
<th colspan="2">网站名称</th>
<td><input class="basic" name="SNS_NAME" type="text" value="({$smarty.const.SNS_NAME})" size="30" /></td>
</tr>
<tr class="cell02">
<th colspan="2">浏览器中网页标题</th>
<td>
<span class="info">HTML的title的标题</span><br />
<input class="basic" name="SNS_TITLE" type="text" value="({$smarty.const.SNS_TITLE})" size="30" /><br />
<span class="caution">※如果不填写此项，将默认使用【网站名称】作为页面标题</span>
</td>
</tr>
<tr class="cell03">
<th colspan="2">客服邮箱地址</th>
<td>
<span class="info">作为向用户发信后，在信件中保留的网站客服邮箱提示署名</span><br />
<input class="basic" name="ADMIN_EMAIL" type="text" value="({$smarty.const.ADMIN_EMAIL})" size="40" /></td>
</tr>
<tr class="cell04">
<th colspan="2">开启网站公开注册按钮/不开启</th>
<td>
<input class="basicRadio" name="IS_CLOSED_SNS" id="IS_CLOSED_SNS_1" type="radio" value="1"({if $smarty.const.IS_CLOSED_SNS}) checked="checked"({/if}) /><label for="IS_CLOSED_SNS_1">关闭</label>　<span class="caution">（※只能通过邀请链接方式注册）</span><br />
<input class="basicRadio" name="IS_CLOSED_SNS" id="IS_CLOSED_SNS_0" type="radio" value="0"({if !$smarty.const.IS_CLOSED_SNS}) checked="checked"({/if}) /><label for="IS_CLOSED_SNS_0">开启</label>　<span class="caution">（※开启登陆页面公开注册按钮）</span>
</td>
</tr>
<tr class="cell05">
<th colspan="2">是否允许用户通过邮件向其他人发送邀请链接</th>
<td>
<select class="basic" name="IS_USER_INVITE">
<option value="1"({if $smarty.const.IS_USER_INVITE}) selected="selected"({/if})>允许</option>
<option value="0"({if !$smarty.const.IS_USER_INVITE}) selected="selected"({/if})>不允许</option>
</select>
</td>
</tr>
<tr class="cell06">
<th colspan="2">PC版使用设定</th>
<td>
<select class="basic" name="OPENPNE_ENABLE_PC">
<option value="1"({if $smarty.const.OPENPNE_ENABLE_PC}) selected="selected"({/if})>可以使用</option>
<option value="0"({if !$smarty.const.OPENPNE_ENABLE_PC}) selected="selected"({/if})>不可使用</option>
</select><br />
<span class="caution">※设定为使用不可使用时，PC网站浏览无法显示</span>
</td>
</tr>
<tr class="cell07">
<th colspan="2">手机版使用设定</th>
<td>
<select class="basic" name="OPENPNE_ENABLE_KTAI">
<option value="1"({if $smarty.const.OPENPNE_ENABLE_KTAI}) selected="selected"({/if})>可以使用</option>
<option value="0"({if !$smarty.const.OPENPNE_ENABLE_KTAI}) selected="selected"({/if})>不可使用</option>
</select><br />
<span class="caution">※设定为不可使用时，用手机无法浏览本网站</span>
</td>
</tr>
<tr class="cell08">
<th colspan="2">登录方式选择</th>
<td>
<input class="basicRadio" name="OPENPNE_REGIST_FROM" id="OPENPNE_REGIST_FROM_PCKTAI" type="radio" value="({$smarty.const.OPENPNE_REGIST_FROM_PCKTAI})"({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_PCKTAI}) checked="checked"({/if}) /><label for="OPENPNE_REGIST_FROM_PCKTAI">从PC・手机两者都可登录</label><br />
<input class="basicRadio" name="OPENPNE_REGIST_FROM" id="OPENPNE_REGIST_FROM_PC" type="radio" value="({$smarty.const.OPENPNE_REGIST_FROM_PC})"({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_PC}) checked="checked"({/if}) /><label for="OPENPNE_REGIST_FROM_PC">只可从PC登录</label><br />
<input class="basicRadio" name="OPENPNE_REGIST_FROM" id="OPENPNE_REGIST_FROM_KTAI" type="radio" value="({$smarty.const.OPENPNE_REGIST_FROM_KTAI})"({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_KTAI}) checked="checked"({/if}) /><label for="OPENPNE_REGIST_FROM_KTAI">只可从手机登录</label><br />
<input class="basicRadio" name="OPENPNE_REGIST_FROM" id="OPENPNE_REGIST_FROM_NONE" type="radio" value="({$smarty.const.OPENPNE_REGIST_FROM_NONE})"({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_NONE}) checked="checked"({/if}) /><label for="OPENPNE_REGIST_FROM_NONE">登录暂时中止</label><span class="caution">※如果设定为中止状态，网站处于完全关闭状态</span>
</td>
</tr>
<tr class="cell27">
<th colspan="2">会员注册时<br />是否需要手机邮箱地址？</th>
<td>
<input class="basicRadio" name="IS_GET_EASY_ACCESS_ID" id="IS_GET_EASY_ACCESS_ID_3" type="radio" value="3"({if $smarty.const.IS_GET_EASY_ACCESS_ID == 3}) checked="checked"({/if}) /><label for="IS_GET_EASY_ACCESS_ID_3">注册时，PC、手机同时取得终端ID(不可选)</label><br />
<input class="basicRadio" name="IS_GET_EASY_ACCESS_ID" id="IS_GET_EASY_ACCESS_ID_1" type="radio" value="1"({if $smarty.const.IS_GET_EASY_ACCESS_ID == 1}) checked="checked"({/if}) /><label for="IS_GET_EASY_ACCESS_ID_1">PC注册时，不需要填写手机邮箱地址(必选)</label><br />
<span class="caution">※请选择【可选方式】的用户注册方式</span><br />
</td>
</tr>
<tr class="cell09">
<th colspan="2">已屏蔽点评功能</th>
<td><input class="basic" name="AMAZON_AFFID" type="text" value="({$smarty.const.AMAZON_AFFID})" size="30" /><br /><span class="caution">※如果为空，点评机能将无法使用。请默认，不需要修改。</span></td>
</tr>
<tr class="cell10">
<th colspan="2">外部login页面的URL设定</th>
<td>
<span class="info">PC版登陆页面访问首页地址的重新指定</span><br />
<input class="basic" name="LOGIN_URL_PC" type="text" value="({$smarty.const.LOGIN_URL_PC})" size="50" /><br />
<span class="caution">※外部登陆入口代码<a href="#form">查看</a>可复制为html页面</span><br />
<span class="caution">※如果使用通常默认的登录页面将显示空白页</span></td>
</tr>
<tr>
<th colspan="2">（不可用）手机版登陆网页的URL</th>
<td>
<span class="info">如果手机版登录和退出失败、在这里指定变迁的URl</span><br />
<input class="basic" name="LOGIN_URL_KTAI" type="text" value="({$smarty.const.LOGIN_URL_KTAI})" size="50" /><br />
<span class="caution">※外部登陆入口代码<a href="#form">查看</a>可复制为html页面</span><br />
<span class="caution">※如果使用通常的登录页面默认为空白页</span></td>
</tr>
<tr class="cell11">
<th colspan="2">默认登录页面与外部登陆页面切换显示设定</th>
<td>
<span class="info">当已经设定外部登录页面URL时，可以选择两种登陆方式</span><br />
<select class="basic" name="DISPLAY_LOGIN">
<option value="1"({if $smarty.const.DISPLAY_LOGIN}) selected="selected"({/if})>默认的登录页面也显示</option>
<option value="0"({if !$smarty.const.DISPLAY_LOGIN}) selected="selected"({/if})>登陆首页按外部URL登录页面显示</option>
</select></td>
</tr>
<tr class="cell12">
<th colspan="2">PC版用户个人首页是否显示日程表</th>
<td><select class="basic" name="DISPLAY_SCHEDULE_HOME">
<option value="1"({if $smarty.const.DISPLAY_SCHEDULE_HOME}) selected="selected"({/if})>显示</option>
<option value="0"({if !$smarty.const.DISPLAY_SCHEDULE_HOME}) selected="selected"({/if})>不显示</option>
</select></td>
</tr>
<tr class="cell13">
<th colspan="2">PC版首页检索条</th>
<td><select class="basic" name="DISPLAY_SEARCH_HOME">
<option value="1"({if $smarty.const.DISPLAY_SEARCH_HOME}) selected="selected"({/if})>显示</option>
<option value="0"({if !$smarty.const.DISPLAY_SEARCH_HOME}) selected="selected"({/if})>不显示</option>
</select></td>
</tr>
<tr class="cell12">
<th colspan="2">导航栏中各个按钮的链接排列顺序</th>
<td>
<span class="info">是否使用此排列设定功能（请选择使用）</span><br />
<select class="basic" name="OPENPNE_USE_RANKING">
<option value="1"({if $smarty.const.OPENPNE_USE_RANKING}) selected="selected"({/if})>使用</option>
<option value="0"({if !$smarty.const.OPENPNE_USE_RANKING}) selected="selected"({/if})>不使用</option>
</select><br />
<span class="caution">※「不使用」选择导航自动也不会发生变化。导航链接变更如：<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_navi')})">请从「导航变更」确定更新</a></span><br />
</td>
</tr>
<tr>
<th colspan="2">相册功能使用设定</th>
<td>
<span class="info">是否使用相册功能使用设定(图片多以后会增加你的服务器负荷，可设定分流）</span><br />
<select class="basic" name="OPENPNE_USE_ALBUM">
<option value="1"({if $smarty.const.OPENPNE_USE_ALBUM}) selected="selected"({/if})>使用</option>
<option value="0"({if !$smarty.const.OPENPNE_USE_ALBUM}) selected="selected"({/if})>不使用</option>
</select>
</td>
</tr>
<tr class="cell14">
<th colspan="2">朋友列表及圈子列表显示方式</th>
<td><select class="basic" name="OPENPNE_USE_FLASH_LIST">
<option value="1"({if $smarty.const.OPENPNE_USE_FLASH_LIST}) selected="selected"({/if})>Flash版</option>
<option value="0"({if !$smarty.const.OPENPNE_USE_FLASH_LIST}) selected="selected"({/if})>通常HTML版</option>
</select></td>
</tr>
<tr class="cell26">
<th colspan="2">手机版字体大小设定</th>
<td>
<span class="info">是否进行手机版字体大小指定设定（不可用）</span><br />
<select class="basic" name="OPENPNE_IS_SET_KTAI_FONT_SIZE">
<option value="1"({if $smarty.const.OPENPNE_IS_SET_KTAI_FONT_SIZE}) selected="selected"({/if})>指定字体大小</option>
<option value="0"({if !$smarty.const.OPENPNE_IS_SET_KTAI_FONT_SIZE}) selected="selected"({/if})>不指定字体大小</option>
</select><br />
<span class="caution">※「指定字体大小」如果选择字体大小会随着设定而改变</span><br />
<span class="caution">※「不指定字体大小」如果选择将显示手机终端的默认的字符大小 </span></td>
</tr>
<tr>
<th colspan="2">手机版隐私显示设定（不可用）</th>
<td>
<span class="info">手机版隐私显示设定</span><br />
<select class="basic" name="OPENPNE_DISP_KTAI_SNS_PRIVACY">
<option value="1"({if $smarty.const.OPENPNE_DISP_KTAI_SNS_PRIVACY}) selected="selected"({/if})>显示</option>
<option value="0"({if !$smarty.const.OPENPNE_DISP_KTAI_SNS_PRIVACY}) selected="selected"({/if})>不显示</option>
</select><br />
<span class="caution">※删除隐私内容的链接，<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})">[插入设计的HTML]</a>进入后能进行footer的编辑</span></td>
</tr>
<tr class="cell15">
<th colspan="2">菜单鼠标移动变化效果显示</th>
<td><select class="basic" name="OPENPNE_ENABLE_ROLLOVER">
<option value="1"({if $smarty.const.OPENPNE_ENABLE_ROLLOVER}) selected="selected"({/if})>使用</option>
<option value="0"({if !$smarty.const.OPENPNE_ENABLE_ROLLOVER}) selected="selected"({/if})>不使用</option>
</select></td>
</tr>
<tr class="cell16">
<th colspan="2">设定网站向用户发送网站新闻的周期</th>
<td>
<span class="info">「毎日」「不接受」不接收在设定时间以外的新闻频度</span><br />
<input class="basicRadio" name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_mon" type="checkbox" value="一"({if in_array("一", $DAILY_NEWS_DAY)}) checked="checked"({/if}) /><label for="DAILY_NEWS_DAY_mon">一</label>&nbsp;
<input class="basicRadio" name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_tue" type="checkbox" value="二"({if in_array("二", $DAILY_NEWS_DAY)}) checked="checked"({/if}) /><label for="DAILY_NEWS_DAY_tue">二</label>&nbsp;
<input class="basicRadio" name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_wed" type="checkbox" value="三"({if in_array("三", $DAILY_NEWS_DAY)}) checked="checked"({/if}) /><label for="DAILY_NEWS_DAY_wed">三</label>&nbsp;
<input class="basicRadio" name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_thu" type="checkbox" value="四"({if in_array("四", $DAILY_NEWS_DAY)}) checked="checked"({/if}) /><label for="DAILY_NEWS_DAY_thu">四</label>&nbsp;
<input class="basicRadio" name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_fri" type="checkbox" value="五"({if in_array("五", $DAILY_NEWS_DAY)}) checked="checked"({/if}) /><label for="DAILY_NEWS_DAY_fri">五</label>&nbsp;
<input class="basicRadio" name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_sat" type="checkbox" value="六"({if in_array("六", $DAILY_NEWS_DAY)}) checked="checked"({/if}) /><label for="DAILY_NEWS_DAY_sat">六</label>&nbsp;
<input class="basicRadio" name="DAILY_NEWS_DAY[]" id="DAILY_NEWS_DAY_sun" type="checkbox" value="日"({if in_array("日", $DAILY_NEWS_DAY)}) checked="checked"({/if}) /><label for="DAILY_NEWS_DAY_sun">日</label>
</td>
</tr>
<tr class="cell17">
<th colspan="2">会员收藏选项使用设定</th>
<td>
<span class="info">开启本设定后，用户的个人首页将把所关注的会员的最新信息显示在自己的主页版里</span><br />
<select class="basic" name="USE_BOOKMARK_FEED">
<option value="1"({if $smarty.const.USE_BOOKMARK_FEED}) selected="selected"({/if})>使用</option>
<option value="0"({if !$smarty.const.USE_BOOKMARK_FEED}) selected="selected"({/if})>不使用</option>
</select></td>
</tr>
<tr class="cell18">
<th colspan="2">隐身机能使用设定</th>
<td>
<span class="info">设定隐身机能是否有效(用户可选择是否留下访客记录)</span><br />
<select class="basic" name="USE_SHINOBIASHI">
<option value="1"({if $smarty.const.USE_SHINOBIASHI}) selected="selected"({/if})>使用</option>
<option value="0"({if !$smarty.const.USE_SHINOBIASHI}) selected="selected"({/if})>不使用</option>
</select></td>
</tr>
<tr class="cell19">
<th colspan="2">日记分类机能使用设定</th>
<td>
<span class="info">※设定日记分类机能是否有效</span><br />
<select class="basic" name="USE_DIARY_CATEGORY">
<option value="1"({if $smarty.const.USE_DIARY_CATEGORY}) selected="selected"({/if})>使用</option>
<option value="0"({if !$smarty.const.USE_DIARY_CATEGORY}) selected="selected"({/if})>不使用</option>
</select></td>
</tr>
<tr>
<th colspan="2">文字装饰使用设定</th>
<td>
<span class="info">文字装饰是否有效功能设定</span><br />
<select class="basic" name="OPENPNE_USE_DECORATION">
<option value="1"({if $smarty.const.OPENPNE_USE_DECORATION}) selected="selected"({/if})>使用</option>
<option value="0"({if !$smarty.const.OPENPNE_USE_DECORATION}) selected="selected"({/if})>不使用</option>
</select></td>
</tr>
<tr class="cell20">
<th colspan="2">cmd标签使用设定</th>
<td>
<span class="info">设定是否能使用独自标签cmd</span><br />
<select class="basic" name="OPENPNE_USE_CMD_TAG">
<option value="1"({if $smarty.const.OPENPNE_USE_CMD_TAG}) selected="selected"({/if})>使用</option>
<option value="0"({if !$smarty.const.OPENPNE_USE_CMD_TAG}) selected="selected"({/if})>不使用</option>
</select></td>
</tr>
<tr class="cell31">
<th colspan="2">积分、头衔参数设定</th>
<td>
<span class="info">是否使用积分、头衔功能</span><br />
<select class="basic" name="OPENPNE_USE_POINT_RANK">
<option value="1"({if $smarty.const.OPENPNE_USE_POINT_RANK}) selected="selected"({/if})>使用</option>
<option value="0"({if !$smarty.const.OPENPNE_USE_POINT_RANK}) selected="selected"({/if})>不使用</option>
</select></td>
</tr>
<tr class="cell32">
<th colspan="2">积分显示设定</th>
<td>
<span class="info">在pc、手机的个人主页面显示积分</span><br />
<select class="basic" name="OPENPNE_DISP_POINT">
<option value="1"({if $smarty.const.OPENPNE_DISP_POINT}) selected="selected"({/if})>显示</option>
<option value="0"({if !$smarty.const.OPENPNE_DISP_POINT}) selected="selected"({/if})>不显示</option>
</select><br />
<span class="caution">※等级排位使用设定「必须设定为使用」否则积分将不显示</span></td>
</tr>
<tr class="cell33">
<th colspan="2">头衔/等级显示设定</th>
<td>
<span class="info">设定在pc、手机的home页面等处是否显示头衔</span><br />
<select class="basic" name="OPENPNE_DISP_RANK">
<option value="1"({if $smarty.const.OPENPNE_DISP_RANK}) selected="selected"({/if})>显示</option>
<option value="0"({if !$smarty.const.OPENPNE_DISP_RANK}) selected="selected"({/if})>不显示</option>
</select><br />
<span class="caution">※等级排位使用设定必须设为「使用」否者此选择将默认为不显示</span></td>
</tr>
<tr class="cell34">
<th colspan="2">管理员累计加点显示设定</th>
<td>
<span class="info">ID 是否显示累计点数No.1成员设定</span><br />
<select class="basic" name="OPENPNE_IS_POINT_ADMIN">
<option value="1"({if $smarty.const.OPENPNE_IS_POINT_ADMIN}) selected="selected"({/if})>显示累计</option>
<option value="0"({if !$smarty.const.OPENPNE_IS_POINT_ADMIN}) selected="selected"({/if})>不显示累计</option>
</select></td>
</tr>
<tr class="cell35">
<th colspan="2">大家的最新日记显示设定</th>
<td>
<span class="info">是否在用户的主页中显示平台内大家的最新日记信息</span><br />
<select class="basic" name="DISPLAY_NEWDIARYTOPIC_HOME">
<option value="1"({if $smarty.const.DISPLAY_NEWDIARYTOPIC_HOME}) selected="selected"({/if})>显示</option>
<option value="0"({if !$smarty.const.DISPLAY_NEWDIARYTOPIC_HOME}) selected="selected"({/if})>不显示</option>
</select></td>
</tr>
<tr class="cell21">
<th colspan="2">登录限制设定</th>
<td>
<input class="basicRadio" name="LOGIN_CHECK_ENABLE" type="radio" value="0"({if !$smarty.const.LOGIN_CHECK_ENABLE}) checked="checked"({/if}) />不限制<br />
<input class="basicRadio" name="LOGIN_CHECK_ENABLE" type="radio" value="1"({if $smarty.const.LOGIN_CHECK_ENABLE}) checked="checked"({/if}) />限制<br />
<input class="basic" name="LOGIN_CHECK_TIME" type="text" value="({$smarty.const.LOGIN_CHECK_TIME})" size="5" />分间隔
<input class="basic" name="LOGIN_CHECK_NUM" type="text" value="({$smarty.const.LOGIN_CHECK_NUM})" size="8" />回登录失败
<input class="basic" name="LOGIN_REJECT_TIME" type="text" value="({$smarty.const.LOGIN_REJECT_TIME})" size="5" />分间隔，限制从同一IP的登录
</td>
</tr>
<tr class="cell22A">
<th rowspan="3">邮件</th>
<th>catch复制</th>
<td>
<span class="info">向SNS会员发送邮件，使用署名</span><br />
<input class="basic" name="CATCH_COPY" type="text" value="({$smarty.const.CATCH_COPY})" size="30" />
</td>
</tr>
<tr class="cell22B">
<th>运营公司</th>
<td>
<span class="info">向SNS会员发送的邮件，使用署名</span><br />
<input class="basic" name="OPERATION_COMPANY" type="text" value="({$smarty.const.OPERATION_COMPANY})" size="30" /></td>
</tr>
<tr class="cell22C">
<th>Copyright</th>
<td>
<span class="info">向SNS会员发送的邮件，使用署名</span><br />
<input class="basic" name="COPYRIGHT" type="text" value="({$smarty.const.COPYRIGHT})" size="30" /></td>
</tr>
<tr class="cell24">
<th rowspan="2">网赚用标签</th>
<th>PC用</th>
<td>
<span class="info">PC版登录完了页面中被插入</span><br />
<textarea class="basic" name="AFFILIATE_TAG" cols="60" rows="3">({$smarty.const.AFFILIATE_TAG})</textarea>
<dl class="caution">
	({literal})
	<dt>【记入例】</dt>
	<dd>&lt;img src="https://px.a8.net/cgi-bin/a8fly/sales?pid=s0001&amp;so=<strong>({$ID})</strong>&amp;si=000.000.A8&amp;ts=<strong>({$DATETIME})</strong>"&nbsp;width="1" height="1"&gt;</dd>
	<dt>【在标签内使用可能的变量】</dt>
	<dd>({$ID})：会员ID<br />({$DATETIME})：时间（YYYYMMDDHHMMSS形式）</dd>
	({/literal})
</dl>
</td>
</tr>
<tr class="cell24B">
<th>携帯用</th>
<td>
<span class="info">手机版登陆页面插入</span><br />
<textarea class="basic" name="AFFILIATE_KTAI_TAG" cols="60" rows="3">({$smarty.const.AFFILIATE_KTAI_TAG})</textarea>
<dl class="caution">
	({literal})
	<dt>【计入列子】</dt>
	<dd>&lt;img src="https://px.a8.net/cgi-bin/a8fly/sales?pid=s0001&amp;so=<strong>({$ID})</strong>&amp;si=000.000.A8&amp;ts=<strong>({$DATETIME})</strong>"&nbsp;width="1" height="1"&gt;</dd>
	<dt>【在标记内使用变量】</dt>
	<dd>({$ID})：成员<br />({$DATETIME})：日时（YYYYMMDDHHMMSS形式）<br />({$AFF_ID})：收费广告ID（登记页加载收费广告）</dd>
	({/literal})
</dl>
</td>
</tr>
<tr class="cell25">
<th colspan="2">天气链接/使用检索框</th>
<td>
<span class="info">设定是否使用外部服务</span><br />
<select class="basic" name="USE_EXTRA_SERVICE">
<option value="1"({if $smarty.const.USE_EXTRA_SERVICE}) selected="selected"({/if})>使用</option>
<option value="0"({if !$smarty.const.USE_EXTRA_SERVICE}) selected="selected"({/if})>不使用</option>
</select></td>
</tr>
<tr class="cell27">
<th colspan="2">组织协同工作SNS模式启用</th>
<td>
<span class="info">设定是否使用BIZ</span><br />
<select class="basic" name="USE_BIZ_DIR">
<option value="1"({if $smarty.const.USE_BIZ_DIR}) selected="selected"({/if})>使用</option>
<option value="0"({if !$smarty.const.USE_BIZ_DIR}) selected="selected"({/if})>不使用</option>
</select></td>
</tr>
<tr class="cell28">
<th colspan="2">退会者的数据</th>
<td>
<span class="info">设定退会者的数据是否转送到管理者的邮件地址中</span><br />
<select class="basic" name="SEND_USER_DATA">
<option value="1"({if $smarty.const.SEND_USER_DATA}) selected="selected"({/if})>转送</option>
<option value="0"({if !$smarty.const.SEND_USER_DATA}) selected="selected"({/if})>不转送</option>
</select></td>
</tr>
</table>
<p class="textBtn"><input type="submit" value="设定变更"></p>
</form>
</div>({*/div class="contents"*})

<h2 id="ttl02"><a name="form">外部登录表单用HTML编辑方式</a></h2>
<div class="contents">
<p class="info">设定通常的登录页面以外的外部登录页面时，请使用以下的外部登陆入口HTML代码，可编辑成新的登陆页面。</p>

({capture name=pc_html_form})
<form action="({$smarty.const.OPENPNE_URL})" method="post">
<input type="hidden" name="m" value="pc" />
<input type="hidden" name="a" value="do_o_login" />
<dl class="sampleHtml">
<dt><label for="username"><strong class="item">邮件地址</strong></label></dt>
<dd><input type="text" name="username" id="username" value="" tabindex="1"></dd>
<dt><label for="password"><strong class="item">密码</strong></label></dt>
<dd><input type="password" name="password" id="password" tabindex="2"></dd>
<dd><input type="checkbox" name="is_save" id="is_save" value="1" tabindex="3"><label for="is_save">下回自动登录</label></dd>
<dd><input type="submit" value="登录" tabindex="4"></dd>
</dl>
</form>({/capture})

({capture name=ktai_html_form})
<form action="({$smarty.const.OPENPNE_URL})" method="post" utn>
<input type="hidden" name="m" value="ktai">
<input type="hidden" name="a" value="do_o_easy_login">
<input type="submit" value="手机登录"><br>
</form>
<br>
<form action="({$smarty.const.OPENPNE_URL})" method="post">
<input type="hidden" name="m" value="ktai">
<input type="hidden" name="a" value="do_o_login">
手机邮件地址<br>
<textarea name="username" rows="1" istyle="3" mode="alphabet"></textarea><br>
密码<br>
<input name="password" type="text" istyle="3" mode="alphabet" value=""><br>
<input name="submit" value="登陆" type="submit"><br>
</form>({/capture})

({capture name=pc_html_password})
<a href="({t_url _html=0 _absolute=1 m=pc a=page_o_password_query})">忘记密码点这里</a>({/capture})

({capture name=ktai_html_password})
<a href="({t_url _html=0 _absolute=1 m=ktai a=page_o_password_query})">&gt;&gt;忘记密码</a>({/capture})

({capture name=pc_html_regist})
<a href="({t_url _html=0 _absolute=1 m=pc a=page_o_public_invite})">注册</a>({/capture})

({capture name=ktai_html_regist})
如果无法注册，请发邮件给我们<br>
<br>
<a href="mailto:({$smarty.const.MAIL_ADDRESS_PREFIX})get@({$smarty.const.MAIL_SERVER_DOMAIN})">发送邮件</a><br>
<br>
※对于本站使用规约，同意之后请进行注册<br>
※发送短信到这个地址「({$smarty.const.ADMIN_EMAIL})」接受大家的反馈。({/capture})

<dl class="sampleHtml">
<dt><strong class="item">登录表单</strong></dt>
<dd><textarea cols="84" rows="14" readonly="readonly">({$smarty.capture.pc_html_form})</textarea></dd>
</dl>

({if $smarty.const.OPENPNE_AUTH_MODE !== 'slavepne'})
<dl class="sampleHtml">
<dt><strong class="item">密码找回的按钮链接</strong></dt>
<dd><textarea cols="84" rows="3" readonly="readonly">({$smarty.capture.pc_html_password})</textarea></dd>
</dl>

({if !$smarty.const.IS_CLOSED_SNS && (($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_PC))})
<dl class="sampleHtml">
<dt><strong class="item">会员注册部分的html代码</strong></dt>
<dd><textarea cols="84" rows="3" readonly="readonly">({$smarty.capture.pc_html_regist})</textarea></dd>
</dl>
({/if})
({/if})
<dl class="sampleHtml">
<dt><strong class="item">手机用户找回密码链接</strong></dt>
<dd><textarea cols="84" rows="14" readonly="readonly">({$smarty.capture.ktai_html_form})</textarea></dd>
</dl>

({if $smarty.const.OPENPNE_AUTH_MODE !== 'slavepne'})
<dl class="sampleHtml">
<dt><strong class="item">手机版密码在发行链接</strong></dt>
<dd><textarea cols="84" rows="3" readonly="readonly">({$smarty.capture.ktai_html_password})</textarea></dd>
</dl>

({if !$smarty.const.IS_CLOSED_SNS && (($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_KTAI))})
<dl class="sampleHtml">
<dt><strong class="item">用户注册页面链接</strong></dt>
<dd><textarea cols="84" rows="7" readonly="readonly">({$smarty.capture.ktai_html_regist})</textarea></dd>
</dl>
({/if})
({/if})

({$inc_footer|smarty:nodefaults})
