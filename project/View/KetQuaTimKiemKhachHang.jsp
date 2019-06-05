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
                             <span class="sm-st-icon st-red"><i class="fa fa-users"></i></span>
                             <div class="sm-st-info">
                                 <span>${tongSoHoSo }</span>
                                 Tổng Số Khách Hàng
                             </div>
                         </div>
                     </div>
                     <div class="col-md-3">
                         <div class="sm-st clearfix">
                             <span class="sm-st-icon st-violet"><i class="fa fa-user"></i></span>
                             <div class="sm-st-info">
                                 <span>${hoSoChuaXacThuc }</span>
                                 Khách Hàng Chưa Giám Định
                             </div>
                         </div>
                     </div>
                     <div class="col-md-3">
                         <div class="sm-st clearfix">
                             <span class="sm-st-icon st-blue"><i class="fa fa-check-square-o"></i></span>
                             <div class="sm-st-info">
                                 <span>${hoSoDaXacThuc }</span>
                                 Khách Hàng Đã Xác Thực
                             </div>
                         </div>
                     </div>
                     <div class="col-md-3">
                         <div class="sm-st clearfix">
                             <span class="sm-st-icon st-green"><i class="fa fa-paperclip"></i></span>
                             <div class="sm-st-info">
                                 <span>${hoSoChoXacThuc }</span>
                                 Khách Hàng Đang Chờ Xác Thực
                             </div>
                         </div>
                     </div>
                 </div>
                <div class="row">
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
                             <h4 id="tieude"><strong>Danh Sách Khách Hàng</strong></h4>
                             <div id="timkiem">
                           		<form class="navbar-form navbar-left" method="post" action="TimKiemKhachHangServlet">
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
						        <th>Mã Khách Hàng</th>
						        <th>Họ Tên</th>
						        <th>Địa Chỉ</th>
						        <th>Số Điện Thoại</th>
						        <th>Số Tài Khoản</th>
						        <th>Ngân Hàng</th>
						        <th class="col-sm-1">Chức Năng</th>
						      </tr>
						    </thead>
						    <tbody>
						      <c:forEach items="${dsKhachHang }" var = "kh">
						      	<tr>
						        <td>${kh.getMaKhachHang() }</td>
						        <td>${kh.getHoTen() }</td>
						        <td>${kh.getDiaChi() }</td>
						        <td>${kh.getSoDienThoai() }</td>
						        <td>${kh.getSoTaiKhoan() }</td>
						        <td>${kh.getNganHang() }</td>
						        <td class="col-sm-1" style="padding-left: 0px; ">
						        	<div class="pull-right hidden-phone">
						        		<button disabled="disabled" class="btn btn-default btn-xs"><i class="fa fa-check"></i></button>
										<button disabled="disabled" class="btn btn-default btn-xs"><i onclick="suaNhanVien('${kh.getMaKhachHang()}')" class="fa fa-pencil"></i></button>
										<button class="btn btn-default btn-xs" onclick="Xoa('${kh.getMaKhachHang()}')"><i class="fa fa-times"></i></button>
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
							 	<c:if test="${numberpage > 1}">
							 		<li><a href = "AdminNhanVienServlet?pageid=1">&laquo;</a></li>
							 	</c:if>
						 		<c:if test="${sumpage < 2}">
						 			<li><a href = "AdminNhanVienServlet?pageid=1">1</a></li>
						 		</c:if>
							   	<c:if test="${sumpage < 3}">
							   		<li><a href = "AdminNhanVienServlet?pageid=2">2</a></li>
							   	</c:if>
							   	<c:if test="${sumpage >= 3}">
							   		<c:if test="${numberpage > 1}">
							   			<li><a href = "AdminNhanVienServlet?pageid=${numberpage-1}">${numberpage-1}</a></li>
							   		</c:if>
							   		<li><a href = "AdminNhanVienServlet?pageid=${numberpage+1}">${numberpage+1}</a></li>
						  	 		<li><a href = "AdminNhanVienServlet?pageid=${numberpage+3}">${numberpage+3}</a></li>
							   	</c:if>
						  	 	
							   	<c:if test="${numberpage < sumpage }">
							   		<li><a href = "AdminNhanVienServlet?pageid=${sumpage}">&raquo;</a></li>
							   	</c:if>
							</ul>
				 		</div>
                      </section>
                  </div>
              	</div>
              	<div class="row">
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
              </div>
              <!-- row end -->
              </section><!-- /.content -->
                <jsp:include page="Footer.jsp"></jsp:include>
            </aside><!-- /.right-side -->

        </div><!-- ./wrapper -->
	<!-- jQuery 2.0.2 -->
	
	
	
	<script type="text/javascript">
		function Xoa($id){
			var result = confirm("Bạn có chắc chắn muốn xóa Khách hàng này không?");
			if(result == true){
				window.location = "XoaKhachhHangServlet?id="+$id;
			}
		}
		
		function suaNhanVien($id){
			window.location = "SuaNhanVienServlet?id="+$id;
		}
	</script>
	
	<script type="text/javascript">
		function result($info) {
			alert($info);
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
	<% List<Integer> dsThangTaiNan = (List<Integer>)request.getAttribute("dsThangTaiNan"); %>
	
	<%if(request.getAttribute("dsThangTaiNan") != null) { %>
		<script type="text/javascript">
	    $(function() {
	                "use strict";
	                //BAR CHART
	                var data = {
	                    labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
	                    datasets: [
	                        {
	                            label: "My First dataset",
	                            fillColor: "rgba(220,220,220,0.2)",
	                            strokeColor: "rgba(220,220,220,1)",
	                            pointColor: "rgba(220,220,220,1)",
	                            pointStrokeColor: "#fff",
	                            pointHighlightFill: "#fff",
	                            pointHighlightStroke: "rgba(220,220,220,1)",
	                            data: [12, 15, 20, 15, 30, 35, 20, 20, 25, 10, 5, 0]
	                        },
	                        {
	                            label: "My Second dataset",
	                            fillColor: "rgba(151,187,205,0.2)",
	                            strokeColor: "rgba(151,187,205,1)",
	                            pointColor: "rgba(151,187,205,1)",
	                            pointStrokeColor: "#fff",
	                            pointHighlightFill: "#fff",
	                            pointHighlightStroke: "rgba(151,187,205,1)",
	                            data: [<% for(int i = 0; i < dsThangTaiNan.size(); i++) {%> <%=dsThangTaiNan.get(i) %>, <% }%>]
	                        }
	                    ]
	                };
	            new Chart(document.getElementById("linechart").getContext("2d")).Line(data,{
	                responsive : true,
	                maintainAspectRatio: false,
	            });
	
	            });
	            // Chart.defaults.global.responsive = true;
		</script>
		<% } %>
	<!-- Director for demo purposes -->
</body>
</html>