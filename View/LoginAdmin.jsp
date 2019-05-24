<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login</title>
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
	html, body, .glass {
	    margin: 0;
	    width: 100%;
	    height: 100%;
	    overflow: hidden;
	    }
	.contai{
		background-image: url('img/backgroundadmin.jpg');
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
	.box-content{
		width: 100%;
		height: 100%;
		background: none;
	}
	.content-login{
		padding: 15px;
		background: #fff;
		border: 1px solid #F6FAF6;
	}
	.boxxx{
		
		display: block;
		width: 300px;
		height: 100%;
		max-height: 440px;
		margin: 0 auto;
		margin-top: 100px;
		position: relative;
	}
	.header{
		display: block;
		height: 50px;
		background: #C6D4F5;
		width: 100%;
		text-align: center;
		padding-top: 10px;
		padding-bottom: 10px;
		
	}
	.header >span{
		font-size: 1.5em;
		
		margin: 0 auto;
	}
	.btn-default{
		width: 100%;
	}
	#txtTenDangNhap:FOCUS{
		border:1px solid #808451;
		-moz-box-shadow:0 0 8px #808451;
		-webkit-box-shadow:0 0 15px #808451;
		box-shadow:0 0 15px #808451;
	}
	#pwd:FOCUS{
		border:1px solid #808451;
		-moz-box-shadow:0 0 8px #808451;
		-webkit-box-shadow:0 0 15px #808451;
		box-shadow:0 0 15px #808451;
	}
	.header-login{
		float: right;
		position: relative;
	}
	
	.header-login span > a{
		color: #fff;
		margin-right: 15px;
	}
	.header-login span > a:hover{
		color: red;
		transition: 1s;
	    -moz-transition: 1s;
	    -webkit-transition:1s;
	    -o-transition: 1s;
	    cursor: auto;
	}
	#foget-pass{
		display: inline;
		font-weight: normal;
		cursor: pointer;
		font-size: 14px;
		font-family: 'Lato', sans-serif;
    	-webkit-font-smoothing: antialiased;
    	line-height: 1.428571429;
    	margin-bottom: 15px;
	}
	#foget-pass > a{
		color: #333;
		margin-bottom: 15px;
	}
	
	#foget-pass > a:hover{
		color: blue;
		-moz-transition: 0.5s;
	    -webkit-transition:0.5s;
	    -o-transition: 0.5s;
	    cursor: pointer;
	}
	#btnDN{
		margin-top: 10px;
		border-radius: 50px;
		width: 100%;
		font-weight: bold;
	}
	#result{
		color: red;
		text-align: center;
		font-size: 14px;
	}
	#btnDN:hover {
	background: #FFA07A;
	-moz-transition: 0.5s;
    -webkit-transition:0.5s;
    -o-transition: 0.5s;
    cursor: pointer;
    color: #fff;
    box-shadow: 5px 5px 5px #666;
	-moz-box-shadow: 5px 5px 5px #666;
	-webkit-box-shadow: 5px 5px 5px #666;
	
	}
</style>
</head>
<body>
	<div class="contai">
		
	</div>
	<div class="header-login">
		<span><a href="TrangChuServlet"><span class="glyphicon glyphicon-arrow-left"></span> Trang Chủ</a></span>
	</div>
	<div class="boxxx">
 		<div class="header">
	 		<span>Login | Admin</span>
	 	</div>
		 <div class="content-login">
		 	<div style="text-align: center;"><span id="result">${result }</span></div>
		 	<form action="LoginServlet" method="post" style="margin-top: 15px;">
			    <div class="form-group">
			      <label for="taikhoan">Tên Đăng Nhập:</label>
			      <input type="text" class="form-control" id="txtTenDangNhap" value="${tk }" name= "txtTenDangNhap" placeholder="Enter Account" >
			     <span id ="errortk" style="display: inline; color: red;"></span>
			    </div>
			    <div class="form-group">
			      <label for="pwd">Mật Khẩu:</label>
			      <input type="password" class="form-control" id="pwd" value="${mk }" name = "txtMatKhau" placeholder="Enter password">
			    	<span id ="errormk" style="display: inline; color: red;"></span>
			    </div>
			    <div class="form-group">
			      <label for="pwd">Quyền:</label>
			      <select class="form-control" name="txtChucVu">
                   	<c:forEach items="${dsChucVu }" var = "cv">
                   		<option value='${cv.getMaChucVu() }'>${cv.getTenChucVu()}</option>
                   	</c:forEach>
                  </select>
			    </div>
			    <div class="checkbox">
			      <label><input type="checkbox" name="remember"> Nhớ Mật Khẩu</label>
			    </div>
		      	<label id="foget-pass"><a><i class="fa fa-key"></i> Bạn đã quên mật khẩu?</a></label>
		    	<button type="submit" onclick="return checkvalidate()" id="btnDN" class="btn">Đăng Nhập</button>
		  </form>
		 </div>
	</div>
	
	
	
	<script type="text/javascript">
		function validatetk()
	    {
	    	var value = document.getElementById("txtTenDangNhap").value;
	    	if (value == "") {
	    		document.getElementById("errortk").innerHTML="* Tên tài khoản không được để trống!";
			    return false;
	    		
		    }
		    else {
		    	document.getElementById("errortk").innerHTML="";
		        return true;
		    }  
	    }
		function validatemk()
	    {
	    	var value = document.getElementById("pwd").value;
	    	if (value == "") {
	    		document.getElementById("errormk").innerHTML="* Mật khẩu không được để trống!";
			    return false;
	    		
		    }
		    else {
		    	document.getElementById("errormk").innerHTML="";
		        return true;
		    }  
	    }
		
		function checkvalidate(){
			 if(!validatetk() && !validatemk())
				 return false;
			 
			 if(!validatetk()){
				 return false;
			 } 
			 
			 if(!validatemk()){
				 return false;
			 }
		 }
	</script>
</body>
</html>