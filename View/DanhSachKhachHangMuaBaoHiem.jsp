<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Quản Lý Công Ty Bảo Hiểm | Admin</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<meta name="keywords"
	content="Admin, Bootstrap 3, Template, Theme, Responsive">
<!-- bootstrap 3.0.2 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Morris chart -->
<link href="css/style2.css" rel="stylesheet" type="text/css" />

<link href="css/ListGeneral.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.panel-heading{
		position: relative;
		height: 60px;
	}
	#tieude{
		float: left;
		width: 70%;
	}
	
	#timkiem{
		display: block;
		float: right;
		width: 250px;
		padding: 0px;
	}
	.navbar-form{
		padding: 0px;
		margin-top: 2px;
		margin-bottom: 2px;
	}
	.btn:hover {
		box-shadow:
        0px 0px 5px rgba(255,255,255,1) inset,
        1px 2px 10px rgba(0,0,0,1);
	}
</style>
</head>
<body class="skin-black">
	<!-- header logo: style can be found in header.less -->
	<header class="header">
		<jsp:include page="Navbar.jsp"></jsp:include>
	</header>
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="LeftDasboardNhanVien.jsp"></jsp:include>
		 <aside class="right-side">
                <!-- Main content -->
            <section class="content">
            	<div class="row" style="margin-bottom:5px;">
                     <div class="col-md-3">
                         <div class="sm-st clearfix">
                             <span class="sm-st-icon st-red"><i class="fa fa-bars"></i></span>
                             <div class="sm-st-info">
                                 <span>${tongSoPhieu }</span>
                                 Tổng Số Hóa Đơn Khách Hàng Đã Mua
                             </div>
                         </div>
                     </div>
                     <div class="col-md-3">
                         <div class="sm-st clearfix">
                             <span class="sm-st-icon st-violet"><i class="fa fa-user"></i></span>
                             <div class="sm-st-info">
                                 <span>${phieuChuaThanhToan }</span>
                                Tổng Hóa Đơn Chưa Thanh Toán
                             </div>
                         </div>
                     </div>
                     <div class="col-md-3">
                         <div class="sm-st clearfix">
                             <span class="sm-st-icon st-blue"><i class="fa fa-check-square-o"></i></span>
                             <div class="sm-st-info">
                                 <span>${phieuDaThanhToan }</span>
                                 Tổng Hóa Đơn Đã Thanh Toán
                             </div>
                         </div>
                     </div>
                     <div class="col-md-3">
                         <div class="sm-st clearfix">
                             <span class="sm-st-icon st-green"><i class="fa fa-paperclip"></i></span>
                             <div class="sm-st-info">
                                 <span>${phieuDaXacNhan }</span>
                                 Hóa Đơn Đã Được Nhân Viên Xác Nhận
                             </div>
                         </div>
                     </div>
                 </div>
                <div class="row" id="mytable">
                    <div class="col-md-12">
                     <c:if test="${result  != null}">
                       	<div  id="result">
                       		<span>
                       			${result}
                       		</span>	
                       	</div>
                      </c:if>
                      <section class="panel tasks-widget">
                         <header class="panel-heading">
                             <h4 id="tieude"><strong>Danh Sách Khách Hàng Đăng Ký Mua Bảo Hiểm</strong></h4>
                             <div id="timkiem">
                           		<form class="navbar-form navbar-left" method="post" action="TimKiemPhieuMuaBaoHiemServlet">
					      			<div class="input-group">
					        			<input type="text" class="form-control" id="txtTimKiem" name = "txtTimKiem"  placeholder="Search" name="search">
					        			<div class="input-group-btn">
							          		<button class="btn btn-default" type="submit">
							            	<i class="glyphicon glyphicon-search"></i>
							          		</button>
					        			</div>
					      			</div>
					    		</form>
                               </div>
                         </header>
                         <div class="panel-body">
						  <table class="table table-bordered table-hover">
						    <thead>
						      <tr>
						        <th>Mã Phiếu</th>
						        <th>Họ Tên</th>
						        <th>Loại Bảo Hiểm</th>
						        <th>Ngày Mua</th>
						        <th>Tình Trạng Thanh Toán</th>
						        <th>Nhân Viên Xác Nhận</th>
						        <th style="width: 19%;">Chức Năng</th>
						      </tr>
						    </thead>
						    <tbody>
						      <c:forEach items="${dsKhachHang }" var = "kh">
						      	<tr>
						        <td>${kh.getMaPhieuBaoHiem() }</td>
						        <td>${kh.getHoTen() }</td>
						        <td>${kh.getLoaiBaoHiem() }</td>
						        <td>${kh.getNgayMua() }</td>
						        <td>${kh.getTinhTrangThanhToan() }</td>
						        <td>${kh.getMaNhanVien() }</td>
						        <td style="width: 19%; padding-left: 1px; padding-right: 1px;">
						        	<div class="pull-right hidden-phone">
						        		<button class="btn btn-primary btn-xs"><i onclick="xemChiTiet('${kh.getMaPhieuBaoHiem()}')" class="fa fa-pencil"></i> Chi Tiết</button>
						        		<c:if test="${kh.getMaNhanVien() == null}">
						        			<button class="btn btn-danger btn-xs" onclick="xacNhan('${kh.getMaPhieuBaoHiem()}','${kh.getTinhTrangThanhToan() }')"><i class="fa fa-check"></i> Xác Nhận</button>
						        		</c:if>
						        		<c:if test="${kh.getMaNhanVien() != null}">
						        			<button class="btn btn-success btn-xs"><i class="fa fa-check"></i> Đã Xác Nhận</button>
						        		</c:if>
						        		
										<button class="btn btn-default btn-xs" onclick="Xoa('${kh.getMaPhieuBaoHiem()}')"><i class="fa fa-times"></i></button>
									</div>
								</td>
						      </tr>
						      </c:forEach>
						      
						    </tbody>
						  </table>
                          </div>
                          <!-- Phân trang -->
                          <div class="col-sm-12" style="text-align: center; max-width: 100%;">
						 	<ul class = "pagination">
						 		<li><a href = "DanhSachMuaBaoHiemServlet?pageid=${numberpage-1}">&laquo;</a></li>
					 			<li><a href = "DanhSachMuaBaoHiemServlet?pageid=1">1</a></li>
					 			<li><a href = "DanhSachMuaBaoHiemServlet?pageid=2">2</a></li>
					 			<li><a href = "DanhSachMuaBaoHiemServlet?pageid=3">3</a></li>
							   	<c:if test="${numberpage <= sumpage }">
							   		<li><a href = "DanhSachMuaBaoHiemServlet?pageid=${sumpage}">&raquo;</a></li>
							   	</c:if>
							</ul>
			 			</div>
                      </section>
                  </div>
              	</div>
              	<%-- <div class="row">
                   <div class="col-md-12">
                       <!--earning graph start-->
                       <section class="panel">
                           <header class="panel-heading">
                               Thống Kê Tình Hình Bồi Thường Tai Nạn
                           </header>
                           <div class="panel-body">
                               <canvas id="linechart" width="600" height="330"></canvas>
                           </div>
                       </section>
                                   <!--earning graph end-->
                   </div>
              </div> --%>
              <!-- row end -->
              </section><!-- /.content -->
                <jsp:include page="Footer.jsp"></jsp:include>
            </aside><!-- /.right-side -->

        </div><!-- ./wrapper -->
	<!-- jQuery 2.0.2 -->
	
	
	
	<script type="text/javascript">
		function Xoa($id){
			var result = confirm("Bạn có chắc chắn muốn xóa phiếu mua này không?");
			if(result == true){
				xoaPhieuMua($id);
			}
		}
		
		function xemChiTiet($id){
			window.location = "XemChiTietPhieuMua?id="+$id;
		}
	</script>
	
	<script type="text/javascript">
		function xacNhan($id, $tinhTrangThanhToan) {
	  	  var xhttp = new XMLHttpRequest();
	  	  var url="XacNhanThanhToanPhieuMuaServlet?idMaPhieuXacNhan="+$id+"&tinhTrangThanhToan="+$tinhTrangThanhToan;
	  	  xhttp.onreadystatechange = function() {
	  	    if (this.readyState == 4 && this.status == 200) {
	  	      var data = xhttp.responseText;
	  	      document.getElementById("mytable").innerHTML=data;
	  	      //alert("Bạn đã giám định hồ sơ này!");
	  	    }
	  	  };
	  	  xhttp.open("POST",url, true);
	  	  xhttp.send();
	  	}
		
		function xoaPhieuMua($id) {
	  	  var xhttp = new XMLHttpRequest();
	  	  var url="XacNhanThanhToanPhieuMuaServlet?idMaPhieuXoa="+$id;
	  	  xhttp.onreadystatechange = function() {
	  	    if (this.readyState == 4 && this.status == 200) {
	  	      var data = xhttp.responseText;
	  	      document.getElementById("mytable").innerHTML=data;
	  	      //alert("Bạn đã giám định hồ sơ này!");
	  	    }
	  	  };
	  	  xhttp.open("POST",url, true);
	  	  xhttp.send();
	  	}
	</script>
	
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<script src="js/jquery.min.js" type="text/javascript"></script>

	<!-- jQuery UI 1.10.3 -->
	<script src="js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<!-- daterangepicker -->
	<script src="js/plugins/daterangepicker/daterangepicker.js"
		type="text/javascript"></script>

	<script src="js/plugins/chart.js" type="text/javascript"></script>

	<!-- iCheck -->
	<script src="js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
	<!-- calendar -->
	<script src="js/plugins/fullcalendar/fullcalendar.js"
		type="text/javascript"></script>

	<!-- Director App -->
	<script src="js/Director/app.js" type="text/javascript"></script>

	<!-- Director dashboard demo (This is only for demo purposes) -->
	<script src="js/Director/dashboard.js" type="text/javascript"></script>
	<!-- Director for demo purposes -->
</body>
</html>