<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
            <section id="mytable" class="content">
            	<div class="row" style="margin-bottom:5px;">
                    <div class="col-md-3">
                        <div class="sm-st clearfix">
                            <span class="sm-st-icon st-red"><i class="fa fa-ambulance"></i></span>
                            <div class="sm-st-info">
                                <span>${demBaoHiem }</span>
                                Tổng Số Bảo Hiểm
                            </div>
                        </div>
                    </div>
                     <div class="col-md-3">
                         <div class="sm-st clearfix">
                             <span class="sm-st-icon st-violet"><i class="fa fa-user"></i></span>
                             <div class="sm-st-info">
                                 <span>2</span>
                                 Tổng Số Bảo Hiểm Ôtô
                             </div>
                         </div>
                     </div>
                     <div class="col-md-3">
                         <div class="sm-st clearfix">
                             <span class="sm-st-icon st-blue"><i class="fa fa-check-square-o"></i></span>
                             <div class="sm-st-info">
                                 <span>2</span>
                                 Tổng Số Bảo Hiểm Xe Máy
                             </div>
                         </div>
                     </div>
                     <div class="col-md-3">
                         <div class="sm-st clearfix">
                             <span class="sm-st-icon st-green"><i class="fa fa-paperclip"></i></span>
                             <div class="sm-st-info">
                                 <span>4567</span>
                                 Total Documents
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
                                  <h4 id="tieude"><strong>Danh Sách Bảo Hiểm</strong></h4>
                                  <div id="timkiem">
                               		<form class="navbar-form navbar-left" method="post" action="TimKiemNhanVienServlet">
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
									        <th>Mã Bảo Hiểm</th>
									        <th>Loại Bảo Hiểm</th>
									        <th>Mô Tả</th>
									        <th>Ảnh</th>
									        <th class="col-sm-1">Chức Năng</th>
									      </tr>
									    </thead>
									    <tbody>
									      <c:forEach items="${dsBaoHiem }" var = "bh">
									      	<tr>
									        <td>${bh.getMaBaoHiem() }</td>
									        <td>${bh.getLoaiBaoHiem() }</td>
									        <td>${bh.getMoTa() }</td>
									        <td>${bh.getAnh() }</td>
									        <td class="col-sm-1" style="padding-left: 0px; ">
								        	<div class="pull-right hidden-phone">
								        		<button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button>
												<button class="btn btn-default btn-xs"><i onclick="suaBaoHiem('${bh.getMaBaoHiem()}')" class="fa fa-pencil"></i></button>
												<button class="btn btn-default btn-xs" onclick="Xoa('${bh.getMaBaoHiem()}')"><i class="fa fa-times"></i></button>
											</div>
										</td>
								      </tr>
								      </c:forEach>
								      
								    </tbody>
								  </table>
                              <div class=" add-task-row">
                                  <a class="btn btn-success btn-sm pull-left" href="ThemMoiBaoHiemServlet">Thêm Mới Bảo Hiểm</a>
                                  <a class="btn btn-default btn-sm pull-right" href="#">See All</a>
                              </div>
                          </div>
                          <!-- Phân trang -->
                          <div class="col-sm-12" style="text-align: center; max-width: 100%;">
						 	<ul class = "pagination">
							 	<c:if test="${numberpage > 1}">
							 		<li><a href = "DanhSachBaoHiemServlet?pageid=1">&laquo;</a></li>
							 	</c:if>
						 		<c:if test="${sumpage < 2}">
						 			<li><a href = "DanhSachBaoHiemServlet?pageid=1">1</a></li>
						 		</c:if>
							   	<c:if test="${sumpage < 3}">
							   		<li><a href = "DanhSachBaoHiemServlet?pageid=2">2</a></li>
							   	</c:if>
							   	<c:if test="${sumpage >= 3}">
							   		<c:if test="${numberpage > 1}">
							   			<li><a href = "DanhSachBaoHiemServlet?pageid=${numberpage-1}">${numberpage-1}</a></li>
							   		</c:if>
							   		<li><a href = "DanhSachBaoHiemServlet?pageid=${numberpage+1}">${numberpage+1}</a></li>
						  	 		<li><a href = "DanhSachBaoHiemServlet?pageid=${numberpage+3}">${numberpage+3}</a></li>
							   	</c:if>
						  	 	
							   	<c:if test="${numberpage < sumpage }">
							   		<li><a href = "DanhSachBaoHiemServlet?pageid=${sumpage}">&raquo;</a></li>
							   	</c:if>
							   
							</ul>
				 		</div>
                      </section>
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
			var result = confirm("Bạn có chắc chắn muốn xóa bảo hiểm này không?");
			if(result == true){
				XoaBaoHiem($id);
				//window.location = "XoaBaoHiemServlet?id="+$id;
			}
		}
		
		function suaBaoHiem($id){
			window.location = "SuaBaoHiemServlet?id="+$id;
		}
	</script>
	
	<script type="text/javascript">
		function result($info) {
			alert($info);
		}
	
		function XoaBaoHiem($id) {
      	  var xhttp = new XMLHttpRequest();
      	  var url="XoaBaoHiemServlet?id="+$id;
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