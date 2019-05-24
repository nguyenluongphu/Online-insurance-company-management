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

@WebServlet("/XacThucHoanThanhServlet")
public class XacThucHoanThanhServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XacThucHoanThanhServlet() {
        super();
    }
    HoSoTaiNanBO hoSoTaiNanBO = new HoSoTaiNanBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();
        String result = "";
        String idHoSo = (String) session.getAttribute("idHoSo");
        String xacThuc = "Đã Xác Thực";
        if(hoSoTaiNanBO.capNhatHoanThanhXacThuc(idHoSo, xacThuc)){
            result = "Xác Thực Thành Công!";
        }
        request.setAttribute("result", result);
        RequestDispatcher req = request.getRequestDispatcher("QuanLyHoSoServlet");
        req.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
