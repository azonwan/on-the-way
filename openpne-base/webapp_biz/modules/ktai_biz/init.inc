<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//デフォルトページ
$GLOBALS['__Framework']['default_page'] = 'fh_calendar_week';

//<PCKTAI
if (!OPENPNE_ENABLE_KTAI) {
    // disable ktai module
    exit;
}
//>

// User-Agent判別
if (CHECK_KTAI_UA && !isKtaiUserAgent()) {
    openpne_redirect('pc');
}

// IPアドレスチェック
if (CHECK_KTAI_IP && !is_ktai_ip()) {
    openpne_redirect('pc');
}

// bizモジュールディレクトリの定義
$biz_dir = OPENPNE_MODULES_BIZ_DIR.'/biz/';
// bizモジュールライブラリ
require_once $biz_dir . 'lib/smarty_functions.php';
require_once $biz_dir . 'lib/mysql_functions.php';

// 文字コード変換
function ktai_biz_convert_encoding($arr)
{
    return is_array($arr) ?
        array_map('ktai_biz_convert_encoding', $arr) :
        mb_convert_encoding($arr, 'UTF-8', 'SJIS-win');
}

$agent = new OpenPNE_KtaiUA();
if ($agent->is_docomo()) {
    $GLOBALS['__Framework']['carrier'] = 'i';
} elseif ($agent->is_au()) {
    $GLOBALS['__Framework']['carrier'] = 'e';
} elseif ($agent->is_vodafone()) {
    $GLOBALS['__Framework']['carrier'] = 's';
}

// 絵文字変換
function ktai_biz_convert_emoji($arr)
{
    return is_array($arr) ?
        array_map('ktai_biz_convert_emoji', $arr) :
        emoji_escape($arr);
}

function ktai_biz_convert($arr)
{
    $arr = ktai_biz_convert_emoji($arr);
    $arr = ktai_biz_convert_encoding($arr);
    return $arr;
}

$_GET     = ktai_biz_convert($_GET);
$_POST    = ktai_biz_convert($_POST);
$_REQUEST = ktai_biz_convert($_REQUEST);

ini_set('session.use_cookies', '0');

function init_ktai_biz_page(&$smarty)
{
    //---- inc_ テンプレート用 変数 ----//
    $smarty->assign('inc_ktai_header', fetch_inc_ktai_header());
    $smarty->assign('inc_ktai_footer', fetch_inc_ktai_footer());

    //全ページ共通変数のアサイン
    $smarty->assign('msg', k_p_common_msg4msg_id($_REQUEST['msg']));
    $smarty->assign('ktai_color_config', util_get_color_config_ktai());

    $is_secure = $GLOBALS['__Framework']['is_secure'];

    if ($is_secure) {
        $smarty->assign('u', $GLOBALS['KTAI_C_MEMBER_ID']);
        $smarty->assign('tail', $GLOBALS['KTAI_URL_TAIL']);
        @session_start();
        $smarty->assign('PHPSESSID', session_id());
    }

    // set SJIS
    $smarty->setOutputCharset('SJIS');
}

?>
