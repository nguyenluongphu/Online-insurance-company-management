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
        <th style="width: 19%;">Chức Năng</th>
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
        <c:if test="${hs.getMaNhanVien() != null}">
       		<td>${hs.getMaNhanVien() }</td>
       	</c:if>
       	<c:if test="${hs.getMaNhanVien() == null}">
       		<td>Chưa Có</td>
       	</c:if>
        <td style="padding-left: 0px; width: 19%;">
        	<div class="pull-right hidden-phone">
        		<button class="btn btn-primary btn-xs" onclick="chiTietHoSo('${hs.getMaHoSo()}')"><i class="fa fa-eye"></i> Chi Tiết</button>
								        		
	       		<c:if test="${hs.getMaNhanVien() == null}">
	       			<button class="btn btn-danger btn-xs" onclick="giamDinh('${hs.getMaHoSo()}')"><i class="fa fa-anchor"></i> ${hs.getTrangThaiXacThuc()}</button>
	       		</c:if>
	       		<c:if test="${hs.getMaNhanVien() != null}">
	       			<c:if test="${hs.getTrangThaiXacThuc() == 'Xác Thực'}">
	       				<button class="btn btn-warning btn-xs" onclick="xacThuc('${hs.getMaHoSo()}')"><i class="fa fa-pencil"></i> ${hs.getTrangThaiXacThuc()}</button>
	       			</c:if>
	       			<c:if test="${hs.getTrangThaiXacThuc() == 'Đã Xác Thực'}">
	       				<button class="btn btn-success btn-xs"<%--  onclick="xacThuc('${hs.getMaHoSo()}')" --%>><i class="fa fa-check"></i> ${hs.getTrangThaiXacThuc()}</button>
	       			</c:if>
	       		</c:if>
	       		<!-- <button class="btn btn-danger btn-xs" onclick="giamDinh('${hs.getMaHoSo()}')">${hs.getTrangThaiXacThuc()}</button> -->
				<button class="btn btn-default btn-xs" onclick="Xoa('${hs.getMaHoSo()}')"><i class="fa fa-times"></i></button>
			</div>
		</td>
      </tr>
      </c:forEach>
      
    </tbody>
  </table>
</body>
</html>