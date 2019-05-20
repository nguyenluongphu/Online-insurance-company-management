<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon shortcut" href="icon/logo.png">
<title>Bán bảo hiểm trực tuyến</title>
<!-- Index-Page-CSS -->    <link rel="stylesheet" href="css/mystyle.css" type="text/css" media="all">
</head>

<%
        String tk = null;
        if(session.getAttribute("user") != null){
             tk = (String)session.getAttribute("user");
        }
        String email = null;
        if(session.getAttribute("email") != null){
            email = (String)session.getAttribute("email");
        }
%>
        

<body style="background: #F5F5F5">
    <!-- Footer -->
    <div class="agileinfofooter">
        <div class="agileinfofooter-grids">

            <div class="col-md-4 agileinfofooter-grid agileinfofooter-grid1">
                <ul>
                    <%
                        if (tk != null) {
                    %>
                    <li><a href="TrangChuServlet?declare=1">KHAI BÁO</a></li>
                    <li><a href="TrangChuServlet?listdeclare=1&email=<%=email %>">DANH SÁCH KHAI BÁO</a></li>
                    <li><a href="TrangChuServlet?listbuy=1&email=<%=email %>">DANH SÁCH MUA</a></li>
                    <%
                        }
                    %>
                </ul>
            </div>

            <div class="col-md-4 agileinfofooter-grid agileinfofooter-grid2">
                <ul>
                    <li><a href="TrangChuServlet?introduce=1">GIỚI THIỆU</a></li>
                    <li><a href="TrangChuServlet?guide=1">HƯỚNG DẪN</a></li>
                    <li><a href="TrangChuServlet?contact=1">LIÊN HỆ</a></li>
                    <li><a href="TrangChuServlet?listbuy=1">THANH TOÁN</a></li>
                </ul>
            </div>

            <div class="col-md-4 agileinfofooter-grid agileinfofooter-grid3">
                <address>
                    <ul>
                        <li>FPT Software Đà Nẵng</li>
                        <li>Tầng 2 tòa nhà FPT - Complex</li>
                        <li>TP Đà Nẵng</li>
                        <li>+1 (734) 123-4567</li>
                        <li><a class="mail" href="nguyendangtinhdx@gmail.com">nguyendangtinhdx@gmail.com</a></li>
                    </ul>
                </address>
            </div>
            <div class="clearfix"></div>

        </div>
    </div>
    <!-- //Footer -->
    
     <!-- scroll-->
    <script type='text/javascript'>
        $(function() {
            $(window).scroll(function() // sự kiện lăn chuột
            {
                if ($(this).scrollTop() != 0) {
                    $('#bttop').fadeIn();// khai báo 1 biến bttop
                } else {
                    $('#bttop').fadeOut();
                }
            });
            $('#bttop').click(function()// bắt sự kiện khi click vào nút
            { 
                $('body,html').animate({
                    scrollTop: 0
                }, 800); // thời gian di chuyển về đầu trang
            });
        });
    </script>
    <!-- scroll-->

    <div id='bttop'><img alt="" src="icon/icon_top.gif" height="50" width="10"></div>

     <jsp:include page="countaccess.jsp"></jsp:include>

    <!-- Copyright -->
    <div class="w3lscopyrightaits">
        <div class="col-md-8 w3lscopyrightaitsgrid w3lscopyrightaitsgrid1">
            <p>© 2018 Website bán bảo hiểm trực tuyến. Được thiết kế bởi <a href="#" target="=_blank"> Nhóm 7 - Intern - Java - 01/2018 </a></p>
        </div>
        <div class="col-md-4 w3lscopyrightaitsgrid w3lscopyrightaitsgrid2">
            <div class="agilesocialwthree">
                <ul class="social-icons">
                    <li><a href="#" class="facebook w3ls" title="Go to Our Facebook Page"><i class="fa w3ls fa-facebook-square" aria-hidden="true"></i></a></li>
                    <li><a href="#" class="twitter w3l" title="Go to Our Twitter Account"><i class="fa w3l fa-twitter-square" aria-hidden="true"></i></a></li>
                    <li><a href="#" class="googleplus w3" title="Go to Our Google Plus Account"><i class="fa w3 fa-google-plus-square" aria-hidden="true"></i></a></li>
                    <li><a href="#" class="instagram wthree" title="Go to Our Instagram Account"><i class="fa wthree fa-instagram" aria-hidden="true"></i></a></li>
                    <li><a href="#" class="youtube w3layouts" title="Go to Our Youtube Channel"><i class="fa w3layouts fa-youtube-square" aria-hidden="true"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="clearfix"></div>

    </div>
    <!-- //Copyright -->
         
    
     <!-- chat online -->
    <script type='text/javascript'>window._sbzq||function(e){e._sbzq=[];var t=e._sbzq;t.push(["_setAccount",76472]);var n=e.location.protocol=="https:"?"https:":"http:";var r=document.createElement("script");r.type="text/javascript";r.async=true;r.src=n+"//static.subiz.com/public/js/loader.js";var i=document.getElementsByTagName("script")[0];i.parentNode.insertBefore(r,i)}(window);</script>


</body>
</html>