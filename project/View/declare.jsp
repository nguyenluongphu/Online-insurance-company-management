<%@page import="model.bean.PhieuMuaBaoHiemBEAN"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.TaiKhoanBEAN"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon shortcut" href="icon/logo.png">
<title>Bán bảo hiểm trực tuyến</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="Groovy Apparel a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Meta-Tags -->
    <style> 
         body::-webkit-scrollbar {
            width: 6px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        }
         body::-webkit-scrollbar-thumb {
          background-color: #C41228;
        }
    </style>
<!-- Custom-StyleSheet-Links -->
<!-- Bootstrap-CSS -->     <link rel="stylesheet" href="css/bootstrap.css"                  type="text/css" media="all">
<!-- Index-Page-CSS -->    <link rel="stylesheet" href="css/style.css"                      type="text/css" media="all">
<!-- Header-Slider-CSS --> <link rel="stylesheet" href="css/fluid_dg.css" id="fluid_dg-css" type="text/css" media="all">
<!-- //Custom-StyleSheet-Links -->

<!-- Fonts -->
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Noto+Serif:400,700"     type="text/css" media="all">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Montserrat:400,700"     type="text/css" media="all">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:100,300,400,500" type="text/css" media="all">
<!-- //Fonts -->

<!-- Font-Awesome-File-Links -->
<!-- CSS --> <link rel="stylesheet" href="css/font-awesome.css"          type="text/css" media="all">
<!-- TTF --> <link rel="stylesheet" href="fonts/fontawesome-webfont.ttf" type="text/css" media="all">
<!-- //Font-Awesome-File-Links -->

<!-- Supportive-Modernizr-JavaScript --><script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>

<!-- Default-JavaScript --><script src="js/jquery-2.2.3.js"></script>



</head>

