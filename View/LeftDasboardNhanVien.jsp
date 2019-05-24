<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	.manager{
		display: block;
		margin: 0px;
		padding-left: 15px;
		width: auto;
	  	height: 40px;
	  	line-height: 40px;
	  	padding: 0px;
	}
	.dropdown {
	  	color: #fff;
	  	font-weight: bold;
	  	display: block;
	  	padding-left: 15px;
	  	position: relative;
	}
	.manager:hover .dropdown{
		background: #55617D;
	}
	.dropdown-menu{
		margin: 0px;
		position: absolute;
	 	left: 220px;
 		top: 0;
 		width: 200px;
 		padding: 0px;
 		box-shadow: 5px 5px 5px #666;
		-moz-box-shadow: 5px 5px 5px #666;
		-webkit-box-shadow: 5px 5px 5px #666;
	}
	.dropdown-menu li >a:hover{
		background: #47BEE1;
		color: black;
	}
	.sidebar-menu{
		font-size: 1.2em;
	}
</style>
</head>

<body>
	<aside class="left-side sidebar-offcanvas" style="min-height: 600px;">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="img/avatar.png" class="img-circle" alt="User Image" />
                </div>
                <div class="pull-left info">
                    <p>Chào Admin</p>

                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>
            <!-- search form -->
            <form action="TimKiemNhanVienServlet" method="post" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="txtTimKiem" id="txtTimKiem" class="form-control" placeholder="Search..."/>
                    <span class="input-group-btn">
                        <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                    </span>
                </div>
            </form>
            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="active">
                    <a href="AdminNhanVienServlet">
                        <i class="fa fa-dashboard"></i> <span>Bảng điều khiển</span>
                    </a>
                </li>
            </ul>
           <div class="manager">
           		<div class="dropdown">
				    <span class="dropdown-toggle" data-toggle="dropdown" style="font-size: 1.2em;"><span class="glyphicon glyphicon-cog" style="margin-right: 5px;"></span>Quản Lý <span class="caret"></span></span>
			    	<ul class="dropdown-menu dropdown-content">
				      <li><a href="AdminNhanVienServlet">Quản Lý Khách Hàng</a></li>
				      <li><a href="DanhSachBaoHiemServlet">Quản Lý Bảo Hiểm</a></li>
				      <li><a href="QuanLyHoSoServlet">Quản Lý Hồ Sơ</a></li>
				      <li><a href="DanhSachMuaBaoHiemServlet">Danh Sách Mua Bảo Hiểm</a></li>
				    </ul>
				</div>
           	</div>
           	<ul class="sidebar-menu">
                <li class="">
                    <a href="#">
                        <i class="fa fa-cogs" aria-hidden="true"></i> <span>Bổ sung</span>
                    </a>
                </li>
            </ul>
            
            <ul class="sidebar-menu">
                <li class="">
                    <a href="#">
                        <i class="fa fa-calendar" aria-hidden="true"></i> <span>Sự kiện</span>
                    </a>
                </li>
            </ul>
            
            <ul class="sidebar-menu">
                <li class="">
                    <a href="#">
                        <i class="fa fa-bars" aria-hidden="true"></i> <span>Trang</span>
                    </a>
                </li>
            </ul>
            
             <ul class="sidebar-menu">
                <li class="">
                    <a href="#">
                        <i class="fa fa-desktop" aria-hidden="true"></i> <span>Hiển Thị</span>
                    </a>
                </li>
            </ul>
            
            <ul class="sidebar-menu">
                <li class="">
                    <a href="#">
                        <i class="fa fa-pencil-square" aria-hidden="true"></i> <span>Ghi chú</span>
                    </a>
                </li>
            </ul>
            
            <ul class="sidebar-menu">
                <li class="">
                    <a href="#">
                        <i class="fa fa-comment" aria-hidden="true"></i> <span>Bình luận</span>
                    </a>
                </li>
            </ul>
            
            <ul class="sidebar-menu">
                <li class="">
                    <a href="#">
                        <i class="fa fa-tasks" aria-hidden="true"></i> <span>Cài đặt</span>
                    </a>
                </li>
            </ul>
            
            <ul class="sidebar-menu">
                <li class="">
                    <a href="#">
                        <i class="fa fa-wrench" aria-hidden="true"></i> <span>Công cụ</span>
                    </a>
                </li>
            </ul>
        </section>
     </aside>
</body>
</html>