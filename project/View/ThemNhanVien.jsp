<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Thêm Nhân Viên</title>
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
        <jsp:include page="LeftDasboard.jsp"></jsp:include>
		 <aside class="right-side">
                <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                      <!-- <div class="backg">
                      	
                      </div> -->
                      <section class="panel tasks-widget">
                        <div class="box-add">
                           	<header class="panel-heading" >
                               <h4>Thêm Nhân Viên</h4>
                           </header>
                           <c:if test="${result  != null}">
	                       	<div  id="result">
	                       		<span>
	                       			${result}
	                       		</span>	
	                       	</div>
	                      </c:if>
                           <div class="panel-body">
                           	<form action="ThemNhanVienServlet" id="form" method="POST" class="form-horizontal tasi-form" role = "form">
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Họ Tên:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	                                          <input type="text" class="form-control" name="txtHoTen" id="txtHoTen" required title ="Xin vui lòng nhập Họ Tên!" placeholder="Nhập tên ở đây!">
	                                      </div>
	                                      <span id ="errorhoten" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Ngày Sinh:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
	                                          <input type="Date" class="form-control" id="txtNgaySinh" name="txtNgaySinh" required title ="Xin vui lòng nhập vị trí!" placeholder="Chọn ngày sinh!">
	                                      </div>
	                                      <span id ="errorngaySinh" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Giới Tính:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group">
	                                          <label class="radio-inline"><input type="radio" checked="checked" name="rdGioiTinh" value= "Nam">Nam</label>
	                                          <label class="radio-inline"><input type="radio" name="rdGioiTinh" value="Nữ">Nữ</label>
	                                      </div>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Điện Thoại:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
	                                          <input type="text" class="form-control" id ="txtSDT" name="txtSDT" required title ="Xin vui lòng nhập số điện thoại!" placeholder="Nhập số điện thoại">
	                                      </div>
	                                       <span id ="errorsdt" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Email:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
	                                          <input type="email" class="form-control" id="txtEmail" name="txtEmail" required title ="Xin vui lòng nhập email!" placeholder="Nhập email">
	                                      </div>
	                                      <span id ="error" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">CMND:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	                                          <input type="text" class="form-control" id="txtCMND" name="txtCMND" required title ="Xin vui lòng nhập CMND!" placeholder="Nhập CMND!">
	                                      </div>
	                                      <span id ="errorcmnd" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Địa Chỉ:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-flag"></i></span>
	                                          <input type="text" class="form-control" id="txtDiaChi" name="txtDiaChi" required title ="Xin vui lòng nhập địa chỉ!" placeholder="Nhập địa chỉ">
	                                      </div>
	                                      <span id ="errordiachi" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Số Tài Khoản:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
	                                          <input type="text" class="form-control" id="txtSoTaiKhoan" name="txtSoTaiKhoan" required title ="Xin vui lòng nhập số tài khoản!" placeholder="Nhập số tài khoản">
	                                      </div>
	                                      <span id ="errorsotaikhoan" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Ngân Hàng:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-tower"></i></span>
	                                          <input type="text" class="form-control" name="txtNganHang" required title ="Xin vui lòng nhập ngân hàng!" placeholder="nhập ngân hàng">
	                                      </div>
	                                  </div>
	                              </div>
	                              
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Chức Vụ:</label>
	                                  <div class="col-sm-8"> 
	                                  	<div class="input-group m-b-8">
		                                  	<span class="input-group-addon"><i class="glyphicon glyphicon-briefcase"></i></span>
		                                     <select class="form-control" name="cbMaChucVu">
		                                     	<c:forEach items="${dsChucVu }" var = "cv">
		                                     		<option value='${cv.getMaChucVu() }'>${cv.getTenChucVu()}</option>
		                                     	</c:forEach>
		                                    </select>
	                                    </div>
	                                 </div>
	                                 <span id="error">*</span>
	                              </div>
	                              
	                               
	                              <div class="form-group">
	                                  <label class="col-sm-3 control-label col-lg-3">Mật Khẩu:</label>
	                                  <div class="col-lg-8">
	                                      <div class="input-group m-b-8">
	                                          <span class="input-group-addon"><i class="glyphicon glyphicon-tower"></i></span>
	                                          <input type="password" class="form-control" id="txtMatKhau" name="txtMatKhau" required title ="Xin vui lòng nhập mật khẩu!" placeholder="nhập mật khẩu">
	                                      </div>
	                                      <span id ="errormatkhau" style="display: inline; color: red;"></span>
	                                  </div>
	                                  <span id="error">*</span>
	                              </div>
	                              
	                              <div class="form-group"> 
       							    <div class="col-sm-offset-3 col-sm-9">
       							      <button type="submit" id ="btnSubmit" onclick="return checkvalidate()" class="btn btn-success"><span><i class="glyphicon glyphicon-plus-sign"></i></span> Thêm</button>
       							      <a href="AdminServlet"><button type="button" class="btn btn-primary"><span><i class="glyphicon glyphicon-arrow-left"></i></span> Quay Lại</button></a>
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
	    if(a == ""){
	    	document.getElementById("error").innerHTML="* Bạn chưa nhập email!"
		        return false;
	    } else {
	    	if (filter.test(a)) {
		    	document.getElementById("error").innerHTML="";
		        return true;
		    }
		    else {
		    	document.getElementById("error").innerHTML="* Email không hợp lệ !"
		        return false;
		    }
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
	    } else {
	    	document.getElementById("errorsdt").innerHTML="* Bạn chưa nhập số điện thoại !"
            	flag = false;
	    }
	    return flag;
	    
	    
	}
	
	//check năm sinh
	function validateNgaySinh() {
		var a = $('#txtNgaySinh').val();
		//ngày sinh được nhập
		var comp = a.split('-');
		var y = parseInt(comp[0], 10);
	    var m = parseInt(comp[1], 10);
	    var d = parseInt(comp[2], 10);
	    
	    //ngày sinh tự có
	    var d1 = new Date();
	    var year = parseInt(d1.getFullYear());
	    var month = d1.getMonth();
	    var day = d1.getDate();
	    
	    if (y < year && y > 1900) {
	    	var rs = year - y;
	    	if(rs >= 18){
	    		document.getElementById("errorngaySinh").innerHTML="";
		        return true;
	    	} else {
		    	document.getElementById("errorngaySinh").innerHTML="* Nhân viên chưa đủ 18 tuổi!"
		        return false;
		    }
   		}
	    else {
	    	document.getElementById("errorngaySinh").innerHTML="* Năm Sinh phải < năm hiện tại và phải > 1900!"
	        return false;
	    }
	}
	
	//check cmnd
	function validateCMND() {
		var a = document.getElementById("txtCMND").value;
		var filter = /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
	    if(a == ""){
	    	document.getElementById("errorcmnd").innerHTML="* Bạn chưa nhập CMND!"
    	        return false;
	    } else {
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
	}
	
	function validateSoTaiKhoan() {
		var a = document.getElementById("txtSoTaiKhoan").value;
		var filter = /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
	    if(a == ""){
	    	document.getElementById("errorsotaikhoan").innerHTML="* Bạn chưa nhập số tài khoản!"
		        return false;
	    } else {
	    	if (filter.test(a)) {
		    	document.getElementById("errorsotaikhoan").innerHTML="";
		        return true;
		    }
		    else {
		    	document.getElementById("errorsotaikhoan").innerHTML="* Số tài khoản không hợp lệ !"
		        return false;
		    }
	    }
	}
	
	function validateHoTen() {
		var a = document.getElementById("txtHoTen").value;
	    if (a == "") {
	    	document.getElementById("errorhoten").innerHTML="* Bạn chưa nhập họ tên!"
		        return false;
	    }
	    else {
	    	document.getElementById("errorhoten").innerHTML="";
	        return true;
	    }
	}
	
	function validateDiaChi() {
		var a = document.getElementById("txtDiaChi").value;
	    if (a == "") {
	    	document.getElementById("errordiachi").innerHTML="* Bạn chưa nhập địa chỉ!"
		        return false;
	    }
	    else {
	    	document.getElementById("errordiachi").innerHTML="";
	        return true;
	    }
	}
	
	function validateMatKhau() {
		var a = document.getElementById("txtMatKhau").value;
	    if (a == "") {
	    	document.getElementById("errormatkhau").innerHTML="* Bạn chưa nhập mật khẩu!"
		        return false;
	    }
	    else {
	    	document.getElementById("errormatkhau").innerHTML="";
	        return true;
	    }
	}
	
	 function checkvalidate(){
		 
		 if(!validateSDT() && !validateEmail() && !validateCMND() && !validateSoTaiKhoan() && !validateNgaySinh() && !validateHoTen() && !validateDiaChi() && !validateMatKhau())
			 return false;
		 
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
		 if(!validateNgaySinh()){
			 return false;
		 }
		 if(!validateHoTen()){
			 return false;
		 }
		 if(!validateDiaChi()){
			 return false;
		 }
		 if(!validateMatKhau()){
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