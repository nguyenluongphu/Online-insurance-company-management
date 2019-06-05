<%@page import="model.bean.PhieuMuaBaoHiemBEAN"%>
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
        String tk = null;
        if(session.getAttribute("email") != null){
             tk = (String)session.getAttribute("email");
        }
        
        String tongTienThucThu = null;
        if(request.getAttribute("TongTienThucThu") != null){
            tongTienThucThu = (String)request.getAttribute("TongTienThucThu");
        }
        if(tk == null){
            response.sendRedirect("login.jsp");
        }
    
        NumberFormat nf = NumberFormat.getInstance();
        nf.setMinimumIntegerDigits(0);
        
        long SumMoney = 0;
    %>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="slide.jsp"></jsp:include>
    
    <div class="clearfix"></div>
    
    <div class="wthreeaddressaits">
        <div class="container">
            <h2 style="margin-top: -100px;font-weight: bold;">DANH SÁCH BẢO HIỂM</h2>

            <div class="col-md-12 ">
            

                  <table class="table table-dark table-hover">
                        <thead>
                            <tr>
                                <th>Biển số</th>
                                <th>Ngày mua</th>
                                <th>Tình trạng thanh toán</th>
                                <th>Loại bảo hiểm</th>
                                <th>Số chỗ ngồi</th>
                                <th>Mức đền bù</th>
                                <th>Thời hạn</th>
                                <th>Số tiền thực thu</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                                <%
                                    ArrayList<PhieuMuaBaoHiemBEAN> list = (ArrayList<PhieuMuaBaoHiemBEAN>)request.getAttribute("ListPhieuMuaBaoHiem");
                                    if(request.getAttribute("ListPhieuMuaBaoHiem") != null){
                                        for(PhieuMuaBaoHiemBEAN pmbh : list){
                                %>
                            <tr>
                                <td><%=pmbh.getBienSo() %></td>
                                <td><%=pmbh.getNgayMua() %></td>
                                <td><%=pmbh.getTinhTrangThanhToan() %></td>
                                <td><%=pmbh.getMaNhanVien() %></td> <!-- Loại bảo hiểm -->
                                <%if(pmbh.getSoChoNgoi().equals("Chọn số chỗ ngồi")){ %>
                                <td>Không có</td>
                                <%} else { %>
                                <td> <%=pmbh.getSoChoNgoi() %></td>
                               	<%} %>
                                <td><%=nf.format(Integer.parseInt(pmbh.getPhuongThucThanhToan())) %> VND</td>
                                <td><%=pmbh.getThoiHan() %> tháng</td>
                                <td><%=nf.format(pmbh.getSoTienThucThu()) %> VND</td>
                                <%if(pmbh.getTinhTrangThanhToan().equals("Chưa thanh toán")){ %>
                                	<td><a href="PhieuMuaBaoHiemServlet?maPhieuBaoHiem=<%=pmbh.getMaPhieuMuaBaoHiem() %>" onclick="return checkDelete();"><i class="fa fa-times"></i></a></td>
                                <%} %>
                            </tr>
                            
                            <%
                            SumMoney += pmbh.getSoTienThucThu();
                                        }
                                    }
                            %>

                        </tbody>
                    </table>
            </div>

            <div class="row">
                <div class="col-sm-8"></div>
                <div class="col-sm-4">
                    <h4 style="float: right;"><strong>Tổng tiền thực thu</strong></h4>
                    <br>
                    <p style="float: right;"><%=nf.format(Integer.parseInt(tongTienThucThu)) %> VND</p>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm-8"></div>
                <div class="col-sm-4">
                    <a href="payment.jsp?money=<%=tongTienThucThu %>"><input type="submit" value="Thanh toán"></a>
                </div>
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