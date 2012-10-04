function url2cmd(url) {

    var url_s = url.split("/");
	 url_s = url_s[4].split(".html");
	 url_t = url_s[0].split("id_");
	 id = url_t[1];
     main(id);
}
function main(id) {
    
   
 var html =  '<iframe WIDTH="460" HEIGHT="400" MARGINWIDTH="0" MARGINHEIGHT="0" '
         + ' HSPACE="0" VSPACE="0" FRAMEBORDER="0" SCROLLING="no" BORDERCOLOR="#000000" '
         + ' src="http://player.youku.com/player.php/sid/'+ id +'/v.swf"></iframe>';
    document.write(html);
}
