<?php
/**
 * @copyright 2007-2008 OpenKaku Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */
/*********************************************************/
/** step1 : 检测var是否可用                               **/
/** step2 : 生成config文件                               **/
/** step3 : 数据库联接检测                                **/
/** step4 : 导入表信息                                   **/
/********************************************************/
define('OPENPNE_DIR', realpath('../'));
require_once('header.inc');
require_once('OpenKakuSetup.php');
require_once('util.php');
require_once(OPENPNE_DIR.'/webapp/version.php');

if(file_exists(OPENPNE_DIR.'/config.php')){
	require_once(OPENPNE_DIR.'/config.php');
}
$step = check_step();
$sessid = md5(session_id().$step);

require_once("{$step}.inc");

require_once('footer.inc');

?>