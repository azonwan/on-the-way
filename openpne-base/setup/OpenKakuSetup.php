<?php
class OpenKakuSetup{
	var $domain 	= "";
	var $phptype	= "mysql";
	var $hostspec	= "localhost";
	var $username	= "root";
	var $password  	= "";
	var $database	= "openkaku";
	var $encrype	= "";
	    
	//生成config.php文件
	function generate_config(){
		$config_sample = @fopen(OPENPNE_DIR."/config.php.sample","r");
		$config = @fopen(OPENPNE_DIR."/config.php","w+");
		while($buffer = @fgets($config_sample, 4096)){
			$buffer = $this->check_config_set($buffer);
			@fputs($config,$buffer);
		}
		@fclose($config);
		@fclose($config_sample);
	}
	function check_config_set($str){
		switch(substr($str,0,18)){
			case "define('OPENPNE_UR":
				$str= "define('OPENPNE_URL', '{$this->domain}');\n";
				break;
			case "define('ENCRYPT_KE":
				$str= "define('ENCRYPT_KEY', '{$this->encrype}');\n";
				break;
			case "    'phptype'  => ":
				$str= "    'phptype'  => '{$this->phptype}',\n";
				break;
			case "    'username' => ":
				$str= "    'username' => '{$this->username}',\n";
				break;
			case "    'password' => ":
				$str= "    'password' => '{$this->password}',\n";
				break;
			case "    'hostspec' => ":
				$str= "    'hostspec' => '{$this->hostspec}',\n";
				break;
			case "    'database' => ":
				$str= "    'database' => '{$this->database}',\n";
				break;
		};
		return $str;
	}
	
	function validate($str,$rule){
		
		return true;
	}
	
	
	//属性的set方法
	function set_domain($domain){
		if($this->validate($domain,'domain')){
			$this->domain=$domain;
			return true;
		}else{
			return false;
		}
	}
	function set_encrype($encrype){
		if($this->validate($encrype,'encrype')){
			$this->encrype=$encrype;
			return true;
		}else{
			return false;
		}
	}
	function set_hostspec($hostspec){
		if($this->validate($hostspec,'hostspec')){
			$this->hostspec=$hostspec;
			return true;
		}else{
			return false;
		}
	}
	function set_phptype($phptype){
		if($this->validate($phptype,'phptype')){
			$this->phptype=$phptype;
			return true;
		}else{
			return false;
		}
	}
	function set_username($username){
		if($this->validate($username,'username')){
			$this->username=$username;
			return true;
		}else{
			return false;
		}
	}
	function set_password($password){
		if($this->validate($password,'password')){
			$this->password=$password;
			return true;
		}else{
			return false;
		}
	}
	function set_database($database){
		if($this->validate($database,'database')){
			$this->database=$database;
			return true;
		}else{
			return false;
		}
	}
}
?>