<%@page import="model.bean.TaiKhoanBEAN"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon shortcut" href="icon/logo.png">
<title>Bán bảo hiểm trực tuyến</title>
</head>
<script type="text/javascript">

var day =["Chủ nhật","Thứ hai","Thứ ba","Thứ tư","Thứ năm","Thứ sáu","Thứ bảy"];
var x =setInterval(date);
function date()
{
    var d = new Date();
    document.getElementById('date').innerHTML = day[d.getDay()] + ", ngày " + d.toLocaleDateString();
}

function checkLogout() {
    return confirm("Bạn có chắc chắn muốn đăng xuất không ?");
}

</script>
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
<style>
#key::placeholder {
    color: #000;
}
</style>
<body style="background: #F5F5F5">
    <!-- Header -->
    <div class="agileheader" id="agileitshome">

        <!-- Navigation -->
        <nav class="navbar navbar-default w3ls navbar-fixed-top">
            <div class="container">
                <div class="navbar-header wthree nav_2">
                    <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                        <span class="sr-only"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand agileinfo" href="TrangChuServlet?index=1"><span>BẢO HIỂM</span> BÌNH AN </a> 
                </div>
                <div id="bs-megadropdown-tabs" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                    
                          <%
                                if (tk != null) {
                            %>
                        <li class="dropdown">
                            <a href="TrangChuServlet?declare=1"><span> KHAI BÁO </span></a>
                        </li>

                        <li class="dropdown">
                            <a href="TrangChuServlet?listdeclare=1"><span> DANH SÁCH KHAI BÁO </span></a>
                        </li>
                        
                        <li class="dropdown">
                            <a href="TrangChuServlet?listbuy=1"><span> DANH SÁCH MUA </span></a>
                        </li>
                        
                        <%
                                }
                        %>
                        

                        <li class="wthreesearch">
                            <form action="TrangChuServlet" method="post">
                                <input type="search" name="key" id="key" placeholder="Từ khóa tìm kiếm..." >
                                <button style="height: 32px" type="submit" class="btn btn-default search" aria-label="Left Align" name="loai" value="timKiem">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </button>
                            </form>
                        </li>
                        
                    </ul>
                </div>

            </div>
        </nav>
        <!-- //Navigation -->



        <!-- Header-Top-Bar-(Hidden) -->
        <div class="agileheader-topbar">
            <div class="container">
                <div class="col-md-2 agileheader-topbar-grid agileheader-topbar-grid1">
                    <p>Hotline: <a href="#">1800-588813</a></p>
                </div>
                <div class="col-md-2 agileheader-topbar-grid agileheader-topbar-grid1">
                     <b id="date" style="color: #C41228"></b>
                </div>
                 <div class="col-md-2 agileheader-topbar-grid agileheader-topbar-grid1">
                      <div id="fb-root"></div>
	                    <script>(function(d, s, id) {
	                      var js, fjs = d.getElementsByTagName(s)[0];
	                      if (d.getElementById(id)) return;
	                      js = d.createElement(s); js.id = id;
	                      js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.12&appId=860333777447491&autoLogAppEvents=1';
	                      fjs.parentNode.insertBefore(js, fjs);
	                    }(document, 'script', 'facebook-jssdk'));</script>
	                    <div class="fb-like" data-href="https://tructuyen.baominh.vn/" data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>
	                </div>
	                <div class="col-md-6 agileheader-topbar-grid agileheader-topbar-grid2">
                    <ul>
                        <li><a href="TrangChuServlet?introduce=1">Giới thiệu</a></li>
                        <li><a href="TrangChuServlet?guide=1">Hướng dẫn</a></li>
                        <li><a href="TrangChuServlet?contact=1">Liên hệ</a></li>
                        <%
                            if (tk != null) {
                        %>
                        <li><a href="TrangChuServlet?listbuy=1">Thanh toán</a></li>
                        <li><a href="TrangChuServlet?profile=1"><i class="fa fa-user"></i> <%=tk %></a></li>
                        <li><a href="TaiKhoanServlet?type=logout" onclick="return checkLogout();"><i class="fa fa-sign-out"></i> Đăng xuất</a></li>
                        <%
                            }else{
                        %>
                        <li><a href="TrangChuServlet?login=1"><i class="fa fa-lock"></i> Đăng nhập</a></li>
                        <li><a href="TrangChuServlet?signin=1"><i class="fa fa-sign-in"></i> Đăng ký</a></li>
                        <%} %>
                        
                    </ul>
                </div>
                </div>
                
                <div class="clearfix"></div>
            </div>

                <!-- Popup-Box -->
                <div id="popup1">
                    <div id="small-dialog1" class="mfp-hide agileinfo">
                        <div class="pop_up">
                            <form action="TaiKhoanServlet" method="post">
                                <h3>ĐĂNG NHẬP</h3>
                                <input type="text" Name="Email" placeholder="Email" >
                                <input  type="password" Name="Password" placeholder="Mật khẩu" >
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
                                    <input type="submit" value="ĐĂNG NHẬP">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="small-dialog2" class="mfp-hide agileinfo">
                        <div class="pop_up">
                            <form action="#" method="post">
                                <h3>ĐĂNG KÝ</h3>
                                <input type="text" Name="Name" placeholder="Họ tên" required="">
                                <input type="text" Name="Address" placeholder="Địa chỉ" required="">
                                <input type="text" Name="Phone" placeholder="Số điện thoại" required="">
                                <input type="text" Name="Email" placeholder="Email" required="">
                                <input type="password" Name="Password" placeholder="Mật khẩu" required="">
                                <input type="password" Name="RePassword" placeholder="Xác nhận mật khẩu" required="">
                                <div class="send-button wthree agileits">
                                    <input type="submit" value="ĐĂNG KÝ">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- //Popup-Box -->

        </div>
        <!-- //Header-Top-Bar-(Hidden) -->



    </div>
    <!-- //Header -->
    
    
    
 
    
    
</body>
</html>