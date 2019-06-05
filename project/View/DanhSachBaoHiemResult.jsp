<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<section id="mytable" class="content">
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
                                  <h4 id="tieude"><strong>Danh Sách Bảo Hiểm</strong></h4>
                                  <div id="timkiem">
                               		<form class="navbar-form navbar-left" method="post" action="TimKiemNhanVienServlet">
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
									        <th>Mã Bảo Hiểm</th>
									        <th>Loại Bảo Hiểm</th>
									        <th>Mô Tả</th>
									        <th>Ảnh</th>
									        <th class="col-sm-1">Chức Năng</th>
									      </tr>
									    </thead>
									    <tbody>
									      <c:forEach items="${dsBaoHiem }" var = "bh">
									      	<tr>
									        <td>${bh.getMaBaoHiem() }</td>
									        <td>${bh.getLoaiBaoHiem() }</td>
									        <td>${bh.getMoTa() }</td>
									        <td>${bh.getAnh() }</td>
									        <td class="col-sm-1" style="padding-left: 0px; ">
								        	<div class="pull-right hidden-phone">
								        		<button class="btn btn-default btn-xs"><i class="fa fa-check"></i></button>
												<button class="btn btn-default btn-xs"><i onclick="suaBaoHiem('${bh.getMaBaoHiem()}')" class="fa fa-pencil"></i></button>
												<button class="btn btn-default btn-xs" onclick="Xoa('${bh.getMaBaoHiem()}')"><i class="fa fa-times"></i></button>
											</div>
										</td>
								      </tr>
								      </c:forEach>
								      
								    </tbody>
								  </table>
                              <div class=" add-task-row">
                                  <a class="btn btn-success btn-sm pull-left" href="ThemMoiBaoHiemServlet">Thêm Mới Bảo Hiểm</a>
                                  <a class="btn btn-default btn-sm pull-right" href="#">See All</a>
                              </div>
                          </div>
                          <!-- Phân trang -->
                          <div class="col-sm-12" style="text-align: center; max-width: 100%;">
						 	<ul class = "pagination">
							 	<c:if test="${numberpage > 1}">
							 		<li><a href = "DanhSachBaoHiemServlet?pageid=1">&laquo;</a></li>
							 	</c:if>
						 		<c:if test="${sumpage < 2}">
						 			<li><a href = "DanhSachBaoHiemServlet?pageid=1">1</a></li>
						 		</c:if>
							   	<c:if test="${sumpage < 3}">
							   		<li><a href = "DanhSachBaoHiemServlet?pageid=2">2</a></li>
							   	</c:if>
							   	<c:if test="${sumpage >= 3}">
							   		<c:if test="${numberpage > 1}">
							   			<li><a href = "DanhSachBaoHiemServlet?pageid=${numberpage-1}">${numberpage-1}</a></li>
							   		</c:if>
							   		<li><a href = "DanhSachBaoHiemServlet?pageid=${numberpage+1}">${numberpage+1}</a></li>
						  	 		<li><a href = "DanhSachBaoHiemServlet?pageid=${numberpage+3}">${numberpage+3}</a></li>
							   	</c:if>
						  	 	
							   	<c:if test="${numberpage < sumpage }">
							   		<li><a href = "DanhSachBaoHiemServlet?pageid=${sumpage}">&raquo;</a></li>
							   	</c:if>
							   
							</ul>
				 		</div>
                      </section>
                  </div>
              	</div>
              <!-- row end -->
              </section><!-- /.content -->
</body>
</html>