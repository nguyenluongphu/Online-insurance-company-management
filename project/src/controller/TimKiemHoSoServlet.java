package controller;

import java.io.IOException;
import java.time.Year;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.KhachHangBEAN;
import model.bo.HoSoTaiNanBO;

@WebServlet("/TimKiemHoSoServlet")
public class TimKiemHoSoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TimKiemHoSoServlet() {
        super();
    }
    
    HoSoTaiNanBO hoSoTaiNanBO = new HoSoTaiNanBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        String rs = (String) session.getAttribute("rs");
        int pageid = 1; //mặc định pageid = 1
        int  count = 10;
        
        
        if(request.getParameter("pageid") != null)  // mới đầu chạy trang web lên chắc chắn stpageid chưa được dữ liệu
        {
            pageid = Integer.parseInt(request.getParameter("pageid")); 
            request.setAttribute("numberpage", pageid);
        }
        
        pageid = pageid - 1;
        pageid = pageid * count;    // sẽ lấy tiếp 10 nhân viên tiếp theo  
      //xem người dùng có thông ke tình hình bồi thường theo năm hay không?
        String nam = Year.now().toString();
        String namHienTai = Year.now().toString();
        
        if(request.getParameter("cbNam") == null){
            request.setAttribute("dsThangTaiNan", hoSoTaiNanBO.getDanhSachThangTaiNan());
        } else {
            nam = request.getParameter("cbNam");
            request.setAttribute("dsThangTaiNan", hoSoTaiNanBO.getDanhSachThangTaiNan(nam));
        }
        
        request.setAttribute("dsThangTaiNanPhanTram", hoSoTaiNanBO.getDanhSachThangTaiNanPhanTram(nam));
        request.setAttribute("namDangChon", nam); //dùng cho biểu đồ đường thông kê vụ tai nạn
        request.setAttribute("namHienTai", namHienTai); 
        request.setAttribute("dsNam", hoSoTaiNanBO.getAllNam());
        //đếm tổng số trang
        request.setAttribute("sumpage", ((hoSoTaiNanBO.countHoSoTimKiem(rs))/count));
        request.setAttribute("dsHoSo", hoSoTaiNanBO.getAllHoSoTimKiem(rs, pageid, count));
        request.setAttribute("tongSoHoSo", hoSoTaiNanBO.countHoSo());
        request.setAttribute("hoSoChuaXacThuc", hoSoTaiNanBO.countKhachHangChuaXacThuc());
        request.setAttribute("hoSoChoXacThuc", hoSoTaiNanBO.countHoSoChoXacThuc());
        request.setAttribute("hoSoDaXacThuc", hoSoTaiNanBO.countKhachHangDaXacThuc());
        request.setAttribute("noidung", rs);
        RequestDispatcher req = request.getRequestDispatcher("KetQuaTimKiemHoSo.jsp");
        req.forward(request, response);
	}

	@SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        session.setAttribute("rs", null);
        String rs = "";
        rs = request.getParameter("txtTimKiem");
        session.setAttribute("rs", rs);
        if(session.getAttribute("rs").equals("")){
            RequestDispatcher req = request.getRequestDispatcher("QuanLyHoSoServlet");
            req.forward(request, response);
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
            
            List<KhachHangBEAN> ds = new ArrayList<KhachHangBEAN>();
            ds = null;
            ds = (List<KhachHangBEAN>) hoSoTaiNanBO.getAllHoSoTimKiem(rs, pageid, count);
            //đếm tổng số trang
            if(ds == null || ds.size() == 0){
                request.setAttribute("result", "Không tìm thấy nội dung");
            } else{
                request.setAttribute("sumpage", ((hoSoTaiNanBO.countHoSoTimKiem(rs))/count));
                request.setAttribute("dsHoSo", ds);
            }
            String nam = Year.now().toString();
            String namHienTai = Year.now().toString();
            
            if(request.getParameter("cbNam") == null){
                request.setAttribute("dsThangTaiNan", hoSoTaiNanBO.getDanhSachThangTaiNan());
            } else {
                nam = request.getParameter("cbNam");
                request.setAttribute("dsThangTaiNan", hoSoTaiNanBO.getDanhSachThangTaiNan(nam));
            }
            
            request.setAttribute("dsThangTaiNanPhanTram", hoSoTaiNanBO.getDanhSachThangTaiNanPhanTram(nam));
            request.setAttribute("namDangChon", nam); //dùng cho biểu đồ đường thông kê vụ tai nạn
            request.setAttribute("namHienTai", namHienTai); 
            request.setAttribute("dsNam", hoSoTaiNanBO.getAllNam());
            
            request.setAttribute("tongSoHoSo", hoSoTaiNanBO.countHoSo());
            request.setAttribute("hoSoChuaXacThuc", hoSoTaiNanBO.countKhachHangChuaXacThuc());
            request.setAttribute("hoSoChoXacThuc", hoSoTaiNanBO.countHoSoChoXacThuc());
            request.setAttribute("hoSoDaXacThuc", hoSoTaiNanBO.countKhachHangDaXacThuc());
            request.setAttribute("noidung", rs);
            RequestDispatcher req = request.getRequestDispatcher("KetQuaTimKiemHoSo.jsp");
            req.forward(request, response);
        }
	}

}
