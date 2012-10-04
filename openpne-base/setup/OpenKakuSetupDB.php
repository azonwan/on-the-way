<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class OpenKaku_DB_SETUP
{
	var $username = 'root';
    var $password = '';
    var $hostspec = 'localhost';
    var $database = 'openkaku_dev';
    
    var $conn = null;
    var $error= null;
    
    
    function OpenKaku_DB_SETUP($dsn)
    {
    	$this->username = $dsn['username'];
    	$this->password = $dsn['password'];
    	$this->hostspec = $dsn['hostspec'];
    	$this->database = $dsn['database'];
    	$this->connect();
    }
    
    function connect(){
    	$conn = @mysql_connect($this->hostspec,$this->username,$this->password);
    	if(mysql_error()){
    		$this->error = "数据库联接失败，请检测你的数据库地址、用户名及密码是否正确。";
    		$this->is_error();
    		exit;
    	}else{
    		$this->conn = $conn;
    		$this->select_db();
    	}
    }
    
    function select_db(){
    	@mysql_select_db($this->database);
    	if(mysql_error()){
    		if(function_exists('mysql_create_db')){
    			@mysql_create_db($this->database,$this->conn);
    		}else{
    			$query = "CREATE DATABASE `{$this->database}` default character set utf8";
    			$this->query($query);
    		}
    		$this->select_db();
    	}
    }
    function close(){
    	@mysql_close($this->conn);
    }

    function query($sql)
    {
        return @mysql_query($sql,$this->conn);
    }
    
    function is_error(){
    	openpne_display_error($this->error);
    }
}

?>
