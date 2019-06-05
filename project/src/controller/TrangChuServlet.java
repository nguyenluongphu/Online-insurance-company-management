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
import model.bo.HoSoTaiNanBO;
import model.bo.PhieuMuaBaoHiemBO;
import model.bo.TaiKhoanBO;
import model.bo.ThongTinCaNhanBO;

@WebServlet("/TrangChuServlet")
public class TrangChuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TrangChuServlet() {
        super();
    }
    HoSoTaiNanBO hoSoTaiNanBO = new HoSoTaiNanBO();
    TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
    ThongTinCaNhanBO thongTinCaNhanBO = new ThongTinCaNhanBO();
    BaoHiemBO baoHiemBO = new BaoHiemBO();
    PhieuMuaBaoHiemBO phieuMuaBaoHiemBO = new PhieuMuaBaoHiemBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();
        String url = "index.jsp";
        
        String loai = request.getParameter("loai");
        
        String main = request.getParameter("main");
        String declare = request.getParameter("declare");
        String listdeclare = request.getParameter("listdeclare");
        String listbuy = request.getParameter("listbuy");
        String introduce = request.getParameter("introduce");
        String guide = request.getParameter("guide");
        String contact = request.getParameter("contact");
        String payment = request.getParameter("payment");
        String login = request.getParameter("login");
        String signin = request.getParameter("signin");
//        String email = request.getParameter("email");
        String profile = request.getParameter("profile");
        String changepassword = request.getParameter("changepassword");
        
        String key = request.getParameter("key");
        
        String maBaoHiem = request.getParameter("maBaoHiem");
        
        if(main != null)
        {
            url = "index.jsp";
        }
        if(declare != null)
        {
            url = "declare.jsp";
        }
        if(listdeclare != null)
        {
            url = "listdeclare.jsp";
        }
        if(listbuy != null)
        {
            url = "listbuy.jsp";
        }
        if(introduce != null)
        {
            url = "introduce.jsp";
        }
        if(guide != null)
        {
            url = "guide.jsp";
        }
        if(contact != null)
        {
            url = "contact.jsp";
        }
        if(payment != null)
        {
            url = "payment.jsp";
        }
        if(login != null)
        {
            url = "login.jsp";
        }
        if(signin != null)
        {
            url = "signin.jsp";
        }
        if(profile != null)
        {
            url = "profile.jsp";
        }
        if(changepassword != null)
        {
            url = "changepassword.jsp";
        }
        if(maBaoHiem != null){
            request.setAttribute("loaiBaoHiem", baoHiemBO.getLoaiBaoHiem(maBaoHiem));
            url = "buy.jsp?maBaoHiem=" + maBaoHiem;
        }
        if(key != null) {
            if(loai.equals("timKiem")) {
                request.setAttribute("ListBaoHiem", baoHiemBO.getListBaoHiemByKey(key));
                url="index.jsp";
            }
        }else {
            request.setAttribute("ListBaoHiem", baoHiemBO.getListBaoHiem());
        }

        String tk = null;
        if(session.getAttribute("email") != null){
             tk = (String)session.getAttribute("email");
        }
        request.setAttribute("ListHoSoTaiNan", hoSoTaiNanBO.getListHoSoTaiNan(taiKhoanBO.getMaKhachHang(tk)));
        request.setAttribute("ListThongTinCaNhan", thongTinCaNhanBO.getThonTinCaNhan(tk));
        request.setAttribute("ListPhieuMuaBaoHiem", phieuMuaBaoHiemBO.getListPhieuMuaBaoHiem(taiKhoanBO.getMaKhachHang(tk)));
        request.setAttribute("TongTienThucThu", String.valueOf(phieuMuaBaoHiemBO.getTongTienThucThu(taiKhoanBO.getMaKhachHang(tk))));
       
        
        RequestDispatcher req = request.getRequestDispatcher(url);
        req.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
