package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.ChucVuBO;
import model.bo.NhanVienBO;
import model.bo.TaiKhoanBO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

    ChucVuBO chucVuBO = new ChucVuBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        session.invalidate();
        request.setAttribute("dsChucVu", chucVuBO.getAllChucVu());
        RequestDispatcher req = request.getRequestDispatcher("LoginAdmin.jsp");
        req.forward(request, response);
	}

	TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
	NhanVienBO nhanVienBO = new NhanVienBO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        String result = "";
        String user = request.getParameter("txtTenDangNhap");
        String pass = request.getParameter("txtMatKhau");
        String quyen = request.getParameter("txtChucVu");
        //kiểm tra xem tài khoản có tồn tại không
        if(taiKhoanBO.kiemTraTaiKhoan(user,pass,quyen)){
            //lấy tên để duy trì đăng nhập
            session.setAttribute("user", user);
            session.setAttribute("ten", nhanVienBO.getTenNhanVien(user));
            if(quyen.equals("CV001")){
                RequestDispatcher req = request.getRequestDispatcher("AdminServlet");
                req.forward(request, response);
            } else {
                RequestDispatcher req = request.getRequestDispatcher("AdminNhanVienServlet");
                req.forward(request, response);
            }
            
        } else {
            result = "Tên đăng nhập hoặc mật khẩu hoặc quyền không đúng!";
            request.setAttribute("result", result);
            request.setAttribute("tk", user);
            request.setAttribute("mk", pass);
            request.setAttribute("dsChucVu", chucVuBO.getAllChucVu());
            RequestDispatcher req = request.getRequestDispatcher("LoginAdmin.jsp");
            req.forward(request, response);
        }
	}

}
