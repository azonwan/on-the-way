<?php
/**
 * 检测var目录的可读写性
 */
function check_dir($dir)
{
	static $msg = array();
    if (!is_dir($dir)) {
        return;
    }
    if ($dh = opendir($dir)) {
        while (($file = readdir($dh)) !== false) {
            if ($file[0] === '.') {
                continue;
            }
            $path = realpath($dir . '/' . $file);
            if (is_dir($path)) {
            	$msg[] = array(
								'dir'			=> $path,
								'is_readable'	=> is_readable($path),
								'is_writeable'	=> is_writeable($path),
            				   );
                check_dir($path);
            }
        }
        closedir($dh);
    }
    return $msg;
}

/**
 * 检测安装步骤
 */
function check_step()
{
	$step = get_request_var('a');
	$m = get_request_var('m');
	$m = empty($m)?"page":$m;
	$function = "init_{$m}";
	return $function($step);
}
function init_page($step){
	return empty($step)?"step0":$step;
}
function init_do($step){
	$sessid = get_request_var('sessid');
	if(empty($sessid) || md5(session_id().$step)!=$sessid){
		return "step0";
	}
	switch($step){
		case 'step0':
			return "step1";
			break;
		case 'step1':
			return "step2";
			break;
		case 'step2':
			$config = new OpenKakuSetup();
			if(    $config->set_domain(get_request_var('domain'))
				&& $config->set_phptype(get_request_var('phptype'))
				&& $config->set_encrype(get_request_var('encrype'))
				&& $config->set_hostspec(get_request_var('hostspec'))
				&& $config->set_username(get_request_var('username'))
				&& $config->set_password(get_request_var('password'))
				&& $config->set_database(get_request_var('database'))
			  ){
			  	$config->generate_config();
			  	return "step3";
			  }else{
			  	return "step2";
			  }
			break;
		case 'step3':
			global $_OPENPNE_DSN_LIST;
			require_once('OpenKakuSetupDB.php');
			$db = new OpenKaku_DB_SETUP($_OPENPNE_DSN_LIST['main']['dsn']);
			import_table($db);
			return "step4";
			break;
		default:
			return "step0";
	}
}
/**
 * 导入数据表及其内容
 */
function import_table(&$db){
	$mysql_version = get_request_var('mysql_version');
	$tables = file(OPENPNE_DIR."/setup/sql/{$mysql_version}/install/install-2.12-create_tables.sql");
	$data = file(OPENPNE_DIR."/setup/sql/{$mysql_version}/install/install-2.12-insert_data.sql");
	$GLOBALS['msg'] = array();
	$i=0;
	foreach($tables as $key=>$buffer){
		if(strspn('CREATE TABLE',$buffer)==strlen('CREATE TABLE')){
			$query = $buffer;
			$temp = split("`",$buffer);
			$GLOBALS['msg'][$i]['table']=$temp[1];
			continue;
		}elseif(strspn(';',$buffer)!=0){
			$query .= $buffer;
		}else{
			$query .=$buffer;
			continue;
		}
		$query = substr($query,0,strrpos($query,';'));
		if(!empty($GLOBALS['msg'][$i]['table']))
			$GLOBALS['msg'][$i++]['create_ok']=$db->query($query);
	}
	
	foreach($data as $key=>$buffer){
		$buffer = substr($buffer,0,strrpos($buffer,';'));
		$db->query($buffer);
	}
}
/**
 * 根据参数获取客户端提交的值
 */
function get_request_var($key){
    if (isset($_GET[$key])) {
        return $_GET[$key];
    } elseif (isset($_POST[$key])) {
        return $_POST[$key];
    } elseif (isset($_REQUEST[$key])) {
        return $_REQUEST[$key];
    } else {
        return '';
    }
}
function openpne_display_error($errors,$step = "step2"){
	$sessid = md5(session_id().$step);
	require_once("{$step}.inc");
	require_once('footer.inc');
}
?>