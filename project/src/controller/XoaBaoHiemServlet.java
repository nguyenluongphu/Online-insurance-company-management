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

@WebServlet("/XoaBaoHiemServlet")
public class XoaBaoHiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XoaBaoHiemServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	BaoHiemBO baoHiemBO = new BaoHiemBO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        String result = "";
        if(session.getAttribute("user") != null){
            String id = request.getParameter("id");
            if(id != null){
                if(baoHiemBO.xoaBaoHiem(id)){
                    result = "Xóa thành công!";
                } else {
                    result = "Xóa thất bại!";
                }
            } else {
                result = "Xóa thất bại!";
            }
            
            //lấy tất cả các khách hàng
            int pageid = 1; //mặc định pageid = 1
            int  count = 10;
            
            
            if(request.getParameter("pageid") != null)  // mới đầu chạy trang web lên chắc chắn stpageid chưa được dữ liệu
            {
                pageid = Integer.parseInt(request.getParameter("pageid")); 
                request.setAttribute("numberpage", pageid);
            }
            
            pageid = pageid - 1;
            pageid = pageid * count;    // sẽ lấy tiếp 10 nhân viên tiếp theo  
            
            //đếm tổng số trang
            request.setAttribute("result", result);
            request.setAttribute("ten", session.getAttribute("ten"));
            request.setAttribute("sumpage", ((baoHiemBO.countBaoHiem())/count));
            request.setAttribute("dsBaoHiem", baoHiemBO.getAllBaoHiem(pageid, count));
            RequestDispatcher req = request.getRequestDispatcher("DanhSachBaoHiemResult.jsp");
            req.forward(request, response);
        } else {
            RequestDispatcher req = request.getRequestDispatcher("LoginServlet");
            req.forward(request, response);
        }
	}

}
