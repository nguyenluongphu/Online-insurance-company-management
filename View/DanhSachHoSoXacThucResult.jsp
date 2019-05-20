<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th>Mã Hồ Sơ</th>
        <th>Mã Khách Hàng</th>
        <th>Biển Số</th>
        <th>Ngày Tai Nạn</th>
        <th>Tên Tài Xế</th>
        <th>Nhân Viên QL</th>
        <th class="col-sm-2">Chức Năng</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${dsHoSo }" var = "hs">
      	<tr>
        <td>${hs.getMaHoSo() }</td>
        <td>${hs.getMaKhachHang() }</td>
        <td>${hs.getBienSo() }</td>
        <td>${hs.getNgayXayRaTaiNan() }</td>
        <td>${hs.getTenTaiXe() }</td>
       	<td>${hs.getMaNhanVien() }</td>
        <td class="col-sm-2" style="padding-left: 0px; ">
        	<div class="pull-right hidden-phone">
        		<button class="btn btn-primary btn-xs" onclick="chiTietHoSo('${hs.getMaHoSo()}')">Chi Tiết</button>
				<button class="btn btn-default btn-xs" onclick="daXacThuc()">Đã Xác Thực</button>
				<button class="btn btn-default btn-xs" onclick="Xoa('${hs.getMaHoSo()}')"><i class="fa fa-times"></i></button>
			</div>
		</td>
      </tr>
      </c:forEach>
      
    </tbody>
  </table>
</body>
</html>