<%@page import="model.bean.ThongTinCaNhanBEAN"%>
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
             
            function validatePasswordOld() {
                var a = document.getElementById("PasswordOld").value;
                if (a != '') {
                    document.getElementById("errorPasswordOld").innerHTML="";
                    return true;
                }
                else {
                    document.getElementById("errorPasswordOld").innerHTML="Vui lòng nhập mật khẩu cũ !";
                    return false;
                }
            }
            function validatePasswordNewEmpty() {
                var a = document.getElementById("PasswordNew").value;
                if (a != '') {
                    document.getElementById("errorPasswordNew").innerHTML="";
                    return true;
                }
                else {
                    document.getElementById("errorPasswordNew").innerHTML="Vui lòng nhập mật khẩu mới !";
                    return false;
                }
            }
            
            function validatePasswordNew() {
                var a = document.getElementById("PasswordOld").value;
                var b = document.getElementById("PasswordNew").value;
                if (a != b) {
                    document.getElementById("errorPasswordNew").innerHTML="";
                    return true;
                }
                else {
                    document.getElementById("errorPasswordNew").innerHTML="Mật khẩu mới không được giống mật khẩu cũ !";
                    return false;
                }
            }
            
            
            function validateConfirmPasswordNew() {
                var a = document.getElementById("PasswordNew").value;
                var b = document.getElementById("ConfirmPasswordNew").value;
                if (a == b) {
                    if(b == ''){
                        document.getElementById("errorConfirmPasswordNew").innerHTML="Vui lòng nhập xác nhận mới mật khẩu !";
                        return false;
                     }else{
                         document.getElementById("errorConfirmPasswordNew").innerHTML="";
                         return true;
                     }
                }
                else {
                    document.getElementById("errorConfirmPasswordNew").innerHTML="Xác nhận mật khẩu mới không giống nhau !";
                    return false;
                }
            }
            
             function CheckValidate(){
                 if(!validatePasswordOld() && !validatePasswordNew() && !validatePasswordNewEmpty() && !validateConfirmPasswordNew()){
                     return false;
                 }
                 if(!validatePasswordOld()){
                     return false;
                 }
                 if(!validatePasswordNew()){
                     return false;
                 }
                 if(!validatePasswordNewEmpty()){
                     return false;
                 }
                 if(!validateConfirmPasswordNew()){
                     return false;
                 }
                 
             }

        </script>
<body style="background: #F5F5F5">

<%

     
            String passwordOldError= "";
            if(request.getAttribute("passwordOldError") != null){
                passwordOldError = (String)request.getAttribute("passwordOldError");
            }

    %>

    <jsp:include page="header.jsp"></jsp:include>
    
    <div class="wthreeaddressaits">
        <div class="container">
            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid2">
            </div>
            
            
            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid2">
                <h2 style="margin: -50px 0 50px; font-weight: bold;">ĐỔI MẬT KHẨU</h2>
                <form action="TaiKhoanServlet" method="post">
                    <%
                        ThongTinCaNhanBEAN ttcn = (ThongTinCaNhanBEAN)request.getAttribute("ListThongTinCaNhan");
                        if(request.getAttribute("ListThongTinCaNhan") != null){
                    %>
					<div style="float: left; width: 95%">
	                    <span style="color: red" id="errorPasswordOld"><%=passwordOldError %></span> 
	                    <input id="PasswordOld" type="password" class="text" name="PasswordOld" placeholder="Mật khẩu cũ" >
                   	</div>
	                <div style="float: right; width: 5%">
	                	<span style="color: red; float: right; font-size: 20px;margin-top: 8px">*</span> 
	                </div>
	                <div style="float: left; width: 95%">
                    <span style="color: red" id="errorPasswordNew"></span> 
                    <input id="PasswordNew" type="password" class="text" name="PasswordNew" placeholder="Mật khẩu mới" >
                    </div>
	                <div style="float: right; width: 5%">
	                	<span style="color: red; float: right; font-size: 20px;margin-top: 8px">*</span> 
	                </div>
                    <div style="float: left; width: 95%">
                    <span style="color: red" id="errorConfirmPasswordNew"></span> 
                    <input id="ConfirmPasswordNew" type="password" class="text" name="ConfirmPasswordNew" placeholder="Xác nhận mật khẩu mới" >
                    </div>
	                <div style="float: right; width: 5%">
	                	<span style="color: red; float: right; font-size: 20px;margin-top: 8px">*</span> 
	                </div>
                    <input type="hidden" value="<%=ttcn.getTenDangNhap() %>" name="Email">
                    <input type="hidden" value="changepassword" name="type">
                    <div style="float: left; width: 95%">
                    	<input type="submit" value="Đổi mật khẩu" onclick="return CheckValidate()">
                    </div>
                    
                    <%
                        }
                    %>
                </form>
            </div>
            <div class="col-md-4"></div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //Contact -->

    <jsp:include page="subcribe.jsp"></jsp:include>
    
    
    <jsp:include page="footerindex.jsp"></jsp:include>
</body>


  <jsp:include page="script.jsp"></jsp:include>


</html>