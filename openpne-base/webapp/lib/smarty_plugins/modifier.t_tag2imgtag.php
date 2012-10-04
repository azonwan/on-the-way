<?php
/*function smarty_modifier_t_tag2imgtag($string){
	return preg_replace('/\[img\](.+)\[\/img\]/isU','<img src="$1" />',$string);
}
*/

function smarty_modifier_t_tag2imgtag($string){
	return preg_replace('/\[img\]<a href="(.+)" target(.+)\[\/img\]/isU','<img src="$1" />',$string);
}
?>