
<form method="post">
<table border="0">

<tr><td width="750px">

<h2>安装步骤</h2>
<ul>
<li><a href="#section0">0. 首先</a></li>
<li><a href="#section1">1. 目录结构</a></li>
<li><a href="#section2">2. 配置文件变更</a></li>
<li><a href="#section3">3. 服务器设定</a>
  <ul>
  <li><a href="#section3-1">3-1. Apache设定</a></li>

  <li><a href="#section3-3">3-2. cron设定</a></li>
  </ul></li>
<li><a href="#section4">4. OpenPNE数据库做成</a>
  </li>
<li><a href="#section5">5. 安装模块执行</a></li>
<li><a href="#section6">6. 访问管理页面</a></li>
</ul>

<hr>

<h2 id="section0">0. 首先</h2>

<p>以下顺序为OpenPNE-2.12.3中文版为基础制作完成。</p>
<p>OpenPNE在以下服务器环境下可以正常运作。</p>
<ul>
<li>Apache 1.3.*/2.0.* 以上</li>
<li>PHP 4.3.*/5.0.* (推荐ASPI)
	<ul>
	<li>PHP的mbstring扩展模块</li>
	<li>PHP的GD库 (JPEG/GIF/PNG)</li>
	<li>PHP的mcrypt扩展模块</li>
	<li>PHP的curl扩展模块<var>(重要：若没有则无法使用msn邀请会员)</var></li>
	</ul></li>
<li>MySQL 4.1/5.0</li>
<li>邮件服务器
	<ul>
	<li>推荐Postfix 2.1.*</li>
	</ul></li>
</ul>

<h2 id="section1">1. 文件设置</h2>

<p>OpenPNE所包含的文件结构如下设置到Web服务器上。</p>

<pre>
- <var>OPENPNE_DIR</var>
  ├ bin
  ├ lib          &lt;--- <var>OPENPNE_LIB_DIR</var>
  ├ var          &lt;--- <var>OPENPNE_VAR_DIR</var>
  │ ├ img_cache
  │ │ ├ gif [777]
  │ │ │ ├ w_h [777]
  │ │ │ ├ w_h_raw [777]
  │ │ │ ├ w76_h76 [777]
  │ │ │ ├ w120_h120 [777]
  │ │ │ └ w180_h180 [777]
  │ │ ├ jpg [777]
  │ │ │ ├ w_h [777]  
  │ │ │    ... [777]
  │ │ └ png [777]
  │ │    ├ w_h [777]
  │ │       ... [777]
  │ ├ log [777]
  │ ├ rss_cache [777]
  │ ├ templates_c [777]
  │ └ tmp [777]
  ├ webapp       &lt;--- <var>OPENPNE_WEBAPP_DIR</var>
  ├ webapp_biz   &lt;--- <var>OPENPNE_WEBAPP_BIZ_DIR</var>
  └ webapp_ext   &lt;--- <var>OPENPNE_WEBAPP_EXT_DIR</var>

(从浏览器可以访问)
- <var>public_html</var> (可以变更其文件目录名)
  ├ config.inc.php (<var>OPENPNE_DIR</var> 指定文件目录)
  ├ index.php
     ...

※[777]为linux或BSD例。其他环境请各自设置成相应的值。
</pre>

<p>可以修改<var>public_html</var> 的路径和文件名。</p>
<p>把<var>public_html</var>的文件夹路径放置到<var>OPENPNE_DIR</var>文件夹(默认配置)以外时，
请把<var>public_html</var>下的config.inc.php内容修改掉。</p>

