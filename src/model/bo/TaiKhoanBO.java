package model.bo;

import java.sql.SQLException;

import model.bean.TaiKhoanBEAN;
import model.dao.TaiKhoanDAO;

public class TaiKhoanBO {
    TaiKhoanDAO taiKhoanDAO = new  TaiKhoanDAO();
    public boolean kiemTraTaiKhoan(String user, String pass, String quyen) {
        try {
            return taiKhoanDAO.kiemTraTaiKhoan(user, pass, quyen);
        } catch (SQLException e) {
            System.out.println("Loi kiem tra tai khoan: " + e.getMessage());
            return false;
        }
    }
    public boolean themTaiKhoan(String maNV, String matKhau, String maChucVu) {
       try {
        int rs = taiKhoanDAO.themTaiKhoan(maNV, matKhau, maChucVu);
        if(rs != 0)
            return true;
        return false;
    } catch (SQLException e) {
        System.out.println("Loi them tai khoan: "+ e.getMessage());
        return false;
    }
    }
    public boolean xoaTaiKhoan(String id) {
        try {
            int rs = 0;
             rs = taiKhoanDAO.xoaTaiKhoan(id);
             if(rs != 0)
                 return true;
             return false;
            
        } catch (SQLException e) {
           System.out.println("loi xoa tai khoan: " + e.getMessage());
           return false;
        }
    }
    //của Tỉnh
    
    public TaiKhoanBEAN dangNhap(String tenDangNhap, String matKhau) {
        return taiKhoanDAO.dangNhap(tenDangNhap, matKhau);
    }
    public String getHoTen(String tenDangNhap) {
        return taiKhoanDAO.getHoTen(tenDangNhap);
    }
    public String getMaKhachHang(String tenDangNhap) {
        return taiKhoanDAO.getMaKhachHang(tenDangNhap);
    }
    public boolean checkTaiKhoan(String tenDangNhap) {
        return taiKhoanDAO.checkTaiKhoan(tenDangNhap);
    }
    public boolean themTaiKhoan(TaiKhoanBEAN tk) {
        return taiKhoanDAO.themTaiKhoan(tk);
    }
    public boolean checkMatKhau(String tenDangNhap, String matKhau) {
        return taiKhoanDAO.checkMatKhau(tenDangNhap, matKhau);
    }
    public boolean suaMatKhau(String tenDangNhap, String matKhau) {
        return taiKhoanDAO.suaMatKhau(tenDangNhap, matKhau);
    }
}
