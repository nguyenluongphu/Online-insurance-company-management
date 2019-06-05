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

@WebServlet("/UpAnhBaoHiemServlet")
public class UpAnhBaoHiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpAnhBaoHiemServlet() {
        super();
    }

	BaoHiemBO baoHiemBO = new BaoHiemBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        session.setAttribute("maBaoHiem", request.getParameter("id"));
        System.out.println(session.getAttribute("maBaoHiem"));
        request.setAttribute("path", request.getParameter("path"));
        RequestDispatcher rd = request.getRequestDispatcher("UpAnhBaoHiem.jsp");
        rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        //up ảnh lên thư mục 
        baoHiemBO.UpLoadSingleFile(request);
        //lấy đường dẫn ảnh sau khi đã thêm ảnh vào thư mục
        String path = (String) request.getAttribute("filename");
        
        //khai báo lấy các giá trị đâ lưu
        String rs = "";
        String maBaoHiem = (String) session.getAttribute("maBaoHiem");
        //trường hợp tải ảnh lên mà chưa chọn ảnh
        if(path == null || path.equals("")){
            rs = "Bạn Chưa Chọn Ảnh!";
        } else {
            if(baoHiemBO.themAnh(path, maBaoHiem)){
                rs = "Thêm ảnh thành công!";
                session.setAttribute("maBaoHiem", null);
            }
        }
        request.setAttribute("result", rs);
        request.setAttribute("path", path);
        RequestDispatcher rd = request.getRequestDispatcher("UpAnhBaoHiem.jsp");
        rd.forward(request, response);
	}

}
