<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Chi Tiết Hồ Sơ</title>
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
<link href="css/style-them-moi.css" rel="stylesheet" type="text/css" />
<!-- Morris chart -->
<link href="css/style2.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<style type="text/css">
	 .box-add{
	 	width: 90%;
	 	height: 100%;
	 }
	 #fileName{
	 	width: 40%;
	 	margin-right: 5px;
	 }
	 #btnSubmit{
	 	background: #FFA500;
	 	margin-right: 5px;
	 	position: inherit;
	 }
	 
	 #btnSubmit:hover{
	 	background: #FF7F00;
	 	box-shadow: 5px 5px 5px #666;
		-moz-box-shadow: 5px 5px 5px #666;
		-webkit-box-shadow: 5px 5px 5px #666;
		position: relative;
		color: white;
	 	
	 }
	 #btnQuayLai{
	 	margin-right: 5px;
	 	background: #00C5CD;
 	}
 	#btnQuayLai:hover{
 		background: #00868B;
 		color: white;
 		box-shadow: 5px 5px 5px #666;
		-moz-box-shadow: 5px 5px 5px #666;
		-webkit-box-shadow: 5px 5px 5px #666;
 	}
 	#tieude{
 		margin-left: 30px;
 	}
 	#btnHoanThanh{
 		width: 120px;
 		background: #00FF00
	}
	#btnHoanThanh:hover{
		background: #008B00;
		color: white;
		box-shadow: 5px 5px 5px #666;
		-moz-box-shadow: 5px 5px 5px #666;
		-webkit-box-shadow: 5px 5px 5px #666;
	}
	 .panel-heading{
	 	background: #B2B2E1;
	 }
	 #result{
	 	margin-top: 15px;
	 	}
	 #result > span{
	 	margin-top: 15px;
	 	color: red;
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
                <div class="row">
                    <div class="col-md-12">
                      <section class="panel tasks-widget">
                      	<div class="row">
					        <div class="col-md-12">
					          <ol class="breadcrumb" style="line-height: 35px; font-size: 130%; margin-top: 30px;">
					            <li><a href="#">Quản Lý Hồ Sơ</a></li>
					            <li><a href="#">Xác Thực Giám Định</a></li>
					            <li class="active">Tải Hình Ảnh Thực Tế</li>
					          </ol>
					        </div>
					      </div>
                        <div class="box-add">
                           	<header class="panel-heading" >
                               <h4>Tải Ảnh Thực Tế</h4>
                           </header>
                           <c:if test="${result  != null}">
	                       	<div  id="result">
	                       		<span>
	                       			${result}
	                       		</span>	
	                       	</div>
	                      </c:if>
                           <div class="panel-body">
                           	<form action=UpAnhXacThucHoSoServlet id="form" method="POST" class="form-horizontal tasi-form" enctype="multipart/form-data" onsubmit="">
	                              <div class="form-group">
	                                  <label class="col-sm-2 control-label col-lg-2" id="tieude">Ảnh Hiện Trường:</label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group col-sm-12">
	                                          <input  type="file" class="form-control col-sm-4" id="fileName" name="txtAnh">
		       							    	<button type="submit" id ="btnSubmit" class="btn col-sm-2"><span><i class="glyphicon glyphicon-upload"></i></span> Tải Lên</button>
		       							      	<a href="QuanLyHoSoServlet"><button type="button" class="btn col-sm-2" id="btnQuayLai"><span><i class="glyphicon glyphicon-arrow-left"></i></span> Quay Lại</button></a>
		       							      	<a href="XacThucHoanThanhServlet"><button type="button" name="btnHoanThanh" class="btn col-sm-2" id="btnHoanThanh"><span><i class="glyphicon glyphicon-ok"></i></span> Hoàn Thành</button></a>
	                                      </div>
	                                  </div>
	                              </div>
                            </form>
	                            <div class="col-sm-12" style="margin-top: 55px;">
	                            	<c:forEach items = "${dsAnh }" var =  "ds">
		                            <div id = "data">
									    <div class="col-md-6">
								      		<div class="thumbnail">
									          <img src="Anh/${ds.getPath()}" alt="Lights" style="width:100%">
								          	</div>
								      	</div>
							      	</div>
	                            </c:forEach>
                            </div>
                          </div>
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
	
	<script>
	 function upFile() {
   	  var xhttp = new XMLHttpRequest();
   	  var url="UpAnhXacThucHoSoServlet";
   	  xhttp.onreadystatechange = function() {
   	    if (this.readyState == 4 && this.status == 200) {
   	      var data = xhttp.responseText;
   	      document.getElementById("data").innerHTML=data;
   	      //alert("Bạn đã giám định hồ sơ này!");
   	    }
   	  };
   	  xhttp.open("POST",url, true);
   	  xhttp.send();
   	}
	</script>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
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