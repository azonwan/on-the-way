<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * トップバナーを1件ランダムで取得
 *
 * @return  array  c_banner
 */
function db_banner_get_top_banner($is_logined = false)
{
    $sql = 'SELECT * FROM c_banner WHERE type = \'TOP\'';
    if ($is_logined) {
        $sql .= ' AND is_hidden_after = 0';
    } else {
        $sql .= ' AND is_hidden_before = 0';
    }
    $sql .= db_order_by_rand();

    return db_get_row($sql);
}

/**
 * サイドバナーを1件ランダムで取得
 *
 * @return  array  c_banner
 */
function db_banner_get_side_banner($is_logined = false)
{
    $sql = 'SELECT * FROM c_banner WHERE type = \'SIDE\'';
    if ($is_logined) {
        $sql .= ' AND is_hidden_after = 0';
    } else {
        $sql .= ' AND is_hidden_before = 0';
    }
    $sql .= db_order_by_rand();

    return db_get_row($sql);
}

/**
 * バナーIDからバナー情報を取得
 *
 * @param   int $c_banner_id
 * @return  array c_banner
 */
function db_banner_get_c_banner4id($c_banner_id)
{
    $sql = 'SELECT * FROM c_banner WHERE c_banner_id = ?';
    $params = array(intval($c_banner_id));
    return db_get_row($sql, $params);
}

?>
