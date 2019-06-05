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

<!-- Custom-StyleSheet-Links -->
<!-- Bootstrap-CSS -->     <link rel="stylesheet" href="css/bootstrap.css"                  type="text/css" media="all">
<!-- Index-Page-CSS -->    <link rel="stylesheet" href="css/style.css"                      type="text/css" media="all">
<!-- Header-Slider-CSS --> <link rel="stylesheet" href="css/fluid_dg.css" id="fluid_dg-css" type="text/css" media="all">
<!-- //Custom-StyleSheet-Links -->
    <style> 
         body::-webkit-scrollbar {
            width: 6px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        }
         body::-webkit-scrollbar-thumb {
          background-color: #C41228;
        }
    </style>
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

<script>
/*     $(document).ready(function(){
        $('#InsurranceType').on('change', function() {
            if ( this.value == 'Bảo hiểm xe ô tô' || this.value == 'Bảo hiểm vật chất')
            {
                $("#SeatingOto").show();
                $("#br").show();
            }
            else
            {
                $("#SeatingOto").hide();
                $("#br").hide();
            }
        });
    }); */

    function CountTime() {
        var money = document.getElementById("Money").value;
        var duration = document.getElementById("Duration").value;
        document.getElementById("VAT").innerHTML =  (((money*duration/12) * 0.1)*0.1).formatMoney(0, " ") + " đồng";
        document.getElementById("Sum").innerHTML =  (((money*duration/12) * 0.1) + (((money*duration/12) * 0.1))*0.1).formatMoney(0, " ") + " đồng";
    }
    
/*     function Charged() {
        var money = document.getElementById("Money").value;
        var duration = document.getElementById("Duration").value;
        document.getElementById("Sum").innerHTML =  (((money*duration/12) * 0.1) - 15000).formatMoney(0, " ") + " đồng";
    } */
    
    Number.prototype.formatMoney = function(places, symbol, thousand, decimal) {
        places = !isNaN(places = Math.abs(places)) ? places : 2;
        symbol = symbol !== undefined ? symbol : "$";
        thousand = thousand || ",";
        decimal = decimal || ".";
        var number = this, 
            negative = number < 0 ? "-" : "",
            i = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + "",
            j = (j = i.length) > 3 ? j % 3 : 0;
        return symbol + negative + (j ? i.substr(0, j) + thousand : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousand) + (places ? decimal + Math.abs(number - i).toFixed(places).slice(2) : "");
    };
    
    
    function validateVehicleNumber() {
        var a = document.getElementById("VehicleNumber").value;
        if (a != '') {
            document.getElementById("errorVehicleNumber").innerHTML="";
            return true;
        }
        else {
            document.getElementById("errorVehicleNumber").innerHTML="Vui lòng nhập biển số xe !";
            return false;
        }
    }
    
