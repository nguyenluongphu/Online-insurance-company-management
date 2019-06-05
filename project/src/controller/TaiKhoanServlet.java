package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.MD5;
import model.bean.KhachHangBEAN;
import model.bean.TaiKhoanBEAN;
import model.bo.KhachHangBO;
import model.bo.TaiKhoanBO;

@WebServlet("/TaiKhoanServlet")
public class TaiKhoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TaiKhoanServlet() {
        super();
    }
    TaiKhoanBO taiKhoanBO= new TaiKhoanBO();
    KhachHangBO khachHangBO = new KhachHangBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        if(request.getParameter("type").equals("logout")){
            HttpSession session = request.getSession();
            session.invalidate();
            RequestDispatcher rd = request.getRequestDispatcher("TrangChuServlet");
            rd.forward(request, response);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	        request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            HttpSession session = request.getSession();
           TaiKhoanBEAN tk = new TaiKhoanBEAN();
            KhachHangBEAN kh= new KhachHangBEAN();
            
            String type = request.getParameter("type");
            String url = "";
            
            String name = request.getParameter("Name");
            String address = request.getParameter("Address");
            String phone = request.getParameter("Phone");
            String email = request.getParameter("Email");
            String password = request.getParameter("Password");
            String bankName = request.getParameter("BankName");
            String accountNumber = request.getParameter("AccountNumber");
            
            String passwordOld =  request.getParameter("PasswordOld");
            String passwordNew = request.getParameter("PasswordNew");
            
            if(type.equals("login")) {
                tk =  taiKhoanBO.dangNhap(email, MD5.MaHoa(password));
                if(tk != null) {
                    session.setAttribute("user", taiKhoanBO.getHoTen(email));
                    session.setAttribute("email", email);
                    session.setAttribute("passwordEmail", password);
                    request.setAttribute("loginSuccess", "Đăng nhập thành công !");
                    url = "TrangChuServlet";
                }
                else {
                    request.setAttribute("loginError", "Email hoặc mật khẩu không đúng !");
                    url = "login.jsp";
                }
            }
            if(type.equals("signin")) {
                if(taiKhoanBO.checkTaiKhoan(email)) {
                    request.setAttribute("tenDangNhapError", "Email đã được đăng ký !");
                    url="signin.jsp";
                }else {
                    kh.setHoTen(name);
                    kh.setDiaChi(address);
                    kh.setSoDienThoai(phone);
                    kh.setSoTaiKhoan(accountNumber);
                    kh.setNganHang(bankName);
                    
                    tk.setTenDangNhap(email);
                    tk.setMatKhau(MD5.MaHoa(password));
                    
                    khachHangBO.dangKy(kh);
                    taiKhoanBO.themTaiKhoan(tk);
                    
                    request.setAttribute("signupSuccess", "Đăng ký tài khoản thành công");
                    
                    url = "login.jsp";
                   
                }
            }
            
            if(type.equals("updateInfo")) {
                    if(!taiKhoanBO.checkMatKhau(email, MD5.MaHoa(password))) {
                        request.setAttribute("passwordError", "Mật khẩu không chính xác !");
                        url = "TrangChuServlet?profile=1&email=" + email;
                    }else {
                        kh.setHoTen(name);
                        kh.setDiaChi(address);
                        kh.setSoDienThoai(phone);
                        kh.setSoTaiKhoan(accountNumber);
                        kh.setNganHang(bankName);
                        kh.setMaKhachHang(taiKhoanBO.getMaKhachHang(email));
                        
                        khachHangBO.suaThongTinKhachHang(kh);

                        url = "TrangChuServlet?index=1";
                    }
            }
            
            if(type.equals("changepassword")) {
                if(!taiKhoanBO.checkMatKhau(email, MD5.MaHoa(passwordOld))) {
                    request.setAttribute("passwordOldError", "Mật khẩu cũ không chính xác !");
                    url = "TrangChuServlet?changepassword=1&email=" + email;
                }else {
                    taiKhoanBO.suaMatKhau(email, MD5.MaHoa(passwordNew));
                    url = "TrangChuServlet?index=1";
                }
        }
            
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
	}

}
