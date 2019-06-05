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

<script>
    $(document).ready(function(){
        $('#PaymentMethod').on('change', function() {
            if ( this.value == 'Chuyển khoản' )
            {
                $("#BankName").show();
                $("#AccountNumber").show();
                $("#StarBankName").show();
                $("#StarAccountNumber").show();
                $('#margin-top').css('margin-top',0);
            }
            else
            {
                $("#BankName").hide();
                $("#AccountNumber").hide();
                $("#StarBankName").hide();
                $("#StarAccountNumber").hide();
                $('#margin-top').css('margin-top',10);
            }
        });
    });

    
    function validatePaymentMethod() {
        var a = document.getElementById("PaymentMethod").value;
        if (a != 'Chọn phương thức thanh toán') {
            document.getElementById("errorPaymentMethod").innerHTML="";
            return true;
        }
        else {
            document.getElementById("errorPaymentMethod").innerHTML="Vui lòng chọn phương thức thanh toán !";
            return false;
        }
    }
    
    function validateTransfer() {
        var a = document.getElementById("PaymentMethod").value;
        var b = document.getElementById("BankName").value;
        var c = document.getElementById("AccountNumber").value;
        if (a == 'Chuyển khoản') {
        	if(b ==''){
        	    document.getElementById("errorBankName").innerHTML="Vui lòng nhập tên ngân hàng !";
                return false;
        	} else {
        		if(c != ''){
                    document.getElementById("errorAccountNumber").innerHTML="";
                    return true;
               } else {
                   document.getElementById("errorAccountNumber").innerHTML="Vui lòng nhập số tài khoản !";
                   return false;
               }
               document.getElementById("errorBankName").innerHTML="";
               return true;
            }
        }else{
        	 document.getElementById("errorAccountNumber").innerHTML="";
        	 document.getElementById("errorBankName").innerHTML="";
        	 return true;
        }
    }
    
    function CheckValidate(){
        if(!validatePaymentMethod()){
            return false;
        }
        if(!validateTransfer()){
            return false;
        }
    }
    
</script>
    <%
        String ChuaThanhToanError = "";
        if(request.getAttribute("ChuaThanhToanError") != null){
            ChuaThanhToanError = (String)request.getAttribute("ChuaThanhToanError");
        }
        String email = null;
        if(session.getAttribute("email") != null){
            email = (String)session.getAttribute("email");
        }
    %>
</head>
<body style="background: #F5F5F5">
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="slide.jsp"></jsp:include>
    
    <div class="clearfix"></div>
    
    <div class="wthreeaddressaits">
        <div class="container">
            <h2 style="margin-top: -100px; font-weight: bold;">THÔNG TIN THANH TOÁN</h2>
            <h4 style="color: red; margin-top: 20px"><%=ChuaThanhToanError %></h4> 
            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid1">
            </div>

            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid2">
                <form action="PhieuMuaBaoHiemServlet" method="post">
                <div style="float: left; width: 95%">
                    <span style="color: red" id="errorPaymentMethod"></span> 
                     <select id="PaymentMethod" name="PaymentMethod" class="form-control selectpicker" style="background: #000; color: #fff;border-radius: 0px ; height: 43px; font-size: 13px; border: 1px solid #000" >
                          <option value="Chọn phương thức thanh toán">Chọn phương thức thanh toán</option>
                          <option value="Thanh toán khi mua bảo hiểm">Thanh toán khi mua bảo hiểm</option>
                          <option value="Chuyển khoản" >Chuyển khoản</option>
                    </select>
                 </div>
                  <div style="float: right; width: 5%">
                  	<span style="color: red; float: right; font-size: 20px;margin-top: 8px">*</span> 
                  </div>
                   <div style="float: left; width: 95%">
                    <span style="color: red" id="errorBankName"></span> 
                    <input id="BankName" type="text" class="text" name="BankName" placeholder="Tên ngân hàng" style="margin-top: 10px" >
                 	</div>
                    <div style="float: right; width: 5%">
                    	<span id="StarBankName" style="color: red; float: right; font-size: 20px;margin-top: 17px">*</span> 
                    </div>   
                     <div style="float: left; width: 95%">
                    <span style="color: red" id="errorAccountNumber"></span> 
                    <input id="AccountNumber" type="text" class="text" name="AccountNumber" placeholder="Số tài khoản" >
                    </div>
                    <div style="float: right; width: 5%">
                    	<span id="StarAccountNumber" style="color: red; float: right; font-size: 20px;margin-top: 8px;">*</span> 
                    </div>
                    <input type="hidden" class="text" name="Email" placeholder="" value="<%=email %>">
                    <input type="hidden" class="text" name="Money" placeholder="" value="<%=request.getParameter("money") %>">
                     <input type="hidden" value="payment" name="type">
                      <div style="float: left; width: 95%">
	                    <input type="submit" value="Xác nhận thanh toán" onclick="return CheckValidate()" id="margin-top">
                  	</div>
                </form>
            </div>
             <div class="col-md-4s wthreeaddressaits-grid wthreeaddressaits-grid1" style="width: 260px; float: right; margin-top: 230px; text-align: right;">
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