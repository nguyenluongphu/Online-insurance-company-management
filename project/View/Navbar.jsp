<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	.dropdown {
		width: 240px;
	}
	.dropdown-menu li > a:hover {
		background: none;
	}
</style>
</head>
<body>
	<a href="AdminServlet" class="logo">Bảo Hiểm Bình An </a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span> <span
			class="icon-bar"></span> <span class="icon-bar"></span> <span
			class="icon-bar"></span>
		</a>
		<div class="navbar-right">
			<ul class="nav navbar-nav">
				<!-- Messages: style can be found in dropdown.less-->
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a href="#"class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-user"></i> <span>${ten } <i class="caret"></i></span></a>
					<ul class="dropdown-menu dropdown-custom dropdown-menu-right">
						<li class="dropdown-header text-center">Tài Khoản</li>
						<li class="divider"></li>
						<li><a data-toggle="modal" href="#modal-user-settings"><i class="fa fa-cog fa-fw pull-right"></i> Cài Đặt</a></li>
						<li class="divider"></li>
						<li><a data-toggle="modal" href="#modal-user-settings"><i class="fa fa-cog fa-fw pull-right"></i> Đổi Mật Khẩu</a></li>
						<li class="divider"></li>
						<li><a href="LoginServlet"><i class="fa fa-sign-out fa-fw pull-right"></i>Đăng Xuất</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</body>
</html>