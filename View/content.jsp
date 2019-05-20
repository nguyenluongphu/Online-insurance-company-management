<%@page import="java.text.NumberFormat"%>
<%@page import="model.bean.BaoHiemBEAN"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon shortcut" href="icon/logo.png">
<title>Bán bảo hiểm trực tuyến</title>
</head>
<body style="background: #F5F5F5">
       <%
            NumberFormat nf = NumberFormat.getInstance();
            nf.setMinimumIntegerDigits(0);
        %>
        <jsp:include page="slide.jsp"></jsp:include>
 
    <!-- Latest-Arrivals -->
    <div class="wthreehome-latest">
        <div class="container">

          <!-- Accessories -->
            <div class="w3laccessoriesaits" style="margin: -150px 0 -100px">
                <%
                    ArrayList<BaoHiemBEAN> list = (ArrayList<BaoHiemBEAN>)request.getAttribute("ListBaoHiem");
                    if(request.getAttribute("ListBaoHiem") != null){
                        for(BaoHiemBEAN bh : list){
                %>
                <div class="col-md-6 w3laccessoriesaits-grids w3laccessoriesaits-grids2" >
                    <div class="w3laccessoriesaits-grid w3laccessoriesaits-grid1">
                        <div class="grid">
                            <figure class="effect-apollo">
                                <img src="img/<%=bh.getAnh() %>" alt="Groovy Apparel" height="280">
                                <figcaption></figcaption>
                            </figure>
                        </div>
                        <h4 style="font-weight: bold;"><%=bh.getLoaiBaoHiem() %></h4><h5 style="margin-top: 7px; color: #C41228; display: inline; font-weight: bold;"><%=nf.format(bh.getMucDenBu()) %></h5><span> VND</span> 
                        <h5><a href=".<%=bh.getMaBaoHiem() %>" class="btn btn-default popup-with-zoom-anim" style="margin: 10px 0 20px"><i class="fa fa-eye"></i> Chi tiết...</a></h5>
                        
                        
                        <h6><a href="TrangChuServlet?maBaoHiem=<%=bh.getMaBaoHiem() %>&money=<%=bh.getMucDenBu() %>" >Đặt mua</a></h6>
                    </div>
                <div style="border-bottom: 50px solid #F5F5F5"></div>
                </div>
                
                <!-- Popup-Box -->
                <div id="popup1">
                    <div id="small-dialog3" class="mfp-hide <%=bh.getMaBaoHiem() %> ">
                        <div class="pop_up">
                                <h3>THÔNG TIN CHI TIẾT</h3>
                                <hr>
     							<p><%=bh.getMoTa() %></p>
                        </div>
                    </div>
                </div>
                <!-- //Popup-Box -->
                
                <%
                        }
                    }
                %>
        
            <div class="clearfix"></div>
            
           </div>

        </div>
    </div>
    <!-- //Latest-Arrivals -->


    <!-- Clearance-Sale -->
    <div class="aitsclearance-sales">
        <div class="aitsclearance-sales-text">
            <h2>TIN KHUYẾN MÃI</h2>
            <h4>CHIẾT KHẤU LỚN CHO NHỮNG KHÁCH HÀNG ĐĂNG KÝ MUA BẢO HIỂM TRỰC TUYẾN</h4>
            <h5>50% OFF <small>Tổng Công ty Cổ phần Bình An chính thức cho ra đời trang Website bán bảo hiểm trực tuyến dưới tên miền chính thức: https://baohiemtructuyen.vn, đây là một bước tiến vượt bậc của Bình An trong nỗ lực chăm sóc khách hàng một cách tốt hơn.
            Cũng nhân dịp này, đối với những khách hàng mua bảo hiểm trực tuyến của Bình An từ nay đến hết ngày 1/1/2018 sẽ được hưởng...</small></h5>
            <div class="wthreeshop-a">
                <a href="TrangChuServlet?guide=1">Xem thêm</a>
            </div>
        </div>
    </div>
    <!-- //Clearance-Sale -->



    <!-- Shopping -->
    <div class="agileshopping">
        <div class="container">

            <div class="agileshoppinggrids">
                <div class="col-md-4 agileshoppinggrid agileshoppinggrid1">
                    <div class="grid">
                        <figure class="effect-apollo">
                            <img src="img/oto2.jpg" alt="Groovy Apparel" height="250">
                            <figcaption></figcaption>
                        </figure>
                    </div>
                </div>
                <div class="col-md-4 agileshoppinggrid agileshoppinggrid2">
                    <div class="grid">
                        <figure class="effect-apollo">
                            <img src="img/moto2.jpg" alt="Groovy Apparel" height="250">
                            <figcaption></figcaption>
                        </figure>
                    </div>
                </div>
                <div class="col-md-4 agileshoppinggrid agileshoppinggrid2">
                    <div class="grid">
                        <figure class="effect-apollo">
                            <img src="img/moto-vatchat.jpg" alt="Groovy Apparel" height="250">
                            <figcaption></figcaption>
                        </figure>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>

            <div style="margin-left: 0px">
                <div>
                    <div class="col-md-4 " >
                        <h3>QUYỀN LỢI</h3>
                        <p>– Bảo hiểm chuyến: Có hiệu lực kể từ thời gian bắt đầu chuyến du lịch và kết thúc khi chuyến du lịch hoàn thành theo thời gian và tại địa điểm ghi trong hợp đồng</p>
                        <p>– Bảo hiểm tại khách sạn: có hiệu lực kể từ thời điểm người được bảo hiểm hoàn thành thủ tục nhận phòng tại khách sạn cho đến 12 giờ ngày kết thúc bảo hiểm ghi trong giấy chứng nhận bảo hiểm</p>
                        <p>– Bảo hiểm tại điểm: có hiệu lực kể từ khi người được bảo hiểm qua cửa kiểm soát vé để vào khu du lịch và kết thúc ngay khi ra cửa kiểm soát vé đó</p>
                    </div>
                    <div class="col-md-4">
                         <h3>BỒI THƯỜNG</h3>
                         <p>– Giấy đề nghị trả tiền bảo hiểm;</p>
                         <p>– Hợp đồng bảo hiểm và bản sao (trích) danh sách Người được bảo hiểm, hoặc Giấy chứng nhận bảo hiểm hoặc vé vào cửa có bảo hiểm của Người được bảo hiểm bị tai nạn;</p>
                         <p>– Biên bản tai nạn có xác nhận của cơ quan du lịch, chính quyền địa phương hoặc công an nơi Người được bảo hiểm bị tai nạn;</p>
                         <p>– Xác nhận điều trị của cơ quan y tế (giấy ra viện, phiếu điều trị và các giấy tờ liên quan đến việc điều trị tai nạn);</p>
                         <p>– Giấy chứng tử và giấy xác nhận quyền thừa kế hợp pháp (trường hợp chết).</p>
                         <p>– Trường hợp Người được bảo hiểm uỷ quyền cho người khác nhận tiền bảo hiểm, phải có giấy uỷ quyền hợp pháp.</p>
                    </div>
                      <div class="col-md-4">
                        <h3>TIỆN ÍCH</h3>
                         <p>– Tổng Công ty Cổ phần Bình An với mạng lưới công ty trải dài khắp toàn quốc luôn sẵn sàng phục vụ trong trường hợp quý khách hàng cần đến sự hỗ trợ của Bình An.</p>
                         <p>– Ngoài ra, quý khách hàng có thể liên lạc trực tiếp với Bình An thông qua số điện thoại: 1800.58.88.13</p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

        </div>
    </div>
    <!-- //Shopping -->



    <!-- Newsletter -->
    <div class="agileinfonewsl">

        <h3>THẮC MẮC VỀ GIẢM PHÍ TỰ ĐỘNG</h3>
        <p>Trước hết, tôi xin cảm ơn Quý khách đã quan tâm và tin dùng dịch vụ bảo hiểm của Bảo Minh. Tôi xin trả lời Quý khách như sau: việc tái tục bảo hiểm tại Bảo Minh được thực hiện tự động, theo đó trước khi kết thúc hiệu lực bảo hiểm 01 tháng, Bảo Minh sẽ gửi Thư thông báo tái tục tới khách hàng và có đính kèm Hợp đồng bảo hiểm dự kiến cho năm tới. Trong thời gian 01 tháng này, khách hàng có thể chủ động xem xét việc tái tục bảo hiểm để phù hợp với nhu cầu. Về “Tỷ lệ giảm phí do không tổn thất đối với bảo hiểm tự nguyện” được hiểu là tỷ lệ % trên phí bảo hiểm tự nguyện (chưa gồm thuế GTGT) mà Bảo Minh sẽ áp tự động cho khách hàng đối với các loại hình bảo hiểm tự nguyện cho xe tái tục bảo hiểm khi đến kỳ tái tục mà xe không bị tổn thất.</p>


    </div>
    <!-- //Newsletter -->
    
    
</body>
</html>