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

@WebServlet("/UpAnhXacThucHoSoServlet")
public class UpAnhXacThucHoSoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpAnhXacThucHoSoServlet() {
        super();
    }
    AnhBO anhBO = new AnhBO();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        if(session.getAttribute("user") != null){
          //up ảnh lên thư mục 
            anhBO.UpLoadSingleFile(request);
            //lấy đường dẫn ảnh sau khi đã thêm ảnh vào thư mục
            String path = (String) request.getAttribute("filename");
            
            //khai báo lấy các giá trị đâ lưu
            String rs = "";
            String idHoSo = (String) session.getAttribute("idHoSo");
            List<AnhBEAN> dsAnh = new ArrayList<AnhBEAN>();
            dsAnh = null;
            //lấy tât cả ảnh đã có trong csdl
            dsAnh = anhBO.getListAnh(idHoSo);
            
            //trường hợp tải ảnh lên mà chưa chọn ảnh
            if(path == null || path.equals("")){
                rs = "Bạn Chưa Chọn Ảnh!";
            } else {
                if(anhBO.themAnh(path, idHoSo)){
                    dsAnh = anhBO.getListAnh(idHoSo);
                }
            }
            request.setAttribute("result", rs);
            request.setAttribute("dsAnh", dsAnh);
            RequestDispatcher rd = request.getRequestDispatcher("UpAnhXacThucHoSo.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("LoginServlet");
          rd.forward(request, response);
        }
	}

}
