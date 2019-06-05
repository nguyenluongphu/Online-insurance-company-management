<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon shortcut" href="icon/logo.png">
<title>Bán bảo hiểm trực tuyến</title>
</head>

<style>
.counter{
color:#C41228;
font-weight:bold;
font-size: 20px;
}
</style>


<script>

    expireDate = new Date
    expireDate.setMonth(expireDate.getMonth()+6)
    jcount = eval(cookieVal("jaafarCounter"))
    jcount++
    document.cookie = "jaafarCounter="+jcount+";expires=" + expireDate.toGMTString()
    
    function cookieVal(cookieName) {
    thisCookie = document.cookie.split("; ")
    for (i=0; i<thisCookie.length; i++){
        if (cookieName == thisCookie[i].split("=")[0]){
            return thisCookie[i].split("=")[1]
        }
    }
    return 0
    }
    
    function page_counter(){
    for (i=0;i<(7-jcount.toString().length);i++)
    document.write('<span class="counter"></span>')
    for (y=0;y<(jcount.toString().length);y++)
    document.write('<span class="counter">'+jcount.toString().charAt(y)+'</span>')
    }

</script>
    <!--
        This script downloaded from www.JavaScriptBank.com
        Come to view and download over 2000+ free javascript at www.JavaScriptBank.com
    -->
<body style="background: #F5F5F5">

<h4><b><i>Số lượt truy cập:</i></b> <script>page_counter(jcount);</script></h4>



</body>
</html>