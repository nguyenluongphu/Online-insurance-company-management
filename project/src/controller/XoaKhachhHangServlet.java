package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.KhachHangBO;

@WebServlet("/XoaKhachhHangServlet")
public class XoaKhachhHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XoaKhachhHangServlet() {
        super();
    }

	KhachHangBO khachHangBO = new KhachHangBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String result = "";
        if(khachHangBO.xoaKhachHang(request.getParameter("id"))){
            result = "Xóa Thành Công!";
        } else{
            result = "Xóa không thành công!";
        }
        request.setAttribute("result", result);
        RequestDispatcher rq = request.getRequestDispatcher("AdminNhanVienServlet");
        rq.forward(request, response);
	}

}
