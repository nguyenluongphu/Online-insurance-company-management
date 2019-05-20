package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.AnhBEAN;
import model.bo.AnhBO;


@WebServlet("/ChuyenHuongUpAnhGiamDinhHoSo")
public class ChuyenHuongUpAnhGiamDinhHoSo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChuyenHuongUpAnhGiamDinhHoSo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	}

	AnhBO anhBO = new AnhBO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        
        if(session.getAttribute("user") != null){
            request.setAttribute("ten", session.getAttribute("ten"));
            //lấy tất cả các ảnh mà hồ sơ đang có
            List<AnhBEAN> dsAnh = new ArrayList<AnhBEAN>();
            dsAnh = null;
            String idHoSo = (String) session.getAttribute("idHoSo");
            dsAnh = anhBO.getListAnh(idHoSo);
            request.setAttribute("dsAnh", dsAnh);
            RequestDispatcher req = request.getRequestDispatcher("UpAnhXacThucHoSo.jsp");
            req.forward(request, response);
        } else {
            RequestDispatcher req = request.getRequestDispatcher("LoginServlet");
            req.forward(request, response);
        }
	    
	}

}