<script type="text/javascript">
             
             function validateVehicleNumber() {
                 var a = document.getElementById("VehicleNumber").value;
                 if (a != 'Chọn biển số xe') {
                     document.getElementById("errorVehicleNumber").innerHTML="";
                     return true;
                 }
                 else {
                     document.getElementById("errorVehicleNumber").innerHTML="Vui lòng chọn biển số xe hoặc mua bảo hiểm trước !";
                     return false;
                 }
             }
             
             function validateDayAccident() {
                 var a = document.getElementById("DayAccident").value;
                 if (a != '') {
                     document.getElementById("errorDayAccident").innerHTML="";
                     return true;
                 }
                 else {
                     document.getElementById("errorDayAccident").innerHTML="Vui lòng chọn ngày xảy ra tai nạn !";
                     return false;
                 }
             }
             
            
            function validateNameDriver() {
                var a = document.getElementById("NameDriver").value;
                if (a != '') {
                    document.getElementById("errorNameDriver").innerHTML="";
                    return true;
                }
                else {
                    document.getElementById("errorNameDriver").innerHTML="Vui lòng nhập tên tài xế !";
                    return false;
                }
            }
            
            function validateLicense() {
                var a = document.getElementById("License").value;
                if (a != 'Chọn đã có bằng lái xe chưa') {
                    document.getElementById("errorLicense").innerHTML="";
                    return true;
                }
                else {
                    document.getElementById("errorLicense").innerHTML="Vui lòng chọn đã có bằng lái xe chưa !";
                    return false;
                }
            }
            
            function validateAddressAccident() {
                var a = document.getElementById("AddressAccident").value;
                if (a != '') {
                    document.getElementById("errorAddressAccident").innerHTML="";
                    return true;
                }
                else {
                    document.getElementById("errorAddressAccident").innerHTML="Vui lòng nhập địa chỉ tai nạn !";
                    return false;
                }
            }
            
            function validateDescribe() {
                var a = document.getElementById("Describe").value;
                if (a != '') {
                    document.getElementById("errorDescribe").innerHTML="";
                    return true;
                }
                else {
                    document.getElementById("errorDescribe").innerHTML="Vui lòng nhập mô tả thiệt hại !";
                    return false;
                }
            }
            
            function validateDayAccident2() {
                var a = $('#DayAccident').val();
                //ngày sinh được nhập
                var comp = a.split('-');
                var y = parseInt(comp[0], 10);
                var m = parseInt(comp[1], 10);
                var d = parseInt(comp[2], 10);
                
                //ngày sinh tự có
                var d1 = new Date();
                var year = parseInt(d1.getFullYear());
                var month = d1.getMonth() + 1;  
                var day = d1.getDate();
                
                if (y > 1900) {
                	 if(y <= year){
                		 if(y == year){
                			 if(m <= month){
                                 if(m == month){
                                     if(d <= day){
                                            document.getElementById("errorDayAccident").innerHTML="";
                                            return true;
                                     }else{
                                            document.getElementById("errorDayAccident").innerHTML="Ngày tai nạn không hợp lệ !";
                                            return false;
                                     }
                                 } else {
                                	 document.getElementById("errorDayAccident").innerHTML="";
                                     return true;
                                 }
                             } else{
                                 document.getElementById("errorDayAccident").innerHTML="Ngày tai nạn không hợp lệ !";
                                 return false;
                             }
                		 } else {
                             document.getElementById("errorDayAccident").innerHTML="";
                             return true;
                         }
                	}else{
                		document.getElementById("errorDayAccident").innerHTML="Ngày tai nạn không hợp lệ !";
                        return false;
                	} 
                } else {
                    document.getElementById("errorDayAccident").innerHTML="Ngày tai nạn không hợp lệ !";
                    return false;
                }
            }



            
             function CheckValidate(){
            	 if(!validateVehicleNumber() && !validateDayAccident() && !validateDayAccident2() && !validateNameDriver() && !validateLicense() && !validateAddressAccident() && !validateDescribe()){
            		 return false;
            	 }
                 if(!validateVehicleNumber()){
                     return false;
                 }
                 if(!validateDayAccident()){
                     return false;
                 }
                 if(!validateDayAccident2()){
                     return false;
                 }
                 if(!validateNameDriver()){
                     return false;
                 }
                 if(!validateLicense()){
                     return false;
                 }
                 if(!validateAddressAccident()){
                     return false;
                 }
                 if(!validateDescribe()){
                     return false;
                 }
                 
             }

        </script>

<body style="background: #F5F5F5">

<%

        String tk = null;
        if(session.getAttribute("email") != null){
             tk = (String)session.getAttribute("email");
        }
        
        String vehicleNumber = "", dayAccident = "", nameDriver = "", addressAccident = "", describe = "";
        if(request.getParameter("VehicleNumber") != null){
            vehicleNumber = request.getParameter("VehicleNumber");
        }
        if(request.getParameter("DayAccident") != null){
            dayAccident = request.getParameter("DayAccident");
        }
        if(request.getParameter("NameDriver") != null){
            nameDriver = request.getParameter("NameDriver");
        }
        if(request.getParameter("AddressAccident") != null){
            addressAccident = request.getParameter("AddressAccident");
        }
        if(request.getParameter("Describe") != null){
            describe = request.getParameter("Describe");
        }
        

