<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Thêm Bảo Hiểm</title>
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
	#error{
		color: red; 
		float: right; 
		margin-right: 35px; 
		margin-top: 10px; 
		font-size: 1.3em;
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
                        <div class="box-add">
                           	<header class="panel-heading" >
                               <h4>Thêm Bảo Hiểm</h4>
                           </header>
                           <c:if test="${result  != null}">
	                       	<div  id="result">
	                       		<span>
	                       			${result}
	                       		</span>	
	                       	</div>
	                      </c:if>
                           <div class="panel-body">
                           	<form action="ThemMoiBaoHiemServlet" id="form" method="POST" class="form-horizontal tasi-form" role = "form">
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Loại Bảo Hiểm:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-filter"></i></span>
	                                          <input type="text" class="form-control" name="txtLoaiBaoHiem" id="txtLoaiBaoHiem" placeholder="Nhập loại bảo hiểm">
	                                      </div>
	                                      <span id ="errorloai" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mức Đền Bù:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-filter"></i></span>
	                                          <input type="text" class="form-control" name="txtMucDenBu" id="txtMucDenBu" placeholder="Nhập mức đền bù!">
	                                      </div>
	                                      <span id ="errormucdenbu" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mô Tả:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-asterisk"></i></span>
	                                          <textarea class="form-control" name="txtMoTa" id="txtMoTa" placeholder="Nhập mô tả!"></textarea>
	                                      </div>
	                                      <span id ="errormota" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group"> 
       							    <div class="col-sm-offset-3 col-sm-9">
       							      <button type="submit" id ="btnSubmit" onclick="return checkvalidate()" class="btn btn-success"><span><i class="glyphicon glyphicon-plus-sign"></i></span> Thêm Ảnh</button>
       							      <a href="DanhSachBaoHiemServlet"><button type="button" class="btn btn-primary"><span><i class="glyphicon glyphicon-arrow-left"></i></span> Quay Lại</button></a>
       							    </div>
       							  </div>
                            </form>
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
	
	function validateLoaiBaoHiem() {
		var loai = document.getElementById("txtLoaiBaoHiem").value;
	    if (loai != "") {
	    	document.getElementById("errorloai").innerHTML="";
	        return true;
	    } else {
	    	document.getElementById("errorloai").innerHTML="* Loại bảo hiểm không để trống !"
	        return false;
	    }
	}
	
	function validateMucDenBu() {
		var value = document.getElementById("txtMucDenBu").value;
	    if (value != "") {
	    	if(isNaN(value)){
	    		document.getElementById("errormucdenbu").innerHTML="* Mức đền bù phải là số !"
	    	        return false;
	    	} else {
	    		document.getElementById("errormucdenbu").innerHTML="";
		        return true;
		    }
	    } else {
	    	document.getElementById("errormucdenbu").innerHTML="* Mức đền bù không để trống !"
	        return false;
	    }
	}
	
	function validateMoTa() {
		var mota = document.getElementById("txtMoTa").value;
	    if (mota != "") {
	    	document.getElementById("errormota").innerHTML="";
	        return true;
	    } else {
	    	document.getElementById("errormota").innerHTML="* Mô tả bảo hiểm không để trống !"
	        return false;
	    }
	}
	 function checkvalidate(){
		 if(!validateLoaiBaoHiem() && !validateMoTa() && !validateMucDenBu()){
			 return false;
		 }
		 
		 if(!validateLoaiBaoHiem()){
			 return false;
		 }
		 if(!validateMoTa()){
			 return false;
		 }
		 if(!validateMucDenBu()){
			 return false;
		 }
		 
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