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

@WebServlet("/GiamDinhHoSoServlet")
public class GiamDinhHoSoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GiamDinhHoSoServlet() {
        super();
    }

    HoSoTaiNanBO hoSoTaiNanBO = new HoSoTaiNanBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        if(session.getAttribute("user") != null){
            String maNV = (String) session.getAttribute("user");
            String id = request.getParameter("id");
          //cập nhật mã nhân viên quản lý hồ sơ này. và trạng thái của hồ sơ này
            String trangThai = "Xác Thực";
            if(hoSoTaiNanBO.capNhatNhanVienGiamDinh(id, maNV, trangThai)){
                request.setAttribute("ten", session.getAttribute("ten"));
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
                request.setAttribute("sumpage", ((hoSoTaiNanBO.countHoSo())/count));
                request.setAttribute("dsHoSo", hoSoTaiNanBO.getAllHoSo(pageid, count));
                request.setAttribute("ten", session.getAttribute("ten"));
                RequestDispatcher req = request.getRequestDispatcher("DanhSachHoSoResult.jsp");
                req.forward(request, response);
            } else {
                request.setAttribute("ten", session.getAttribute("ten"));
                RequestDispatcher req = request.getRequestDispatcher("DanhSachHoSoResult.jsp");
                req.forward(request, response);
            }
        } else {
            RequestDispatcher req = request.getRequestDispatcher("LoginServlet");
            req.forward(request, response);
        }
	}

}
