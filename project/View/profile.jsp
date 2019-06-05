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
             
             function validateName() {
                 var a = document.getElementById("Name").value;
                 if (a != '') {
                     document.getElementById("errorName").innerHTML="";
                     return true;
                 }
                 else {
                     document.getElementById("errorName").innerHTML="Vui lòng nhập họ tên !";
                     return false;
                 }
             }
             
             function validateAddress() {
                 var a = document.getElementById("Address").value;
                 if (a != '') {
                     document.getElementById("errorAddress").innerHTML="";
                     return true;
                 }
                 else {
                     document.getElementById("errorAddress").innerHTML="Vui lòng nhập địa chỉ !";
                     return false;
                 }
             }
             
             function validatePhone() {
                 var flag = false;
                 var phone = $('#Phone').val().trim(); // ID của trường Số điện thoại
                 var a = document.getElementById("Phone").value;
                 if (a != '') {
                     document.getElementById("errorPhone").innerHTML="";
                     flag = true;
                 }else {
                     document.getElementById("errorPhone").innerHTML="Vui lòng nhập số điện thoại !";
                     flag = false;
                 }
                 phone = phone.replace('(+84)', '0');
                 phone = phone.replace('+84', '0');
                 phone = phone.replace('0084', '0');
                 phone = phone.replace(/ /g, '');
                 if (phone != '') {
                     var firstNumber = phone.substring(0, 2);
                     if ((firstNumber == '09' || firstNumber == '08') && phone.length == 10) {
                         if (phone.match(/^\d{10}/)) {
                             document.getElementById("errorPhone").innerHTML="";
                             flag = true;
                         } else {
                             document.getElementById("errorPhone").innerHTML="Số điện thoại không hợp lệ !";
                             flag = false;
                         }
                     } else if (firstNumber == '01' && phone.length == 11) {
                         if (phone.match(/^\d{11}/)) {
                             document.getElementById("errorPhone").innerHTML="";
                             flag = true;
                         } else {
                             document.getElementById("errorPhone").innerHTML="Số điện thoại không hợp lệ !";
                             flag = false;
                         }
                     } else {
                             document.getElementById("errorPhone").innerHTML="Số điện thoại không hợp lệ !";
                             flag = false;
                         }
                 }   
                 return flag;
             }
             
            
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
            
            
            function validateConfirmPassword() {
                var a = document.getElementById("Password").value;
                var b = document.getElementById("ConfirmPassword").value;
                if (a == b) {
                    document.getElementById("errorConfirmPassword").innerHTML="";
                    return true;
                }
                else {
                    document.getElementById("errorConfirmPassword").innerHTML="Xác nhận mật khẩu không giống nhau !";
                    return false;
                }
            }
            
             function CheckValidate(){
                 if(!validateName()){
                     return false;
                 }
                 if(!validateAddress()){
                     return false;
                 }
                 if(!validatePhone()){
                     return false;
                 }
                 if(!validateEmail()){
                     return false;
                 }
                 if(!validatePassword()){
                     return false;
                 }
                 if(!validateConfirmPassword()){
                     return false;
                 }
             }

        </script>
<body style="background: #F5F5F5">

<%
        String tenDangNhap = "";
        String name = "", address = "", phone = "",  email = "", bankName = "", accountNumber = "";
        if (request.getParameter("Name") != null) {
            name = request.getParameter("Name");
        }
        if (request.getParameter("Address") != null) {
            address = request.getParameter("Address");
        }
        if (request.getParameter("Phone") != null) {
            phone = request.getParameter("Phone");
        }
        if (request.getParameter("Email") != null) {
            email = request.getParameter("Email");
        }
        if (request.getParameter("BankName") != null) {
            bankName = request.getParameter("BankName");
        }
        if (request.getParameter("AccountNumber") != null) {
            accountNumber = request.getParameter("AccountNumber");
        }
     
        String passwordError= "";
        if(request.getAttribute("passwordError") != null){
            passwordError = (String)request.getAttribute("passwordError");
        }

    %>

    <jsp:include page="header.jsp"></jsp:include>
    
    <div class="wthreeaddressaits">
        <div class="container">
            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid2">
            </div>
            
            
            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid2">
                <h2 style="margin: -50px 0 50px; font-weight: bold;">THÔNG TIN CÁ NHÂN</h2>
                <form action="TaiKhoanServlet" method="post">
                    <%
                       
                        ThongTinCaNhanBEAN ttcn = (ThongTinCaNhanBEAN)request.getAttribute("ListThongTinCaNhan");
                        if(request.getAttribute("ListThongTinCaNhan") != null){
                        tenDangNhap = ttcn.getTenDangNhap();
                    %>
                    <div style="float: left; width: 95%">
                    <span style="color: red" id="errorEmail"></span> 
                    <input id="Email" type="text" class="text" name="Email" placeholder="Email" value="<%=ttcn.getTenDangNhap() %>" readonly="readonly">
                    <span style="color: red" id="errorName"></span> 
                    <input id="Name" type="text" class="text" name="Name" placeholder="Họ tên" value="<%=ttcn.getHoTen() %>">
                    <span style="color: red" id="errorAddress"></span> 
                    <input id="Address" type="text" class="text" name="Address" placeholder="Địa chỉ"  value="<%=ttcn.getDiaChi() %>">
                    <span style="color: red" id="errorPhone"></span> 
                    <span style="color: red" id="errorPhoneEmpty"></span> 
                    <input id="Phone" type="text" class="text" name="Phone" placeholder="Số điện thoại" value="<%=ttcn.getSoDienThoai() %>">
                    </div>
                    <div style="float: left; width: 95%">
                    	<span style="color: red" id="errorPassword"><%=passwordError %></span> 
                    	<input id="Password" type="password" class="text" name="Password" placeholder="Mật khẩu" >
                    </div>
	                <div style="float: right; width: 5%">
	                	<span style="color: red; float: right; font-size: 20px;margin-top: 8px">*</span> 
	                </div>
	                <div style="float: left; width: 95%">
                    <span style="color: red" id="errorConfirmPassword"></span> 
                    <input id="ConfirmPassword" type="password" class="text" name="ConfirmPassword" placeholder="Xác nhận mật khẩu" >
					</div>
	                <div style="float: right; width: 5%">
	                	<span style="color: red; float: right; font-size: 20px;margin-top: 8px">*</span> 
	                </div>
<%--                     <input type="text" class="text" name="BankName" placeholder="Tên ngân hàng (Không bắt buộc)" value="<%=ttcn.getNganHang() %>" >
                    <input type="text" class="text" name="AccountNumber" placeholder="Số tài khoản (Không bắt buộc)" value="<%=ttcn.getSoTaiKhoan() %>"> --%>
                    <input type="hidden" value="updateInfo" name="type">
                    <div style="float: left; width: 95%">
                    <input type="submit" value="Cập nhật thông tin" onclick="return CheckValidate()">
                    </div>
                    <%
                        }
                    %>
                </form>
                <br>
                <a style="float: left; width: 95%; margin-top: 10px" href="TrangChuServlet?changepassword=1"><input type="submit" value="Đổi mật khẩu"></a>
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