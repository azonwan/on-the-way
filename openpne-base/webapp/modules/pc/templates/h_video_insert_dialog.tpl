<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>({$INC_HEADER_title}) - 插入视频</title>
<style type="text/css">
<!--
#tishi{font-size:12px;color:#333333;font-family:"Courier New", Courier, monospace;}
-->
</style>
<script type="text/javascript">
//<![CDATA[
    var start=0;
    var end=0;
	var elm = window.opener.document.getElementById('mce_editor_textarea');
	savePos(elm);
    function insertVideoURLToTextarea(){        
        var textBox = elm;
        var pre = textBox.value.substr(0, start);
        var post = textBox.value.substr(end);
        textBox.value = pre + document.getElementById("video_url").value + post;
		window.close();
    }
    function savePos(textBox){
        //Firefox(1.5)
        if(typeof(textBox.selectionStart) == "number"){
            start = textBox.selectionStart;
            end = textBox.selectionEnd;
        }
        //IE(6.0
        else if(document.selection){
            var range = document.selection.createRange();
            if(range.parentElement().id == textBox.id){
                var range_all = document.body.createTextRange();
                range_all.moveToElementText(textBox);
                for (start=0; range_all.compareEndPoints("StartToStart", range) < 0; start++)
                    range_all.moveStart('character', 1);
                for (var i = 0; i <= start; i ++){
                    if (textBox.value.charAt(i) == '\n')
                        start++;
                }
                var range_all = document.body.createTextRange();
                range_all.moveToElementText(textBox);
                for (end = 0; range_all.compareEndPoints('StartToEnd', range) < 0; end ++)
                	range_all.moveStart('character', 1);
                for (var i = 0; i <= end; i ++){
                	if (textBox.value.charAt(i) == '\n')
                    	end ++;
                }
            }
		}
    }
//]]>
</script>
</head>
<body>
视频地址：<input type="text" id="video_url" /><input type="button" value="插入该视频" onclick="insertVideoURLToTextarea()" />
<div id="tishi"><p>在文本框中输入各视频网，如土豆网、优酷网、6间房视频网址。</p></div>
</body>
</html>
