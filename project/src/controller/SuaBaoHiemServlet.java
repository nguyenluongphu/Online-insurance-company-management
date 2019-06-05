package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.BaoHiemBEAN;
import model.bo.BaoHiemBO;

@WebServlet("/SuaBaoHiemServlet")
public class SuaBaoHiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SuaBaoHiemServlet() {
        super();
    }
    BaoHiemBO baoHiemBO = new BaoHiemBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        
        if(session.getAttribute("user") != null){
            String id = request.getParameter("id");
            BaoHiemBEAN bh= baoHiemBO.getBaoHiem(id);
            if(bh != null){
                request.setAttribute("baoHiem", bh);
            }
            RequestDispatcher rq = request.getRequestDispatcher("SuaBaoHiem.jsp");
            rq.forward(request, response);
        } else {
            RequestDispatcher rq = request.getRequestDispatcher("LoginServlet");
            rq.forward(request, response);
        }
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        
        if(session.getAttribute("user") != null){
            String url = "";
            //trường hợp nhấn submit cạp nhật
//            if(request.getParameter("btnSubmit") != null){
            String maBaoHiem = request.getParameter("txtMaBaoHiem");
            String loaiBaoHiem = request.getParameter("txtLoaiBaoHiem");
            String moTa = request.getParameter("txtMoTa");
            String result = "";
            
             if(baoHiemBO.suaBaoHiem(maBaoHiem, loaiBaoHiem, moTa)){
                 url = "DanhSachBaoHiemServlet";
                 result = "Sửa Thành Công!";
             } else {
                result = "Sửa thất bại!";
                url = "SuaBaoHiem.jsp";
                request.setAttribute("result", result);
                BaoHiemBEAN bh= baoHiemBO.getBaoHiem(maBaoHiem);
                if(bh != null){
                    request.setAttribute("baoHiem", bh);
                }
            }
//            }
            request.setAttribute("ten", session.getAttribute("ten"));
            RequestDispatcher req = request.getRequestDispatcher(url);
            req.forward(request, response);
        } else {
            RequestDispatcher rq = request.getRequestDispatcher("LoginServlet");
            rq.forward(request, response);
        }
	}

}
