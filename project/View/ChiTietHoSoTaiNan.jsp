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
                               <h4>Chi Tiết Hồ Sơ Bồi Thường Bảo Hiểm</h4>
                           </header>
                           <div class="panel-body">
                           	<form action="SuaNhanVienServlet?" id="form" method="POST" class="form-horizontal tasi-form" role = "form">
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mã Hồ Sơ:</label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group m-b-9">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getMaHoSo() }" name="id" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mã Nhân Viên:</label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group m-b-9">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getMaNhanVien() }" name="" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mã Khách Hàng:</label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group m-b-9">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getMaKhachHang() }" name="" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Biển Số:</label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group m-b-9">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getBienSo() }" name="" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Ngày Xảy Ra Tai Nạn:</label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group m-b-9">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="Date" readonly="readonly" class="form-control" value="${hs.getNgayXayRaTaiNan() }" name="" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Tên Tài Xế:</label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group m-b-9">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getTenTaiXe() }" id ="txtSDT" name="" required title ="" placeholder="">
	                                      </div>
	                                       <span id ="errorsdt" style="display: inline; color: red;"></span>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">MoTaThietHai: </label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group m-b-9">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <textarea class="form-control" readonly="readonly" id="txtCMND" name="" required title ="" placeholder="">${hs.getMoTaThietHai() }</textarea>
	                                      </div>
	                                      <span id ="errorcmnd" style="display: inline; color: red;"></span>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Có Bằng Lái Chưa:</label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group m-b-9">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getCoBangLaiChua() }" name="" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Địa Điểm Tai Nạn:</label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group m-b-9">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getDiaDiemTaiNan() }" id="txtSoTaiKhoan" name="" required title ="" placeholder="">
	                                      </div>
	                                      <span id ="errorsotaikhoan" style="display: inline; color: red;"></span>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mức Độ Thiệt Hại (%):</label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group m-b-9">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="number" readonly="readonly" class="form-control" value="${hs.getMucDoThietHai() }" name="" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mức Độ Đền Bù (%):</label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group m-b-9">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="number" readonly="readonly" class="form-control" value="${hs.getMucDoDenBu() }" name="" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Lý Do Không Đền Bù:</label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group m-b-9">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <textarea readonly="readonly" class="form-control" name="" required title ="" placeholder="">${hs.getLyDo()}</textarea>
	                                      </div>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Xác Nhận Đền Bù:</label>
	                                  <div class="col-lg-9">
	                                      <div class="input-group m-b-9">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
	                                          <input type="text" readonly="readonly" class="form-control" value="${hs.getXacNhanDenBu() }" name="" required title ="" placeholder="">
	                                      </div>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Ảnh Hiện Trường:</label>
	                                  <div class="col-lg-9">
	                                  	  <c:forEach items = "${dsAnh }" var =  "ds">
	                                  	  	<div class="input-group" style="display: inline; float: left; width: 50%;">
		                                         <div class="thumbnail" style="margin:0 auto; width: 100%; height: 100%; float: left;">
										          	<img src="Anh/${ds.getPath()}" alt="Lights" style="width:100%">
								          		</div>
	                                      </div>
	                                      </c:forEach>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group"> 
       							    <div class="col-sm-offset-3 col-sm-9">
       							      <a href="QuanLyHoSoServlet"><button type="button" class="btn btn-primary"><span><i class="glyphicon glyphicon-arrow-left"></i></span>Quay Lại</button></a>
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
	function validateEmail() {
		var a = document.getElementById("txtEmail").value;
	    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    if (filter.test(a)) {
	    	document.getElementById("error").innerHTML="";
	        return true;
	    }
	    else {
	    	document.getElementById("error").innerHTML="* Email không hợp lệ !"
	        return false;
	    }
	}
	
	function validateSDT() {
	    var flag = false;
	    var phone = $('#txtSDT').val().trim(); // ID của trường Số điện thoại
	    phone = phone.replace('(+84)', '0');
	    phone = phone.replace('+84', '0');
	    phone = phone.replace('0084', '0');
	    phone = phone.replace(/ /g, '');
	    if (phone != '') {
	        var firstNumber = phone.substring(0, 2);
	        if ((firstNumber == '09' || firstNumber == '08') && phone.length == 10) {
	            if (phone.match(/^\d{10}/)) {
	            	document.getElementById("errorsdt").innerHTML="";
	                flag = true;
	            } else {
	            	document.getElementById("errorsdt").innerHTML="* Số điện thoại không hợp lệ !"
	            	flag = false;
	            }
	        } else if (firstNumber == '01' && phone.length == 11) {
	            if (phone.match(/^\d{11}/)) {
	            	document.getElementById("errorsdt").innerHTML="";
	                flag = true;
	            } else {
	            	document.getElementById("errorsdt").innerHTML="* Số điện thoại không hợp lệ !"
	            	flag = false;
	            }
	        } else {
	            	document.getElementById("errorsdt").innerHTML="* Số điện thoại không hợp lệ !"
	            	flag = false;
	            }
	    }   
	    return flag;
	    
	    
	}
	
	function validateCMND() {
		var a = document.getElementById("txtCMND").value;
		var filter = /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
	    if (filter.test(a)) {
	    	if(a.length == 9){
	    		document.getElementById("errorcmnd").innerHTML="";
		        return true;
	    	} else {
	    		document.getElementById("errorcmnd").innerHTML="* CMND không hợp lệ !"
	    	        return false;
	    	}
	    	
	    }
	    else {
	    	document.getElementById("errorcmnd").innerHTML="* CMND không hợp lệ !"
	        return false;
	    }
	}
	
	function validateSoTaiKhoan() {
		var a = document.getElementById("txtSoTaiKhoan").value;
		var filter = /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
	    if (filter.test(a)) {
	    	document.getElementById("errorsotaikhoan").innerHTML="";
	        return true;
	    }
	    else {
	    	document.getElementById("errorsotaikhoan").innerHTML="* Số tài khoản không hợp lệ !"
	        return false;
	    }
	}
	 function checkvalidate(){
		 
		 if(!validateSDT()){
			 return false;
		 }
		 if(!validateEmail()){
			 return false;
		 }
		 if(!validateCMND()){
			 return false;
		 }
		 if(!validateSoTaiKhoan()){
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