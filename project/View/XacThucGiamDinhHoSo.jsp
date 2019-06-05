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
	 	width: 70%;
	 }
 	.breadcrumb{
 		background-color: #f3f3f3;
		background: #f3f3f3; 
	 }
	 
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
                      	<div class="row">
					        <div class="col-md-12">
					          <ol class="breadcrumb" style="line-height: 35px; font-size: 130%; margin-top: 30px; background-color: #f3f3f3;">
					           <li><a href="#">Quản Lý Hồ Sơ</a></li>
					            <li class="active"><a href="#">Xác Thực Giám Định</a></li>
					          </ol>
					        </div>
					      </div>
                        <div class="box-add">
                           	<header class="panel-heading" >
                               <h4>Xác Thực Hồ Sơ Bồi Thường Bảo Hiểm</h4>
                           </header>
                           <div class="panel-body">
                           	<form action=XacThucGiamDinhHoSoServlet id="form" method="POST" class="form-horizontal tasi-form" role = "form">
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mã Hồ Sơ:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getMaHoSo() }" name="id" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mã Nhân Viên:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getMaNhanVien() }" name="" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mã Khách Hàng:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getMaKhachHang() }" name="" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Biển Số:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getBienSo() }" name="txtBienSo" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Ngày Xảy Ra Tai Nạn:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="Date" readonly="readonly" class="form-control" value="${hs.getNgayXayRaTaiNan() }" name="" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Tên Tài Xế:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getTenTaiXe() }" id ="" name="" required title ="" placeholder="">
	                                      </div>
	                                       <span id ="errorsdt" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mô Tả Thiệt Hại: </label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <textarea class="form-control" readonly="readonly" id="" name="" required title ="" placeholder="">${hs.getMoTaThietHai() }</textarea>
	                                      </div>
	                                      <span id ="errorcmnd" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Có Bằng Lái Chưa:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getCoBangLaiChua() }" name="" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Địa Điểm Tai Nạn:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getDiaDiemTaiNan() }" id="" name="" required title ="" placeholder="">
	                                      </div>
	                                      <span id ="errorsotaikhoan" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mức Độ Thiệt Hại (%):</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="number" class="form-control" min="0" name="txtMucDoThietHai" id="txtMucDoThietHai" value="${hs.getMucDoThietHai() }" required title ="" placeholder="Nhập mức độ thiệt hại!">
	                                      </div>
	                                      <span id ="errorMucDoThietHai" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mức Độ Đền Bù (%):</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="number"  class="form-control" min="0" value="${hs.getMucDoDenBu() }" name="txtMucDoDenBu" id="txtMucDoDenBu" required title ="" placeholder="Nhập mức độ đền bù!">
	                                      </div>
	                                      <span id ="errorMucDoDenBu" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Lý Do Không Đền Bù:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <textarea  class="form-control" name="txtLyDo" placeholder="Nhập lý do nếu có!">${hs.getLyDo() }</textarea>
	                                      </div>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Xác Nhận Đền Bù:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" class="form-control" value="${hs.getXacNhanDenBu() }" name="txtXacNhanDenBu" id="txtXacNhanDenBu" required title ="" placeholder="Nhập xác nhận đền bù!">
	                                      </div>
	                                      <span id ="errorXacNhanDenBu" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              <div class="form-group"> 
       							    <div class="col-sm-offset-3 col-sm-9">
       							    	<button type="submit" id ="btnSubmit" onclick="return checkvalidate()" class="btn btn-success"><span><i class="glyphicon glyphicon-arrow-right"></i></span> Tải Ảnh Lên</button>
       							      	<a href="QuanLyHoSoServlet"><button type="button" class="btn btn-primary"><span><i class="glyphicon glyphicon-arrow-left"></i></span>Quay Lại Không Cần Tải Ảnh</button></a>
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
	function validateMucDoThietHai()
    {
    	var value = document.getElementById("txtMucDoThietHai").value;
    	
    	if (value >= 0 && value <= 100) {
   			document.getElementById("errorMucDoThietHai").innerHTML="";
   	        return true;
	    }
	    else {
	    	document.getElementById("errorMucDoThietHai").innerHTML="* Mức độ thiệt hại >= 0% và <= 100%!"
	        return false;
	    }  
    }
	
	function validateXacNhanDenBu()
    {
    	var value = document.getElementById("txtXacNhanDenBu").value;
    	if (value == "") {
    		document.getElementById("errorXacNhanDenBu").innerHTML="* Bạn chưa nhập xác nhận đền bù!"
   	        return false;
	    }
	    else {
	    	if(value == "Không" || value == "Có"){
		    	document.getElementById("errorXacNhanDenBu").innerHTML="";
	   	        return true;
	    	} else {
	    		document.getElementById("errorXacNhanDenBu").innerHTML="* Xác nhận đền bù chỉ nhập Có hoặc Không!";
	   	        return false;
	    	}
	    }  
    }
	
	function validateMucDoDenBu()
    {
    	var value = document.getElementById("txtMucDoDenBu").value;
    	if (value >= 0 && value <= 100) {
	    	document.getElementById("errorMucDoDenBu").innerHTML="";
	        return true;
	    }
	    else {
	    	document.getElementById("errorMucDoDenBu").innerHTML="* Mức độ đền bù >= 0% và <= 100%!"
	        return false;
	    }  
    }
	 function checkvalidate(){
		 if(!validateMucDoThietHai() && !validateMucDoDenBu() && !validateXacNhanDenBu())
			 return false;
		 
		 if(!validateMucDoThietHai()){
			 return false;
		 } 
		 
		 if(!validateMucDoDenBu()){
			 return false;
		 }
		  if(!validateXacNhanDenBu()){
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