package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.NhanVienBEAN;
import model.bo.ChucVuBO;
import model.bo.NhanVienBO;

@WebServlet("/SuaNhanVienServlet")
public class SuaNhanVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SuaNhanVienServlet() {
        super();
    }

	NhanVienBO nhanVienBO = new NhanVienBO();
	 ChucVuBO chucVuBO = new ChucVuBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        if(session.getAttribute("user") != null){
            String id = request.getParameter("id");
            NhanVienBEAN nv = nhanVienBO.getNhanVien(id);
            if(nv != null){
                request.setAttribute("nhanVien", nv);
            }
            request.setAttribute("dsChucVu", chucVuBO.getAllChucVu());
            RequestDispatcher rq = request.getRequestDispatcher("SuaNhanVien.jsp");
            rq.forward(request, response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("LoginServlet");
            requestDispatcher.forward(request, response);
        }
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        if(session.getAttribute("user") != null){
        
            String maNhanVien = request.getParameter("id");
            String hoTen = request.getParameter("txtHoTen");
            String ngaySinh = request.getParameter("txtNgaySinh");
            String gioiTinh = request.getParameter("rdGioiTinh");
            String soDienThoai = request.getParameter("txtSDT");
            String email = request.getParameter("txtEmail");
            String cmnd = request.getParameter("txtCMND");
            String diaChi = request.getParameter("txtDiaChi");
            String soTaiKhoan = request.getParameter("txtSoTaiKhoan");
            String nganHang = request.getParameter("txtNganHang");
            String maChucVu = request.getParameter("cbMaChucVu");
            String result = "";
            NhanVienBEAN nv = null;
            
            if(nhanVienBO.suaNhanVien(maNhanVien, hoTen,ngaySinh, gioiTinh, soDienThoai, email, cmnd, diaChi, soTaiKhoan, nganHang, maChucVu)){
                result = "Cập Nhật Thành Công!";
            } else {
                result = "Cập Nhật Thất Bại!";
            }
            nv = nhanVienBO.getNhanVien(maNhanVien);
            request.setAttribute("nhanVien", nv);
            request.setAttribute("dsChucVu", chucVuBO.getAllChucVu());
            request.setAttribute("result", result);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("SuaNhanVien.jsp");
            requestDispatcher.forward(request, response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("LoginServlet");
            requestDispatcher.forward(request, response);
        }
	}

}
