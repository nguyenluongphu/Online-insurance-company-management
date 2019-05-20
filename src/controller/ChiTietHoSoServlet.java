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
import model.bo.AnhBO;
import model.bo.HoSoTaiNanBO;

@WebServlet("/ChiTietHoSoServlet")
public class ChiTietHoSoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChiTietHoSoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	HoSoTaiNanBO hoSoTaiNanBO = new HoSoTaiNanBO();
    AnhBO anhBO = new AnhBO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        if(session.getAttribute("user") != null){
            HoSoTaiNanBEAN hoSoTaiNanBEAN = null;
            String id = request.getParameter("id");
            if(session.getAttribute("user") != null){
                
                hoSoTaiNanBEAN = hoSoTaiNanBO.getHoSoTaiNan(id);
            }
            
            request.setAttribute("ten", session.getAttribute("ten"));
            request.setAttribute("hs", hoSoTaiNanBEAN);
            
            request.setAttribute("dsAnh", anhBO.getListAnh(id));
            RequestDispatcher req = request.getRequestDispatcher("ChiTietHoSoTaiNan.jsp");
            req.forward(request, response);
        } else {
            RequestDispatcher req = request.getRequestDispatcher("LoginServlet");
            req.forward(request, response);
        }
	}

}
