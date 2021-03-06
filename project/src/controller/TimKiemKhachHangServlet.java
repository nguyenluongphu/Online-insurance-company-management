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

import model.bean.KhachHangBEAN;
import model.bo.HoSoTaiNanBO;
import model.bo.KhachHangBO;

@WebServlet("/TimKiemKhachHangServlet")
public class TimKiemKhachHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TimKiemKhachHangServlet() {
        super();
    }
    KhachHangBO khachHangBO = new KhachHangBO();
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
        
        //đếm tổng số trang
        request.setAttribute("sumpage", ((khachHangBO.countKhachHangTimKiem(rs))/count));
        request.setAttribute("dsKhachHang", khachHangBO.getAllKhachHangTimKiem(rs, pageid, count));
        
        request.setAttribute("dsThangTaiNan", hoSoTaiNanBO.getDanhSachThangTaiNan());
        request.setAttribute("tongSoHoSo", hoSoTaiNanBO.countHoSo());
        request.setAttribute("hoSoChuaXacThuc", hoSoTaiNanBO.countKhachHangChuaXacThuc());
        request.setAttribute("hoSoChoXacThuc", hoSoTaiNanBO.countHoSoChoXacThuc());
        request.setAttribute("hoSoDaXacThuc", hoSoTaiNanBO.countKhachHangDaXacThuc());
//        request.setAttribute("tongKH", khachHangBO.countKhachHang());
        
        request.setAttribute("noidung", rs);
        RequestDispatcher req = request.getRequestDispatcher("KetQuaTimKiemKhachHang.jsp");
        req.forward(request, response);
	}

	@SuppressWarnings("unchecked")
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
                RequestDispatcher rq = request.getRequestDispatcher("AdminNhanVienServlet");
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
                
                List<KhachHangBEAN> ds = new ArrayList<KhachHangBEAN>();
                ds = null;
                ds = (List<KhachHangBEAN>) khachHangBO.getAllKhachHangTimKiem(rs, pageid, count);
                //đếm tổng số trang
                if(ds == null || ds.size() == 0){
                    request.setAttribute("result", "Không tìm thấy nội dung");
                } else{
                    request.setAttribute("sumpage", ((khachHangBO.countKhachHangTimKiem(rs))/count));
                    request.setAttribute("dsKhachHang", ds);
                }
                
                request.setAttribute("dsThangTaiNan", hoSoTaiNanBO.getDanhSachThangTaiNan());
                request.setAttribute("tongSoHoSo", hoSoTaiNanBO.countHoSo());
                request.setAttribute("hoSoChuaXacThuc", hoSoTaiNanBO.countKhachHangChuaXacThuc());
                request.setAttribute("hoSoChoXacThuc", hoSoTaiNanBO.countHoSoChoXacThuc());
                request.setAttribute("hoSoDaXacThuc", hoSoTaiNanBO.countKhachHangDaXacThuc());
//                request.setAttribute("tongKH", khachHangBO.countKhachHang());
                request.setAttribute("noidung", rs);
                RequestDispatcher req = request.getRequestDispatcher("KetQuaTimKiemKhachHang.jsp");
                req.forward(request, response);
            } 
        } else {
            RequestDispatcher req = request.getRequestDispatcher("LoginServlet");
            req.forward(request, response);
        }
	}
}