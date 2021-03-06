<%@page import="java.text.NumberFormat"%>
<%@page import="model.bean.HoSoTaiNanBEAN"%>
<%@page import="java.util.ArrayList"%>
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
function checkDelete() {
    return confirm("Bạn có chắc chắn muốn xóa không ?");
}

</script>

</head>
<body style="background: #F5F5F5">
    <%
        NumberFormat nf = NumberFormat.getInstance();
        nf.setMinimumIntegerDigits(0);
        
        long SumMoney = 0;
        
        String tk = null;
        if(session.getAttribute("email") != null){
             tk = (String)session.getAttribute("email");
        }

        if(tk == null){
            response.sendRedirect("login.jsp");
        }
    %>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="slide.jsp"></jsp:include>
    
    <div class="clearfix"></div>
    
    <div class="wthreeaddressaits">
        <div class="container">
            <h2 style="margin-top: -100px;font-weight: bold;">DANH SÁCH KHAI BÁO TAI NẠN</h2>

            <div class="col-md-12 ">
            

                  <table class="table table-dark table-hover">
                        <thead>
                            <tr>
                                <th>Biển số</th>
                                <th>Ngày xảy ra tai nạn</th>
                                <th>Tên tài xế</th>
                                <th>Có bằng lái chưa</th>
                                <th>Địa điểm tai nạn</th>
                                <th>Mô tả thiệt hại</th>
                                <th>Số tiền đền bù</th>
                                <th>Xác nhận được đền bù</th>
                                <th>Lý do</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                                <%
                                    ArrayList<HoSoTaiNanBEAN> list = (ArrayList<HoSoTaiNanBEAN>)request.getAttribute("ListHoSoTaiNan");
                                    if(request.getAttribute("ListHoSoTaiNan") != null){
                                        for(HoSoTaiNanBEAN hstn : list){
                                %>
                            <tr>
                                <td><%=hstn.getBienSo() %></td>
                                <td><%=hstn.getNgayXayRaTaiNan() %></td>
                                <td><%=hstn.getTenTaiXe() %></td>
                                <td><%=hstn.getCoBangLaiChua() %></td>
                                <td><%=hstn.getDiaDiemTaiNan() %></td>
                                <td><%=hstn.getMoTaThietHai() %></td>
                                <td><%=nf.format(hstn.getMucDoDenBu()) %> VND</td>
                                
                                <%if(hstn.getXacNhanDenBu() == null){ %>
                                <td>Đang Chờ Xác Nhận...</td> 
                                <%} else { %>
                               	<td><%=hstn.getXacNhanDenBu() %></td>
                                <%} %>
                                 <%if(hstn.getXacNhanDenBu() == null){ %>
                                <td>Không</td> 
                                <%} else { %>
                                <td><%=hstn.getLyDo() %></td>
                                <%} %>
                                 <%if(hstn.getMaNhanVien() == null){ %>
                                 <td><a href="HoSoTaiNanServlet?maHoSo=<%=hstn.getMaHoSo() %>" onclick="return checkDelete();"><i class="fa fa-times"></i></a></td>
                                 <%} %>
                            </tr>
                            
                            <%
                            SumMoney += hstn.getMucDoDenBu();
                                        }
                                    }
                            %>

                        </tbody>
                    </table>
            </div>

            <div class="row">
                <div class="col-sm-8"></div>
                <div class="col-sm-4">
                    <h4 style="float: right;"><strong>Tổng tiền đền bù</strong></h4>
                    <br>
                    <p style="float: right;"><%=nf.format(SumMoney) %> VND</p>
                </div>
            </div>
            <br>

            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //Contact -->

    <jsp:include page="subcribe.jsp"></jsp:include>
    
    
    <jsp:include page="footerindex.jsp"></jsp:include>
</body>


  <jsp:include page="script.jsp"></jsp:include>


</html>