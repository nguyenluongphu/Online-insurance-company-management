package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.BaoHiemBO;

@WebServlet("/ThemMoiBaoHiemServlet")
public class ThemMoiBaoHiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ThemMoiBaoHiemServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        if(session.getAttribute("user") != null){
            request.setAttribute("ten", session.getAttribute("ten"));
            RequestDispatcher req = request.getRequestDispatcher("ThemMoiBaoHiem.jsp");
            req.forward(request, response);
        } else {
            RequestDispatcher req = request.getRequestDispatcher("LoginServlet");
            req.forward(request, response);
        }
	}

	BaoHiemBO baoHiemBO = new BaoHiemBO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        
        if(session.getAttribute("user") != null){
            String loaiBaoHiem = request.getParameter("txtLoaiBaoHiem");
            String moTa = request.getParameter("txtMoTa");
            String mucDenBu = request.getParameter("txtMucDenBu");
            String result = "";
            String url = "";
            String maBaoHiem = baoHiemBO.themBaoHiem(loaiBaoHiem, moTa, mucDenBu);
            if(maBaoHiem == null || maBaoHiem.equals("")){
                result = "Thêm thất bại!";
                url = "DanhSachBaoHiemServlet";
                request.setAttribute("result", result);
            } else {
                url = "UpAnhBaoHiem.jsp";
                session.setAttribute("maBaoHiem", maBaoHiem);
            }
            request.setAttribute("ten", session.getAttribute("ten"));
            RequestDispatcher req = request.getRequestDispatcher(url);
            req.forward(request, response);
        } else {
            RequestDispatcher req = request.getRequestDispatcher("LoginServlet");
            req.forward(request, response);
        }
        
       
	}

}
