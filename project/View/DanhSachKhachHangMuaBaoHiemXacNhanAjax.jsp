<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Quản Lý Công Ty Bảo Hiểm | Admin</title>
</head>
<body class="skin-black">
	<div class="row">
                    <div class="col-md-12">
                     <c:if test="${result  != null}">
                       	<div  id="result">
                       		<span>
                       			${result}
                       		</span>	
                       	</div>
                      </c:if>
                      <section class="panel tasks-widget">
                         <header class="panel-heading">
                             <h4 id="tieude"><strong>Danh Sách Khách Hàng Đăng Ký Mua Bảo Hiểm</strong></h4>
                             <div id="timkiem">
                           		<form class="navbar-form navbar-left" method="post" action="TimKiemPhieuMuaBaoHiemServlet">
					      			<div class="input-group">
					        			<input type="text" class="form-control" id="txtTimKiem" name = "txtTimKiem"  placeholder="Search" name="search">
					        			<div class="input-group-btn">
							          		<button class="btn btn-default" type="submit">
							            	<i class="glyphicon glyphicon-search"></i>
							          		</button>
					        			</div>
					      			</div>
					    		</form>
                               </div>
                         </header>
                         <div class="panel-body">
						  <table class="table table-bordered table-hover">
						    <thead>
						      <tr>
						        <th>Mã Phiếu</th>
						        <th>Họ Tên</th>
						        <th>Loại Bảo Hiểm</th>
						        <th>Ngày Mua</th>
						        <th>Tình Trạng Thanh Toán</th>
						        <th>Nhân Viên Xác Nhận</th>
						        <th style="width: 19%;">Chức Năng</th>
						      </tr>
						    </thead>
						    <tbody>
						      <c:forEach items="${dsKhachHang }" var = "kh">
						      	<tr>
						        <td>${kh.getMaPhieuBaoHiem() }</td>
						        <td>${kh.getHoTen() }</td>
						        <td>${kh.getLoaiBaoHiem() }</td>
						        <td>${kh.getNgayMua() }</td>
						        <td>${kh.getTinhTrangThanhToan() }</td>
						        <td>${kh.getMaNhanVien() }</td>
						        <td style="width: 19%; padding-left: 1px; padding-right: 1px;">
						        	<div class="pull-right hidden-phone">
						        		<button class="btn btn-primary btn-xs"><i onclick="suaNhanVien('${kh.getMaPhieuBaoHiem()}')" class="fa fa-pencil"></i> Chi Tiết</button>
						        		<c:if test="${kh.getMaNhanVien() == null}">
						        			<button class="btn btn-danger btn-xs" onclick="xacNhan('${kh.getMaPhieuBaoHiem()}','${kh.getTinhTrangThanhToan() }')"><i class="fa fa-check"></i> Xác Nhận</button>
						        		</c:if>
						        		<c:if test="${kh.getMaNhanVien() != null}">
						        			<button class="btn btn-success btn-xs"><i class="fa fa-check"></i> Đã Xác Nhận</button>
						        		</c:if>
						        		
										<button class="btn btn-default btn-xs" onclick="Xoa('${kh.getMaPhieuBaoHiem()}')"><i class="fa fa-times"></i></button>
									</div>
								</td>
						      </tr>
						      </c:forEach>
						      
						    </tbody>
						  </table>
                          </div>
                          <!-- Phân trang -->
                          <div class="col-sm-12" style="text-align: center; max-width: 100%;">
						 	<ul class = "pagination">
						 		<li><a href = "DanhSachMuaBaoHiemServlet?pageid=${numberpage-1}">&laquo;</a></li>
					 			<li><a href = "DanhSachMuaBaoHiemServlet?pageid=1">1</a></li>
					 			<li><a href = "DanhSachMuaBaoHiemServlet?pageid=2">2</a></li>
					 			<li><a href = "DanhSachMuaBaoHiemServlet?pageid=3">3</a></li>
							   	<c:if test="${numberpage <= sumpage }">
							   		<li><a href = "DanhSachMuaBaoHiemServlet?pageid=${sumpage}">&raquo;</a></li>
							   	</c:if>
							</ul>
			 			</div>
                      </section>
                  </div>
              	</div>
</body>
</html>