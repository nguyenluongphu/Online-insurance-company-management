<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon shortcut" href="icon/logo.png">
<title>Bán bảo hiểm trực tuyến</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="Groovy Apparel a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Meta-Tags -->
    <style> 
         body::-webkit-scrollbar {
            width: 6px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        }
         body::-webkit-scrollbar-thumb {
          background-color: #C41228;
        }
    </style>
<!-- Custom-StyleSheet-Links -->
<!-- Bootstrap-CSS -->     <link rel="stylesheet" href="css/bootstrap.css"                  type="text/css" media="all">
<!-- Index-Page-CSS -->    <link rel="stylesheet" href="css/style.css"                      type="text/css" media="all">
<!-- Header-Slider-CSS --> <link rel="stylesheet" href="css/fluid_dg.css" id="fluid_dg-css" type="text/css" media="all">
<!-- //Custom-StyleSheet-Links -->

<!-- Fonts -->
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Noto+Serif:400,700"     type="text/css" media="all">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Montserrat:400,700"     type="text/css" media="all">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:100,300,400,500" type="text/css" media="all">
<!-- //Fonts -->

<!-- Font-Awesome-File-Links -->
<!-- CSS --> <link rel="stylesheet" href="css/font-awesome.css"          type="text/css" media="all">
<!-- TTF --> <link rel="stylesheet" href="fonts/fontawesome-webfont.ttf" type="text/css" media="all">
<!-- //Font-Awesome-File-Links -->

<!-- Supportive-Modernizr-JavaScript --><script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>

<!-- Default-JavaScript --><script src="js/jquery-2.2.3.js"></script>
</head>
     <script type="text/javascript">
            
             function validateEmail() {
                 var a = document.getElementById("Email").value;
                 var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
                 if (filter.test(a)) {
                     document.getElementById("errorEmail").innerHTML="";
                     return true;
                 }
                 else {
                     document.getElementById("errorEmail").innerHTML=" Email không hợp lệ !"
                     return false;
                 }
             }
            
            function validatePassword() {
                var a = document.getElementById("Password").value;
                if (a != '') {
                    document.getElementById("errorPassword").innerHTML="";
                    return true;
                }
                else {
                    document.getElementById("errorPassword").innerHTML="Vui lòng nhập mật khẩu !";
                    return false;
                }
            }
            
            
             function CheckValidate(){
                 if(!validateEmail() && !validatePassword()){
                     return false;
                 }
                 if(!validatePassword()){
                     return false;
                 }
                 if(!validateEmail()){
                     return false;
                 }
                 
             }

        </script>
<body style="background: #F5F5F5">

<%
        String email = "", password = "";
        if (request.getParameter("Email") != null) {
            email = request.getParameter("Email");
        }
        if (request.getParameter("Password") != null) {
            password = request.getParameter("Password");
        }
     
        String loginError = "";
        if(request.getAttribute("loginError") != null){
            loginError = (String)request.getAttribute("loginError");
        }

        String tk = null;
        if(session.getAttribute("email") != null){
             tk = (String)session.getAttribute("email");
        }
        
        if(tk != null){
            response.sendRedirect("TrangChuServlet?index=1");
        }
    %>

    <jsp:include page="header.jsp"></jsp:include>
    
    <div class="wthreeaddressaits">
        <div class="container">
            <div class="col-md-4"></div>
            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid2">
                <h2 style="margin: -50px 0 50px; font-weight: bold;">ĐĂNG NHẬP</h2>
                   <form action="TaiKhoanServlet" method="post">
                        <span style="color: red" id="errorEmail"></span> 
                        <input id="Email" type="text" Name="Email" placeholder="Email" value="<%=email %>" style="font-size: 13px ;font-family: inherit;">
                        <span style="color: red" id="errorPassword"></span>
                        <input id="Password" type="password" Name="Password" placeholder="Mật khẩu" style="font-size: 13px; font-family: inherit;">
                        <span style="color: red" id="errorPassword"><%=loginError %></span>
                        <ul class="tick w3layouts agileinfo">
                            <li>
                                <input type="checkbox" id="brand1" value="">
                                <label for="brand1"><span></span>Nhớ đăng nhập</label>
                                
                            </li>
                            <li>
                                <a href="#">Quên mật khẩu?</a>
                            </li>
                        </ul>
                        <div class="send-button wthree agileits">
                            <input type="hidden" value="login" name="type">
                            <input type="submit" value="ĐĂNG NHẬP" onclick="return CheckValidate()">
                        </div>
                    </form>
            </div>
            
            <div class="col-md-4">
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //Contact -->

    <jsp:include page="subcribe.jsp"></jsp:include>
    
    
    <jsp:include page="footerindex.jsp"></jsp:include>
</body>


  <jsp:include page="script.jsp"></jsp:include>


</html>