/*     function validateInsurranceType() {
        var a = document.getElementById("InsurranceType").value;
        if (a != 'Chọn loại bảo hiểm') {
            document.getElementById("errorInsurranceType").innerHTML="";
            return true;
        }
        else {
            document.getElementById("errorInsurranceType").innerHTML="Vui lòng chọn loại bảo hiểm !";
            return false;
        }
    } */
    
    function validateSeatingOto() {
        var a = document.getElementById("SeatingOto").value;
        if (a != 'Chọn số chỗ ngồi') {
            document.getElementById("errorSeatingOto").innerHTML="";
            return true;
        }
        else {
            document.getElementById("errorSeatingOto").innerHTML="Vui lòng chọn số chỗ ngồi !";
            return false;
        }
    }
    function validateDuration() {
        var a = document.getElementById("Duration").value;
        if (a != 'Chọn thời hạn') {
            document.getElementById("errorDuration").innerHTML="";
            return true;
        }
        else {
            document.getElementById("errorDuration").innerHTML="Vui lòng chọn thời hạn !";
            return false;
        }
    }
    
    function validateMoney() {
        var a = document.getElementById("Money").value;
        if (a != 'Chọn số tiền') {
            document.getElementById("errorMoney").innerHTML="";
            return true;
        }
        else {
            document.getElementById("errorMoney").innerHTML="Vui lòng chọn số tiền !";
            return false;
        }
    }

   
    function CheckValidate(){
    	 if(!validateVehicleNumber() && !validateSeatingOto() && !validateDuration() && !validateMoney() ){
             return false;
         }
        if(!validateVehicleNumber()){
            return false;
        }
        if(!validateInsurranceType()){
            return false;
        }
        if(!validateSeatingOto()){
            return false;
        }
        if(!validateDuration()){
            return false;
        }
        if(!validateMoney()){
            return false;
        }
        
    }
    

    // hàm lấy mã bảo hiểm để hiển thị lựa chọn loại bảo hiểm
    function getUrlParam(sParam)
    {
        var sPageURL = window.location.search.substring(1);
        var sURLVariables = sPageURL.split('&');
        for (var i = 0; i < sURLVariables.length; i++) 
        {
            var sParameterName = sURLVariables[i].split('=');
            if (sParameterName[0] == sParam) 
            {
                return sParameterName[1];
            }
        }
    }
    
    $(document).ready(function(){
        var m = getUrlParam('maBaoHiem');
        if(m === 'BH001'){
            $("#InsurranceType").val('Bảo hiểm TNDC Xe ô tô');
            $('#Duration').css('margin-top',10);
        }
        if(m === 'BH002'){
            $("#InsurranceType").val('Bảo hiểm TNDC Xe máy'); 
            $("#SeatingOto").hide();
            $('#Duration').css('margin-top',0);
        }
        if(m === 'BH003'){
            $("#InsurranceType").val('Bảo hiểm Vật chất Ô tô'); 
            $('#Duration').css('margin-top',10);
        }
        if(m === 'BH004'){
            $("#InsurranceType").val('Bảo hiểm Vật chất Xe máy'); 
            $("#SeatingOto").hide();
            $('#Duration').css('margin-top',0);
        }
        
    });
    
</script>

</head>
<%
    String tk = null;
    if(session.getAttribute("email") != null){
         tk = (String)session.getAttribute("email");
    }
    
    if(tk == null){
        response.sendRedirect("login.jsp");
    }
    String loaiBaoHiem = "";
    if(request.getAttribute("loaiBaoHiem") != null){
        loaiBaoHiem = (String)request.getAttribute("loaiBaoHiem");
    }
