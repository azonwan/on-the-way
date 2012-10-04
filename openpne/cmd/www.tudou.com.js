function url2cmd(url) {

    var url_s = url.split("/");

    if(url_s.length>6) {
     id = url_s[5];
    } else {
     id = url_s[4];
    }
     main(id);
}
function main(id) {
    
   
 var html = '<object width="400" height="340"><param name="movie" value="http://www.tudou.com/v/'
            + id
            + '"><param name="allowScriptAccess" value="always"></param><param name="wmode" value="transparent"></param><embed src="http://www.tudou.com/v/'
            + id
            + '" type="application/x-shockwave-flash" width="400" height="340" allowFullScreen="true" wmode="transparent" allowScriptAccess="always"></embed></object>';
    document.write(html);
}

