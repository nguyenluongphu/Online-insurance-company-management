package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import model.bean.HoSoTaiNanBEAN;
import model.bo.HoSoTaiNanBO;
import model.bo.TaiKhoanBO;

@WebServlet("/HoSoTaiNanServlet")
public class HoSoTaiNanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HoSoTaiNanServlet() {
        super();
    }
    HoSoTaiNanBO hoSoTaiNanBO = new HoSoTaiNanBO();
    TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String maHoSo = request.getParameter("maHoSo");
        if(hoSoTaiNanBO.xoaHoSo(maHoSo)){
            response.sendRedirect("TrangChuServlet?listdeclare=1");
        }else{
            response.sendRedirect("TrangChuServlet?listdeclare=1");
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     request.setCharacterEncoding("UTF-8");
         response.setCharacterEncoding("UTF-8");
         response.setContentType("text/html; charset=UTF-8");
         //HoSoTaiNanBEAN hstn = new HoSoTaiNanBEAN();
         
         String type = request.getParameter("type");
         String url = "";
         
         
         String vehicleNumber = request.getParameter("VehicleNumber");
         String ngayXayRaTaiNan = request.getParameter("DayAccident");
         String nameDriver = request.getParameter("NameDriver");
         String license = request.getParameter("License");
         String addressAccident = request.getParameter("AddressAccident");
         String describe = request.getParameter("Describe");
         String email = request.getParameter("Email");
         
         DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
         //Date today = new Date();
         Date dayAccident = null;
         try {
             dayAccident = df.parse(ngayXayRaTaiNan);
         } catch (ParseException e) {
             e.printStackTrace();
         }
         
//         String s[] = ngayXayRaTaiNan.split("[-]");
//         if(Integer.parseInt(s[0]) < 1900 || today.getTime() < dayAccident.getTime()) {
//             request.setAttribute("dayAccidentError", "NgÃ y tai náº¡n khÃ´ng há»£p lá»‡ !");
//             url = "TrangChuServlet?declare=1";
//         }
//        
         
         if(type.equals("sendInfo")) {
             hoSoTaiNanBO.themHoSoTaiNan(email,vehicleNumber, dayAccident, nameDriver,license , describe,addressAccident);
             url = "TrangChuServlet?listdeclare=1&email="+email;
         }else {
             url = "TrangChuServlet?declare=1";
         }
         
         
         RequestDispatcher rd = request.getRequestDispatcher(url);
         rd.forward(request, response);
	}

}
