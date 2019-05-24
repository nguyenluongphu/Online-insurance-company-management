package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.HoSoTaiNanBO;
import model.bo.KhachHangBO;

@WebServlet("/AdminNhanVienServlet")
public class AdminNhanVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminNhanVienServlet() {
        super();
    }
    
    KhachHangBO khachHangBO = new KhachHangBO();
    HoSoTaiNanBO hoSoTaiNanBO = new HoSoTaiNanBO();
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
            request.setAttribute("sumpage", ((khachHangBO.countKhachHang())/count));
            request.setAttribute("dsKhachHang", khachHangBO.getAllKhachHang(pageid, count));
            
            request.setAttribute("dsThangTaiNan", hoSoTaiNanBO.getDanhSachThangTaiNan());
            
            request.setAttribute("tongSoHoSo", khachHangBO.countKhachHang());
            request.setAttribute("hoSoChuaXacThuc", hoSoTaiNanBO.countKhachHangChuaXacThuc());
            request.setAttribute("hoSoChoXacThuc", hoSoTaiNanBO.countHoSoChoXacThuc());
            request.setAttribute("hoSoDaXacThuc", hoSoTaiNanBO.countKhachHangDaXacThuc());
//            request.setAttribute("tongKH", khachHangBO.countKhachHang());
            
            RequestDispatcher req = request.getRequestDispatcher("AdminNhanVien.jsp");
            req.forward(request, response);
        } else {
            RequestDispatcher req = request.getRequestDispatcher("LoginServlet");
            req.forward(request, response);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
