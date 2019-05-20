<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	.manager{
		padding: 10px;
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
                    <p>Hello Giám Đốc</p>

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
                    <a href="AdminServlet">
                        <i class="fa fa-dashboard"></i> <span>Bảng điều khiển</span>
                    </a>
                </li>
            </ul>
            <ul class="sidebar-menu">
                <li class="">
                    <a href="AdminServlet">
                        <i class="fa fa-cogs" aria-hidden="true"></i> <span>Quản Lý Nhân Viên</span>
                    </a>
                </li>
            </ul>
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
                        <i class="fa fa-bars" aria-hidden="true"></i> <span>Trang chủ</span>
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