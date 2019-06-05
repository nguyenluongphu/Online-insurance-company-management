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

@WebServlet("/ThemNhanVienServlet")
public class ThemNhanVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ThemNhanVienServlet() {
        super();
    }
    ChucVuBO chucVuBO = new ChucVuBO();
    NhanVienBO nhanVienBO = new NhanVienBO();
    TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        //hiện thị danh sách chức vụ ra để lúc thêm nhân viên chọn cho đúng
        if(session.getAttribute("user") != null)
        {
            request.setAttribute("dsChucVu", chucVuBO.getAllChucVu());
            request.setAttribute("ten", session.getAttribute("ten"));
            RequestDispatcher rq = request.getRequestDispatcher("ThemNhanVien.jsp");
            rq.forward(request, response);
        } else{
            RequestDispatcher rq = request.getRequestDispatcher("LoginServlet");
            rq.forward(request, response);
        }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        /*
         * sau khi thêm nhân viên thì thêm vào bảng tài khoản của nhân viên đó 
         * */
        HttpSession session = request.getSession();
        if(session.getAttribute("user") != null){
            String hoTen = request.getParameter("txtHoTen");
            String ngaySinh = request.getParameter("txtNgaySinh");
            String gioiTinh = request.getParameter("rdGioiTinh");
            String soDienThoai = request.getParameter("txtSDT");
            String email = request.getParameter("txtEmail");
            String cmnd = request.getParameter("txtCMND");
            String diaChi = request.getParameter("txtDiaChi");
            String soTaiKhoan = request.getParameter("txtSoTaiKhoan");
            String nganHang = request.getParameter("txtNganHang");
            String matKhau = request.getParameter("txtMatKhau");
            String maChucVu = request.getParameter("cbMaChucVu");
            String result = "";
            if(nhanVienBO.themNhanVien(hoTen,ngaySinh, gioiTinh, soDienThoai, email, cmnd, diaChi, soTaiKhoan, nganHang, maChucVu, matKhau)){
                result = "Thêm Thành Công!";
            } else {
                result = "Thêm Thất Bại!";
            }
            request.setAttribute("dsChucVu", chucVuBO.getAllChucVu());
            request.setAttribute("result", result);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("ThemNhanVien.jsp");
            requestDispatcher.forward(request, response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("LoginServlet");
            requestDispatcher.forward(request, response);
        }
	}

}
