package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DanhSachMuaBaoHiemBEAN;
import model.bo.DanhSachMuaBaoHiemBO;

/**
 * Servlet implementation class TimKiemPhieuMuaBaoHiemServlet
 */
@WebServlet("/TimKiemPhieuMuaBaoHiemServlet")
public class TimKiemPhieuMuaBaoHiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimKiemPhieuMuaBaoHiemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	DanhSachMuaBaoHiemBO danhSachMuaBaoHiemBO = new DanhSachMuaBaoHiemBO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        
        if(session.getAttribute("user") != null) {
            String rs = "";
            rs = request.getParameter("txtTimKiem");
            session.setAttribute("rs", rs);
            if(session.getAttribute("rs").equals("")){
                RequestDispatcher rq = request.getRequestDispatcher("DanhSachMuaBaoHiemServlet");
                rq.forward(request, response);
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
                
                List<DanhSachMuaBaoHiemBEAN> ds = new ArrayList<DanhSachMuaBaoHiemBEAN>();
                ds = null;
                ds =  danhSachMuaBaoHiemBO.getAllPhieuMuaTimKiem(rs, pageid, count);
                //đếm tổng số trang
                if(ds == null || ds.size() == 0){
                    request.setAttribute("result", "Không tìm thấy nội dung");
                } else{
                    request.setAttribute("sumpage", ((danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiemTimKiem(rs))/count));
                    request.setAttribute("dsKhachHang", ds);
                }
                
                request.setAttribute("tongSoPhieu", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiem());
                request.setAttribute("phieuChuaThanhToan", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiemChuaThanhToan());
                request.setAttribute("phieuDaThanhToan", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiemDaThanhToan());
                request.setAttribute("phieuDaXacNhan", danhSachMuaBaoHiemBO.countKhachHangMuaBaoHiemDaXacNhanThanhToan());
//                request.setAttribute("tongKH", khachHangBO.countKhachHang());
                
                RequestDispatcher req = request.getRequestDispatcher("DanhSachKhachHangMuaBaoHiem.jsp");
                req.forward(request, response);
            } 
        } else {
            RequestDispatcher req = request.getRequestDispatcher("LoginServlet");
            req.forward(request, response);
        }
	}

}
