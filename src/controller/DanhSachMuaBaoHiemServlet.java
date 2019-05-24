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

@WebServlet("/DanhSachMuaBaoHiemServlet")
public class DanhSachMuaBaoHiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DanhSachMuaBaoHiemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    DanhSachMuaBaoHiemBO danhSachMuaBaoHiemBO = new DanhSachMuaBaoHiemBO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        
        if(session.getAttribute("user") != null){
            //lấy tất cả các khách hàng
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
//            request.setAttribute("tongKH", khachHangBO.countKhachHang());
            
            RequestDispatcher req = request.getRequestDispatcher("DanhSachKhachHangMuaBaoHiem.jsp");
            req.forward(request, response);
        } else {
            RequestDispatcher req = request.getRequestDispatcher("LoginServlet");
            req.forward(request, response);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
