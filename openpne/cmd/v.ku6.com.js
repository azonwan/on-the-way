function url2cmd(url) {

    var url_s = url.split("/");

    url_r = url_s[4].split(".html");
    id = url_r[0];
     main(id);
}
function main(id) {
    
   
 var html = '<iframe WIDTH="460" HEIGHT="400" MARGINWIDTH="0" MARGINHEIGHT="0" '
         + ' HSPACE="0" VSPACE="0" FRAMEBORDER="0" SCROLLING="no" BORDERCOLOR="#000000" '
         + ' src="http://player.ku6.com/refer/'+ id +'/v.swf"></iframe>';
    document.write(html);
}