%>
<body style="background: #F5F5F5">
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="slide.jsp"></jsp:include>
    
    <div class="clearfix"></div>
    
    <div class="wthreeaddressaits">
        <div class="container">
            <h2 style="margin-top: -100px; font-weight: bold;">THÔNG TIN MUA BẢO HIỂM</h2>
            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid1">
            </div>

            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid2">
                <form action="PhieuMuaBaoHiemServlet" method="post">
                    <input type="hidden" class="text" name="IDInsurrance" placeholder="" value="<%=request.getParameter("maBaoHiem") %>" >
                    <input type="hidden" class="text" name="Email" placeholder="" value="<%=tk %>">
                    <!-- <input type="text" class="text" name="InsurranceType" placeholder="Loại bảo hiểm" id="InsurranceType" readonly="readonly" > -->
                  	<div style="float: left; width: 95%">
	                   <span style="color: red" id="errorInsurranceType"></span> 
	                   <input type="text" class="text" name="InsurranceType" placeholder="" value="<%=loaiBaoHiem %>" readonly="readonly">
                  	</div>
                  <!--   <select id="InsurranceType" name="InsurranceType" class="form-control selectpicker" disabled="disabled" style="background: #000; color: #fff;border-radius: 0px ; height: 43px; font-size: 13px; border: 1px solid #000">
                          <option value="Chọn loại bảo hiểm">Chọn loại bảo hiểm</option>
                          <option value="Bảo hiểm TNDC Xe ô tô">Bảo hiểm TNDC Xe ô tô</option>
                          <option value="Bảo hiểm TNDC Xe máy">Bảo hiểm TNDC Xe máy</option>
                          <option value="Bảo hiểm Vật chất Ô tô">Bảo hiểm Vật chất Ô tô</option>
                          <option value="Bảo hiểm Vật chất Xe máy">Bảo hiểm Vật chất Xe máy</option>
                    </select> -->
                    <div style="float: left; width: 95%">
	                    <span style="color: red" id="errorVehicleNumber"></span> 
	                    <input type="text" class="text" name="VehicleNumber" placeholder="Biển số" id="VehicleNumber"> 
                    </div>
                    <div style="float: right; width: 5%">
                    	<span style="color: red; float: right; font-size: 20px;margin-top: 8px">*</span> 
                    </div>
                    <div style="float: left; width: 95%">
	                    <span style="color: red" id="errorSeatingOto"></span> 
	                    <select id="SeatingOto" name="SeatingOto" class="form-control selectpicker"  style="background: #000; color: #fff;border-radius: 0px ; height: 43px; font-size: 13px; border: 1px solid #000">
	                          <option value="Chọn số chỗ ngồi" >Chọn số chỗ ngồi</option>
	                          <option value="Xe dưới 6 chỗ" >Xe dưới 6 chỗ</option>
	                          <option value="Xe từ 6 đến 11 chỗ">Xe từ 6 đến 11 chỗ</option>
	                          <option value="Xe từ 12 đến 24 chỗ">Xe từ 12 đến 24 chỗ</option>
	                          <option value="Xe trên 24 chỗ">Xe trên 24 chỗ</option>
	                    </select>
                    </div>
                    <div style="float: right; width: 5%">
                    	<span style="color: red; float: right; font-size: 20px;margin-top: 8px">*</span> 
                    </div>
                    <div style="float: left; width: 95%">
                    <span style="color: red" id="errorDuration"></span> 
                     <select id="Duration" name="Duration" class="form-control selectpicker" onchange="CountTime()" style="background: #000; color: #fff;border-radius: 0px ; height: 43px; font-size: 13px; border: 1px solid #000">
                          <option value="Chọn thời hạn" >Chọn thời hạn</option>
                          <option value="6" >6 tháng</option>
                          <option value="12" >1 năm</option>
                          <option value="24" >2 năm</option>
                          <option value="36" >3 năm</option>
                          <option value="64" >5 năm</option>
                    </select>
                    <br>
                    </div>
                    <div style="float: right; width: 5%">
                    	<span style="color: red; float: right; font-size: 20px;margin-top: 17px">*</span> 
                    </div>
                    <div style="float: left; width: 95%">
                    <span style="color: red" id="errorMoney"></span> 
                    <input type="text" class="text" id="Money" name="Money" placeholder="" value="<%=request.getParameter("money") %>" readonly="readonly" style="margin-top: -10px">
                  <!--    <select id="Money" name="Money" class="form-control selectpicker" onchange="Charged()" style="background: #000; color: #fff;border-radius: 0px ; height: 43px; font-size: 13px; margin-top: 10px; border: 1px solid #000">
                          <option value="Chọn số tiền" >Chọn số tiền</option>
                          <option value="1000000" >1 triệu đồng</option>
                          <option value="2000000" >2 triệu đồng</option>
                          <option value="3000000" >3 triệu đồng</option>
                          <option value="5000000" >5 triệu đồng</option>
                          <option value="10000000" >10 triệu đồng</option>
                    </select> -->
                    </div>
                     <input type="hidden" value="buy" name="type">
                     <div style="float: left; width: 95%">
                    	<input type="submit" value="Xác nhận mua" onclick="return CheckValidate()" style="margin-top: 0px">
                    </div>
                </form>
            </div>
             <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid1" style="width: 260px; float: right; margin-top: 150px; text-align: right;">
                    <h4>PHÍ VAT (10%)</h4>
                    <p id="VAT" style="font-weight: bold;"></p>
                    <hr>
                     <h4>TỔNG PHÍ THỰC THU</h4>
                    <p id="Sum" style="font-weight: bold;"></p>
                    
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