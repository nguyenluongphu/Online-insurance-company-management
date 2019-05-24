package controller;

import java.io.IOException;
import java.text.NumberFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SendMail;
import model.bean.PhieuMuaBaoHiemBEAN;
import model.bo.BaoHiemBO;
import model.bo.KhachHangBO;
import model.bo.PhieuMuaBaoHiemBO;
import model.bo.TaiKhoanBO;

@WebServlet("/PhieuMuaBaoHiemServlet")
public class PhieuMuaBaoHiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PhieuMuaBaoHiemServlet() {
        super();
    }
    PhieuMuaBaoHiemBO phieuMuaBaoHiemBO = new PhieuMuaBaoHiemBO();
    TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
    KhachHangBO khachHangBO = new KhachHangBO();
    BaoHiemBO baoHiemBO = new BaoHiemBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String maPhieuBaoHiem = request.getParameter("maPhieuBaoHiem");
        if(phieuMuaBaoHiemBO.xoaPhieuMua(maPhieuBaoHiem)){
            response.sendRedirect("TrangChuServlet?listbuy=1");
        }else{
            response.sendRedirect("TrangChuServlet?listbuy=1");
        }
            
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		
	    request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        SendMail send = new SendMail();
        
        PhieuMuaBaoHiemBEAN pmbh = new PhieuMuaBaoHiemBEAN();
        
        NumberFormat nf = NumberFormat.getInstance();
        nf.setMinimumIntegerDigits(0);
        
        String type = request.getParameter("type");
        String url = "";
        
        String email = request.getParameter("Email");
        String vehicleNumber = request.getParameter("VehicleNumber");
        String iDInsurrance = request.getParameter("IDInsurrance");
        String seatingOto = request.getParameter("SeatingOto");
        String d = request.getParameter("Duration");
        String m = request.getParameter("Money");
        
        String paymentMethod = request.getParameter("PaymentMethod");
        String bankName = request.getParameter("BankName");
        String accountNumber = request.getParameter("AccountNumber");
        
        int duration = 1, money = 1;
        if(d != null) {
            duration = Integer.parseInt(d);
        }
        if(m != null) {
            money = Integer.parseInt(m);
        }
        int realMoney = (int)(((duration * money)/12 * 0.1) + ((duration * money)/12 * 0.1)*0.1);
        if(type.equals("buy")) {

                pmbh.setMaKhachHang(taiKhoanBO.getMaKhachHang(email));
                pmbh.setBienSo(vehicleNumber);
                pmbh.setMaBaoHiem(iDInsurrance);
                pmbh.setSoChoNgoi(seatingOto);
                pmbh.setThoiHan(duration);
//                pmbh.setMucDenBu(money);
                pmbh.setSoTienThucThu(realMoney);
                pmbh.setSoTienDaThanhToan(0);
                    
                phieuMuaBaoHiemBO.themPhiemMuaBaoHiem(pmbh);    
                

                send.sendMail("nguyendangtinhdx@gmail.com", "812237559", email, "MUA BẢO HIỂM", 
                      "Họ tên: " + taiKhoanBO.getHoTen(email) +  "\nLoại bảo hiểm: "+ baoHiemBO.getLoaiBaoHiem(iDInsurrance) + "\nThời hạn: " + duration + " tháng\nMức giá đền bù: " + nf.format(money) + " VND\nSố tiền thực thu: " + nf.format(realMoney) + " VND");

                url = "TrangChuServlet?listbuy=1&email="+email;
        }
        
        if(type.equals("payment")) {
            if(phieuMuaBaoHiemBO.checkDaThanhToan(taiKhoanBO.getMaKhachHang(email))) {
                if(paymentMethod.equals("Chuyển khoản")) {
                    khachHangBO.boSungThongTinKhachHang(taiKhoanBO.getMaKhachHang(email), accountNumber, bankName);
                    phieuMuaBaoHiemBO.boSungPhieuMuaBanHiem(taiKhoanBO.getMaKhachHang(email), paymentMethod, money);
                }else {
                    phieuMuaBaoHiemBO.boSungPhieuMuaBanHiem(taiKhoanBO.getMaKhachHang(email), paymentMethod, money);
                }
                send.sendMail("nguyendangtinhdx@gmail.com", "812237559", email, "THANH TOÁN BẢO HIỂM", 
                        "Họ tên: " + taiKhoanBO.getHoTen(email) + "\nSố tiền thực thu: " + nf.format(money) + " VND" + "\nSố tiền đã thanh toán: " + nf.format(money) + " VND");

                  url = "TrangChuServlet?listbuy=1&email="+email;
            }else {
                request.setAttribute("ChuaThanhToanError", "Bạn không có bảo hiểm nào cần thanh toán !");
                url = "payment.jsp?money=" + money + "&email="+email;
            }
      }
      
  
        
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
		
	}

}