<p>另外，请赋予<var>OPENPNE_DIR</var>/var 下的<strong>全部文件夹</strong>的读写权限(例777)。</p>
<pre>
$ chmod -R 777 var/*
</pre>

<hr>

<p>把OpenPNE图像的cache文件夹可以设置到 <var>public_html</var> 下面，Apache可以直接读入cache图像。
(把OpenPNE的设定文件config.php</p><p>中的OPENPNE_IMG_CACHE_PUBLIC设置为true)</p>

<p>让此技能有效时，在Apache的设定中把mod_rewrite设置为有效，让其可以使用.htaccess，或者在httpd.conf中做同样的改动。</p>

<pre>
- <var>OPENPNE_DIR</var>
  ├ bin
  ├ lib          &lt;--- <var>OPENPNE_LIB_DIR</var>
  ├ var          &lt;--- <var>OPENPNE_VAR_DIR</var>
  │ ├ log [777]
  │ ├ rss_cache [777]
  │ ├ templates_c [777]
  │ └ tmp [777]
  ├ webapp       &lt;--- <var>OPENPNE_WEBAPP_DIR</var>
  ├ webapp_biz   &lt;--- <var>OPENPNE_WEBAPP_BIZ_DIR</var>
  └ webapp_ext   &lt;--- <var>OPENPNE_WEBAPP_EXT_DIR</var>

(浏览器可以浏览)
- <var>public_html</var> (可以更改文件目录名)
  ├ config.inc.php (指定<var>OPENPNE_DIR</var>目录名)
  ├ index.php
  ├ img
  │ ├ .htaccess
  │ ├ index.php
  │ ├ gif [777]
  │ │ ├ w_h [777]
  │ │ ├ w_h_raw [777]
  │ │ ├ w76_h76 [777]
  │ │ ├ w120_h120 [777]
  │ │ └ w180_h180 [777]
  │ ├ jpg [777]
  │ │ ├ w_h [777]
  │ │    ... [777]
  │ └ png [777]
  │    ├ w_h [777]
  │       ... [777]
     ...

※[777]为linux或BSD例。其他环境请各自设置成相应的值。
</pre>


<h2 id="section2">2. 更改设定文件</h2>

<p>
复制<var>OPENPNE_DIR</var>/config.php.sample为
<var>OPENPNE_DIR</var>/config.php，把config.php中的内容修改成自己的环境。</p>

<dl>
<dt>OPENPNE_URL</dt>
	<dd>基本URL(绝对路径)</dd>
<dt>DSN</dt>
	<dd>(MySQL的)数据库接续情报。<br>
	设置为接续用用户、密码、服务器host名、数据库名。</dd>
<dt>ENCRYPT_KEY</dt>
	<dd>会员登录情报的暗号键(56位以内的ASCII文字)<br>
	请设置为他人无法猜测的文字列。</dd>
<dt>MAIL_SERVER_DOMAIN</dt>
	<dd>邮件服务器的域名(使用手机可以进行邮件投稿)</dd>
</dl>

<p>如果有需要可以把激活一些选择设定。
调试模式的设定，正式运营时请设置为0。</p>

<p class="caution">PHP的设定safe模式为有效场合时，请把MAIL_SET_ENVFROM设置为false。</p>


<h2 id="section3">3. 服务器设定</h2>

<p>虚拟空间等因已经设定完成，请跳过这一段。</p>

<h3 id="section3-1">3-1. Apache的设定</h3>

<p>修改httpd.conf</p>
<ul>
<li>DirectoryIndex下追加index.php。</li>
<li>为访问<var>public_html</var>，修改如下。</li>
</ul>

<p><em>[设定例]</em></p>
<div>
使用VirtualHost的httpd.conf设定
<pre>
&lt;VirtualHost *:80&gt;
    ServerName        openPNE.example.com
    DocumentRoot      /home/username/OpenPNE/public_html/
    DirectoryIndex    index.html index.php
&lt;/VirtualHost&gt;
</pre>
</div>

<p>修改httpd.conf，重起Apache。</p>


<h3 id="section3-3">3-2. cron设定</h3>

<p><em>[设定例]</em></p>

<p>向cron文件追加实行权限。</p>
<pre>
chmod 755 bin/*.cron
</pre>

<p>/etc/crontab中记录记录。</p>
<div>
<pre>
# 6点发信＆每20分更新RSS
00   6 * * * root sh <var>OPENPNE_DIR</var>/bin/tool_send_dairy_news.cron     <var>OPENPNE_DIR</var>/bin/ [bin_path]/php
00   6 * * * root sh <var>OPENPNE_DIR</var>/bin/tool_send_birthday_mail.cron  <var>OPENPNE_DIR</var>/bin/ [bin_path]/php
00   6 * * * root sh <var>OPENPNE_DIR</var>/bin/tool_send_schedule_mail.cron  <var>OPENPNE_DIR</var>/bin/ [bin_path]/php
*/20 * * * * root sh <var>OPENPNE_DIR</var>/bin/tool_rss_cache.cron           <var>OPENPNE_DIR</var>/bin/ [bin_path]/php
</pre>
[bin_path]安装php的bin目录(例/usr/local/bin)。
</div>

<h2 id="section4">4. 创建OpenPNE数据库</h2>

<h3 id="section4-1"> 使用MySQL 4.1时</h3>

<p>创建数据库，请执行以下SQL文。</p>

<pre>
CREATE DATABASE `DBNAME` DEFAULT CHARACTER SET utf8 ;
</pre>

<p>在准备好的数据库(例:DBNAME)中按顺序执行以下SQL文。</p>
<ol>
<li><var>OPENPNE_DIR</var>/setup/sql/install/install-1.00-create_tables-mysql41.sql</li>
<li><var>OPENPNE_DIR</var>/setup/sql/install/install-1.00-insert_data.sql</li>
</ol>

<div>
<em>[执行例]</em>
<pre>
$ mysql -u username -p --default-character-set=utf8 DBNAME &lt; install-1.00-create_tables-mysql41.sql
$ mysql -u username -p --default-character-set=utf8 DBNAME &lt; install-1.00-insert_data.sql
</pre>
</div>
<h2 id="section5">5. 执行安装模块</h2>

<p>从浏览器中请访问以下地址。(安装后无法再访问)</p>

<pre>
<var>OPENPNE_URL</var>?m=setup
(例) http://openPNE.example.com/?m=setup
</pre>

<p>在这里输入SNS名、管理用账号、初期用户设定。</p>


<h2 id="section6">6. 访问管理页面</h2>

<p>请用安装时设定的管理用账号的用户名、密码登录。登录后，从管理菜单的「SNS设定变更」中可以修改SNS的基本信息。</p>

<pre>
<var>OPENPNE_URL</var>?m=admin
(例) http://openPNE.example.com/?m=admin
</pre>

<p>变更管理页面的URL时，请修改设定文件config.php内的ADMIN_MODULE_NAME值。</p>
<div>比如例，修改为abcde
<pre>
<var>OPENPNE_URL</var>?m=abcde
(例) http://openPNE.example.com/?m=abcde
</pre>
从这个URL可以访问管理页面。</div>

<p>另外，管理菜单的“网页名随机生成”功能能够替换掉页面名，因为能够更改管理页面内部的页面名，处于安全考虑，建议安装成功后执行。</p>

<hr>

<p><font color="f80f1a">请注意在填写网站URL时，请在正常域名后面添加/public_html/</font></p>

</td></tr>
</table>

<br>
<input type='hidden' name='m' value='do'>
<input type='hidden' name='a' value='<? echo $step; ?>'>
<input type='checkbox' name='sessid' value='<? echo $sessid; ?>'>我已阅读该页面的安装手册<br><br>
<input type='submit' value='下一步'>

</form>
