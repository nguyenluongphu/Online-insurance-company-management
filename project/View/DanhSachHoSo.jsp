<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="common.DuLieuThongKe"%>
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
	#tieude{
		font-size: 1.3em;
	}
	.btn:hover {
		box-shadow:
        0px 0px 5px rgba(255,255,255,1) inset,
        1px 2px 10px rgba(0,0,0,1);
	}
	.backg{
		background-image: url('img/hinh-nen-hd-28.jpg');
		width: inherit;
		max-height: 700px;
		height: 100%;
		background-repeat: no-repeat;
	    background-position: center center;
	    background-size: cover;
	    filter : blur(5px);
	    -moz-filter: blur(5px);
	    -webkit-filter: blur(5px);
	    position: absolute;
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
                                 Tổng Số Hồ Sơ
                             </div>
                         </div>
                     </div>
                     <div class="col-md-3">
                         <div class="sm-st clearfix">
                             <span class="sm-st-icon st-violet"><i class="fa fa-user"></i></span>
                             <div class="sm-st-info">
                                 <span>${hoSoChuaXacThuc }</span>
                                 Hồ Sơ Chưa Giám Định
                             </div>
                         </div>
                     </div>
                     <div class="col-md-3">
                         <div class="sm-st clearfix">
                             <span class="sm-st-icon st-blue"><i class="fa fa-check-square-o"></i></span>
                             <div class="sm-st-info">
                                 <span>${hoSoDaXacThuc }</span>
                                 Hồ Sơ Đã Xác Thực
                             </div>
                         </div>
                     </div>
                     <div class="col-md-3">
                         <div class="sm-st clearfix">
                             <span class="sm-st-icon st-green"><i class="fa fa-paperclip"></i></span>
                             <div class="sm-st-info">
                                 <span>${hoSoChoXacThuc }</span>
                                 Hồ Sơ Chờ Xác Thực
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
                          	<div class="backg">
           		
            				</div>
                            <header class="panel-heading">
                                  <h4 id="tieude"><strong>Danh Sách Hồ Sơ Khai Báo Tai Nạn</strong></h4>
                                  <div id="timkiem">
                               		<form class="navbar-form navbar-left" method="post" action="TimKiemHoSoServlet">
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
								  <table id="mytable" class="table table-bordered table-hover">
								    <thead>
								      <tr>
								        <th>Mã Hồ Sơ</th>
								        <th>Mã Khách Hàng</th>
								        <th>Biển Số</th>
								        <th>Ngày Tai Nạn</th>
								        <th>Tên Tài Xế</th>
								        <th>Nhân Viên QL</th>
								        <th style="width: 19%;">Chức Năng</th>
								      </tr>
								    </thead>
								    <tbody>
								      <c:forEach items="${dsHoSo }" var = "hs">
								      	<tr>
								        <td>${hs.getMaHoSo() }</td>
								        <td>${hs.getMaKhachHang() }</td>
								        <td>${hs.getBienSo() }</td>
								        <td>${hs.getNgayXayRaTaiNan() }</td>
								        <td>${hs.getTenTaiXe() }</td>
							        	<c:if test="${hs.getMaNhanVien() != null}">
							        		<td>${hs.getMaNhanVien() }</td>
							        	</c:if>
							        	<c:if test="${hs.getMaNhanVien() == null}">
							        		<td>Chưa Có</td>
							        	</c:if>
								        <td style="padding-left: 0px; width: 19%; ">
								        	<div class="pull-right hidden-phone">
								        		<button class="btn btn-primary btn-xs" onclick="chiTietHoSo('${hs.getMaHoSo()}')"><i class="fa fa-eye"></i> Chi Tiết</button>
								        		
								        		<c:if test="${hs.getMaNhanVien() == null}">
								        			<button class="btn btn-danger btn-xs" onclick="giamDinh('${hs.getMaHoSo()}')"><i class="fa fa-anchor"></i> ${hs.getTrangThaiXacThuc()}</button>
								        		</c:if>
								        		<c:if test="${hs.getMaNhanVien() != null}">
								        			<c:if test="${hs.getTrangThaiXacThuc() == 'Xác Thực'}">
								        				<button class="btn btn-warning btn-xs" onclick="xacThuc('${hs.getMaHoSo()}')"><i class="fa fa-pencil"></i> ${hs.getTrangThaiXacThuc()}</button>
								        			</c:if>
								        			<c:if test="${hs.getTrangThaiXacThuc() == 'Đã Xác Thực'}">
								        				<button class="btn btn-success btn-xs"<%--  onclick="xacThuc('${hs.getMaHoSo()}')" --%>><i class="fa fa-check"></i> ${hs.getTrangThaiXacThuc()}</button>
								        			</c:if>
								        		</c:if>
								        		<!-- <button class="btn btn-danger btn-xs" onclick="giamDinh('${hs.getMaHoSo()}')">${hs.getTrangThaiXacThuc()}</button> -->
												<button class="btn btn-default btn-xs" onclick="Xoa('${hs.getMaHoSo()}')"><i class="fa fa-times"></i></button>
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
						 		<li><a href = "QuanLyHoSoServlet?pageid=${numberpage-1}">&laquo;</a></li>
					 			<li><a href = "QuanLyHoSoServlet?pageid=1">1</a></li>
					 			<li><a href = "QuanLyHoSoServlet?pageid=2">2</a></li>
					 			<li><a href = "QuanLyHoSoServlet?pageid=3">3</a></li>
							   	<c:if test="${numberpage <= sumpage }">
							   		<li><a href = "QuanLyHoSoServlet?pageid=${sumpage}">&raquo;</a></li>
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
                           		 <form method="post" action="QuanLyHoSoServlet">
								    <div class="form-group" style="width: 330px; margin: 0px; float: left;">
									  <label for="sel1" style="width: 170px; float: left; margin-top: 5px;">Thống Kê Theo Năm:</label>
									  <select class="form-control" name="cbNam" id="sel1" style="width: 150px; margin: 0px;">
									    <c:forEach items = "${dsNam }" var = "nam">
									    	<c:if test="${namDangChon == namHienTai }">
									    		<c:if test="${nam.toString() == namHienTai }">
										    	 	<option selected="selected" value="${nam.toString() }">${nam.toString() }</option>
										    	 </c:if>
										    	 <c:if test="${nam.toString() != namHienTai }">
										    	 	<option value="${nam.toString() }">${nam.toString() }</option>
										    	 </c:if>	
									    	</c:if>
									    	<c:if test="${namDangChon != namHienTai }">
									    		<c:if test="${nam.toString() == namDangChon }">
										    	 	<option selected="selected" value="${nam.toString() }">${nam.toString() }</option>
										    	 </c:if>
										    	 <c:if test="${nam.toString() != namDangChon }">
										    	 	<option value="${nam.toString() }">${nam.toString() }</option>
										    	 </c:if>	
									    	</c:if>
									    </c:forEach>
									  </select>
									</div>
									<div class="form-group" style="width: 500px; margin: 0px;"> 
									    <div class="col-sm-offset-2 col-sm-10" style="margin: 0px; width: 100px; padding-left: 0px;">
									      <button type="submit" class="btn btn-basic">Thống Kê</button>
									    </div>
									  </div>
							      </form>
                               
                           </header>
                           <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                           <div id="bieudohinhtron" style="height: 400px"></div>
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
			var result = confirm("Bạn có chắc chắn muốn xóa hồ sơ này không?");
			if(result == true){
				window.location = "XoaHoSoServlet?id="+$id;
			}
		}
		
		function suaNhanVien($id){
			window.location = "SuaNhanVienServlet?id="+$id;
		}
		
		function chiTietHoSo($id){
			window.location = "ChiTietHoSoServlet?id="+$id;
		}
		
		function xacThuc($id){
			window.location = "XacThucGiamDinhHoSoServlet?id="+$id;
		}
		
		function giamDinh($id) {
        	  var xhttp = new XMLHttpRequest();
        	  var url="GiamDinhHoSoServlet?id="+$id;
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
		
		function thongke() {
      	  var xhttp = new XMLHttpRequest();
      	  var url="ThongKeTheoNamHoSoServlet";
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
	<script src="js/plugins/highcharts.js" type="text/javascript"></script>

	<!-- iCheck -->
	<script src="js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
	<!-- calendar -->
	<script src="js/plugins/fullcalendar/fullcalendar.js"
		type="text/javascript"></script>

	<!-- Director App -->
	<script src="js/Director/app.js" type="text/javascript"></script>

	<!-- Director dashboard demo (This is only for demo purposes) -->
	<script src="js/Director/dashboard.js" type="text/javascript"></script>
	
	<%  List<Integer> dsThangTaiNan = (List<Integer>)request.getAttribute("dsThangTaiNan"); 
	    List<DuLieuThongKe> dsThangPhanTram = (List<DuLieuThongKe>)request.getAttribute("dsThangTaiNanPhanTram");
	%>
	
	<%if(request.getAttribute("dsThangTaiNan") != null) { %>
		<script type="text/javascript">

		Highcharts.chart('container', {
		    chart: {
		        type: 'line'
		    },
		    title: {
		        text: 'THỐNG KÊ TÌNH HÌNH BỒI THƯỜNG TAI NẠN (Số hồ sơ bồi thường)'
		    },
		    subtitle: {
		        text: ''
		    },
		    xAxis: {
		        categories: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12']
		    },
		    yAxis: {
		        title: {
		            text: 'Số hồ sơ bồi thường'
		        }
		    },
		    plotOptions: {
		        line: {
		            dataLabels: {
		                enabled: true
		            },
		            enableMouseTracking: false
		        }
		    },
		    series: [{
		        name: 'Số hồ sơ bồi thường',
		        data: [<% for(int i = 0; i < dsThangTaiNan.size(); i++) {%> <%=dsThangTaiNan.get(i) %>, <% }%>]
		    }]
		});
		</script>
			<% } %>
	<%if(request.getAttribute("dsThangTaiNanPhanTram") != null) { %>	
		<script type="text/javascript">
			Highcharts.chart('bieudohinhtron', {
			    chart: {
			        type: 'pie',
			        options3d: {
			            enabled: true,
			            alpha: 45,
			            beta: 0
			        }
			    },
			    title: {
			        text: 'THỐNG KÊ TÌNH HÌNH BỒI THƯỜNG TAI NẠN (%)'
			    },
			    tooltip: {
			        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			    },
			    plotOptions: {
			        pie: {
			            allowPointSelect: true,
			            cursor: 'pointer',
			            depth: 35,
			            dataLabels: {
			                enabled: true,
			                format: '{point.name}'
			            }
			        }
			    },
			    series: [{
			        type: 'pie',
			        name: 'Browser share',
			        data: [ <% for(int i = 0; i < dsThangPhanTram.size(); i++) {%>['<%=dsThangPhanTram.get(i).getThang() %>', <%=dsThangPhanTram.get(i).getPhantram() %>], <% }%> ]
			    }]
			});
		</script>
	<% } %>
	<!-- Director for demo purposes -->
</body>
</html>