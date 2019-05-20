package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.DanhSachMuaBaoHiemBO;
import model.bo.PhieuMuaBaoHiemBO;

/**
 * Servlet implementation class XacNhanThanhToanPhieuMuaServlet
 */
@WebServlet("/XacNhanThanhToanPhieuMuaServlet")
public class XacNhanThanhToanPhieuMuaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XacNhanThanhToanPhieuMuaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    PhieuMuaBaoHiemBO phieuMuaBaoHiemBO = new PhieuMuaBaoHiemBO();
    DanhSachMuaBaoHiemBO danhSachMuaBaoHiemBO = new DanhSachMuaBaoHiemBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        
        if(session.getAttribute("user") != null){
            if(request.getParameter("idMaPhieuXacNhan") != null){
                String idPhieu = request.getParameter("idMaPhieuXacNhan");
                String maNhanVien = (String) session.getAttribute("user");
                String tinhTrangThanhToan = request.getParameter("tinhTrangThanhToan");
//                System.out.println(tinhTrangThanhToan);
                if(tinhTrangThanhToan.equals("Đang chờ xác nhận...")){
                    if(phieuMuaBaoHiemBO.capNhatNhanVienXacNhanThanhToan(idPhieu, maNhanVien)){
                        int pageid = 1; //mặc định pageid = 1
                        int  count = 10;
                        
                        
                        if(request.getParameter("pageid") != null)  // mới đầu chạy trang web lên chắc chắn stpageid chưa được dữ liệu
                        {
                            pageid = Integer.parseInt(request.getParameter("pageid")); 
                            request.setAttribute("numberpage", pageid);
                        }
                        
                        pageid = pageid - 1;
                        pageid = pageid * count;    // sẽ lấy tiếp 10 nhân viên tiếp theo  
                        
                        //đếm tổng số trang
                        request.setAttribute("sumpage", ((danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiem())/count));
                        request.setAttribute("dsKhachHang", danhSachMuaBaoHiemBO.getAllKhachHangMuaBaoHiem(pageid, count));
                        
                        request.setAttribute("tongSoPhieu", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiem());
                        request.setAttribute("phieuChuaThanhToan", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiemChuaThanhToan());
                        request.setAttribute("phieuDaThanhToan", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiemDaThanhToan());
                        request.setAttribute("phieuDaXacNhan", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiemDaXacNhanThanhToan());
                        RequestDispatcher req = request.getRequestDispatcher("DanhSachKhachHangMuaBaoHiemXacNhanAjax.jsp");
                        req.forward(request, response);
                    }
                } else {
                    int pageid = 1; //mặc định pageid = 1
                    int  count = 10;
                    
                    
                    if(request.getParameter("pageid") != null)  // mới đầu chạy trang web lên chắc chắn stpageid chưa được dữ liệu
                    {
                        pageid = Integer.parseInt(request.getParameter("pageid")); 
                        request.setAttribute("numberpage", pageid);
                    }
                    
                    pageid = pageid - 1;
                    pageid = pageid * count;    // sẽ lấy tiếp 10 nhân viên tiếp theo  
                    
                    //đếm tổng số trang
                    request.setAttribute("sumpage", ((danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiem())/count));
                    request.setAttribute("dsKhachHang", danhSachMuaBaoHiemBO.getAllKhachHangMuaBaoHiem(pageid, count));
                    request.setAttribute("result", "Khách hàng này chưa thanh toán!");
                    request.setAttribute("tongSoPhieu", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiem());
                    request.setAttribute("phieuChuaThanhToan", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiemChuaThanhToan());
                    request.setAttribute("phieuDaThanhToan", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiemDaThanhToan());
                    request.setAttribute("phieuDaXacNhan", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiemDaXacNhanThanhToan());
                    RequestDispatcher req = request.getRequestDispatcher("DanhSachKhachHangMuaBaoHiemXacNhanAjax.jsp");
                    req.forward(request, response);
                }
            }
            
            if(request.getParameter("idMaPhieuXoa") != null){
                String idPhieu = request.getParameter("idMaPhieuXoa");
                if(phieuMuaBaoHiemBO.xoaPhieuMua(idPhieu)){
                    int pageid = 1; //mặc định pageid = 1
                    int  count = 10;
                    
                    
                    if(request.getParameter("pageid") != null)  // mới đầu chạy trang web lên chắc chắn stpageid chưa được dữ liệu
                    {
                        pageid = Integer.parseInt(request.getParameter("pageid")); 
                        request.setAttribute("numberpage", pageid);
                    }
                    
                    pageid = pageid - 1;
                    pageid = pageid * count;    // sẽ lấy tiếp 10 nhân viên tiếp theo  
                    
                    //đếm tổng số trang
                    request.setAttribute("sumpage", ((danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiem())/count));
                    request.setAttribute("dsKhachHang", danhSachMuaBaoHiemBO.getAllKhachHangMuaBaoHiem(pageid, count));
                    
                    request.setAttribute("tongSoPhieu", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiem());
                    request.setAttribute("phieuChuaThanhToan", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiemChuaThanhToan());
                    request.setAttribute("phieuDaThanhToan", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiemDaThanhToan());
                    request.setAttribute("phieuDaXacNhan", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiemDaXacNhanThanhToan());
                    RequestDispatcher req = request.getRequestDispatcher("DanhSachKhachHangMuaBaoHiemXacNhanAjax.jsp");
                    req.forward(request, response);
                }
            }
        } else {
            RequestDispatcher req = request.getRequestDispatcher("LoginServlet");
            req.forward(request, response);
        }
	}

}
