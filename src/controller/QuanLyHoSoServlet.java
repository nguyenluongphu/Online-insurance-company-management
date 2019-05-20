package controller;

import java.io.IOException;
import java.time.Year;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.HoSoTaiNanBO;

@WebServlet("/QuanLyHoSoServlet")
public class QuanLyHoSoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuanLyHoSoServlet() {
        super();
    }

	HoSoTaiNanBO hoSoTaiNanBO = new HoSoTaiNanBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        if(session.getAttribute("user") != null){
            
            int pageid = 1; //mặc định pageid = 1
            int  count = 10;
            
            
            if(request.getParameter("pageid") != null){  // mới đầu chạy trang web lên chắc chắn stpageid chưa được dữ liệu
            
                pageid = Integer.parseInt(request.getParameter("pageid")); 
                request.setAttribute("numberpage", pageid);
            }
            
            pageid = pageid - 1;
            pageid = pageid * count;    // sẽ lấy tiếp 10 nhân viên tiếp theo  
            
            //đếm tổng số trang
            request.setAttribute("sumpage", ((hoSoTaiNanBO.countHoSo())/count));
            request.setAttribute("dsHoSo", hoSoTaiNanBO.getAllHoSo(pageid, count));
          //xem người dùng có thông ke tình hình bồi thường theo năm hay không?
            String nam = Year.now().toString();
            String namHienTai = Year.now().toString();
            
            if(request.getParameter("cbNam") == null){
                request.setAttribute("dsThangTaiNan", hoSoTaiNanBO.getDanhSachThangTaiNan());
            } else {
                nam = request.getParameter("cbNam");
                request.setAttribute("dsThangTaiNan", hoSoTaiNanBO.getDanhSachThangTaiNan(nam));
            }
            //lấy ra số phần trăm từng tháng bị tai nạn
            request.setAttribute("dsThangTaiNanPhanTram", hoSoTaiNanBO.getDanhSachThangTaiNanPhanTram(nam));
            request.setAttribute("namDangChon", nam); //dùng cho biểu đồ đường thông kê vụ tai nạn
            request.setAttribute("namHienTai", namHienTai); 
            request.setAttribute("dsNam", hoSoTaiNanBO.getAllNam());
            request.setAttribute("tongSoHoSo", hoSoTaiNanBO.countHoSo());
            
            request.setAttribute("hoSoChuaXacThuc", hoSoTaiNanBO.countKhachHangChuaXacThuc());
            request.setAttribute("hoSoChoXacThuc", hoSoTaiNanBO.countHoSoChoXacThuc());
            request.setAttribute("hoSoDaXacThuc", hoSoTaiNanBO.countKhachHangDaXacThuc());
            
            
            request.setAttribute("ten", session.getAttribute("ten"));
            RequestDispatcher req = request.getRequestDispatcher("DanhSachHoSo.jsp");
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