%>

    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="slide.jsp"></jsp:include>
    
    <div class="clearfix"></div>
    
    <div class="wthreeaddressaits">
        <div class="container">
            <h2 style="margin-top: -100px; font-weight: bold;">KHAI BÁO TAI NẠN</h2>
            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid1">
            </div>

            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid2">
                <form action="HoSoTaiNanServlet" method="post">
                    <div style="float: left; width: 95%">
                    <span style="color: red" id="errorVehicleNumber"></span> 
                    	<select id="VehicleNumber" name="VehicleNumber" class="form-control selectpicker" style="background: #000; color: #fff;border-radius: 0px ; height: 43px;margin-bottom:10px ; font-size: 13px; border: 1px solid #000">
                   		  <option value="Chọn biển số xe">Chọn biển số xe của bạn</option>
                     	<%
                                    ArrayList<PhieuMuaBaoHiemBEAN> list = (ArrayList<PhieuMuaBaoHiemBEAN>)request.getAttribute("ListPhieuMuaBaoHiem");
                                    if(request.getAttribute("ListPhieuMuaBaoHiem") != null){
                                        for(PhieuMuaBaoHiemBEAN pmbh : list){
                          %>
                    	<%-- <input id="VehicleNumber" type="text" class="text" name="VehicleNumber" placeholder="Biển số" value="<%=vehicleNumber %>"> --%>
                          <option value="<%=pmbh.getBienSo() %>"><%=pmbh.getBienSo() %></option>
                          <%
                                        }
                                    }
                          %>
                    </select>
                    
                    </div>
                    <div style="float: right; width: 5%">
                    	<span style="color: red; float: right; font-size: 20px;margin-top: 8px">*</span> 
                    </div>
                    <div style="float: left; width: 95%">
                    <span style="color: red" id="errorDayAccident"></span> 
                    	<input id="DayAccident" type="date" class="text" name="DayAccident" placeholder="Ngày xảy ra tai nạn" value="<%=dayAccident %>" style="width: 100%; height: 40px; background: #000; color: #fff; border: 1px solid #000">
                     </div>
                    <div style="float: right; width: 5%">
                    	<span style="color: red; float: right; font-size: 20px;margin-top: 8px">*</span> 
                    </div>
                    <br>
                    <div style="float: left; width: 95%">
                    <span style="color: red" id="errorNameDriver"></span> 
                    	<input id="NameDriver" type="text" class="text" name="NameDriver" placeholder="Tên tài xế" value="<%=nameDriver %>">
                    </div>
                    <div style="float: right; width: 5%">
                    	<span style="color: red; float: right; font-size: 20px;margin-top: 8px">*</span> 
                    </div>
                     <div style="float: left; width: 95%">
                     <span style="color: red" id="errorLicense"></span> 
                     <select id="License" name="License" class="form-control selectpicker" style="background: #000; color: #fff;border-radius: 0px ; height: 43px; font-size: 13px; border: 1px solid #000">
                          <option value="Chọn đã có bằng lái xe chưa">Chọn đã có bằng lái xe chưa</option>
                          <option value="Có">Có</option>
                          <option value="Chưa" >Chưa</option>
                    </select>
                    </div>
                    <div style="float: right; width: 5%">
                    	<span style="color: red; float: right; font-size: 20px;margin-top: 8px">*</span> 
                    </div>
                    <span style="color: red" id="errorAddressAccident"></span> 
                    <div style="float: left; width: 95%">
                    	<input id="AddressAccident" type="text" class="text" name="AddressAccident" placeholder="Địa điểm tai nạn" value="<%=addressAccident %>" style="margin-top: 10px">
                    </div>
                    <div style="float: right; width: 5%">
                    	<span style="color: red; float: right; font-size: 20px;margin-top: 17px">*</span> 
                    </div>
                    <div style="float: left; width: 95%">
                    <span style="color: red" id="errorDescribe"></span> 
                    <textarea id="Describe" name="Describe" class="text" placeholder="Mô tả thiệt hại" ><%=describe %></textarea>
                    </div>
                    <div style="float: right; width: 5%">
                    	<span style="color: red; float: right; font-size: 20px;margin-top: 35px">*</span> 
                    </div>
                     <%
                        if (tk != null) {
                    %>
                    <input type="hidden" value="<%=tk %>" name="User">
                    <%
                            }
                    %>
                    <input type="hidden" class="text" name="Email" placeholder="" value="<%=tk %>">
                    <input type="hidden" value="sendInfo" name="type">
                    <div style="float: left; width: 95%">
                    <input type="submit" value="Gửi thông tin" onclick="return CheckValidate()">
                    </div>
                </form>
            </div>
             <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid1">

            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //Contact -->

    <jsp:include page="subcribe.jsp"></jsp:include>
    
    
    <jsp:include page="footerindex.jsp"></jsp:include>
</body>


  <jsp:include page="script.jsp"></jsp:include>


</html>