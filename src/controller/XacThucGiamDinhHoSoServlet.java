package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.HoSoTaiNanBEAN;
import model.bo.HoSoTaiNanBO;

@WebServlet("/XacThucGiamDinhHoSoServlet")
public class XacThucGiamDinhHoSoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XacThucGiamDinhHoSoServlet() {
        super();
    }

	HoSoTaiNanBO hoSoTaiNanBO = new HoSoTaiNanBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        HoSoTaiNanBEAN hoSoTaiNanBEAN = null;
        String id = request.getParameter("id");
        if(session.getAttribute("user") != null){
            
            hoSoTaiNanBEAN = hoSoTaiNanBO.getHoSoTaiNan(id);
            session.setAttribute("idHoSo", id);
        }
        
        request.setAttribute("ten", session.getAttribute("ten"));
        request.setAttribute("hs", hoSoTaiNanBEAN);
        RequestDispatcher req = request.getRequestDispatcher("XacThucGiamDinhHoSo.jsp");
        req.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        
        String id = request.getParameter("id");
        String mucDoThietHai = request.getParameter("txtMucDoThietHai");
        String mucDoDenBu = request.getParameter("txtMucDoDenBu");
        String lyDo = request.getParameter("txtLyDo");
        String xacNhanDenBu = request.getParameter("txtXacNhanDenBu");
        //nếu đang tồn tại đăng nhập
        if(session.getAttribute("user") != null){
            //nếu cập nhật thành công!
            if(hoSoTaiNanBO.capNhatXacThucGiamDinh(id, mucDoThietHai, mucDoDenBu, lyDo, xacNhanDenBu)){
                request.setAttribute("ten", session.getAttribute("ten"));
                RequestDispatcher req = request.getRequestDispatcher("ChuyenHuongUpAnhGiamDinhHoSo");
                req.forward(request, response);
            } else {
                doGet(request, response);
            }
        } else{
            RequestDispatcher req = request.getRequestDispatcher("LoginServlet");
            req.forward(request, response);
        }
	}
}
