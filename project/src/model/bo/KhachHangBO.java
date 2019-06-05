package model.bo;

import java.sql.SQLException;
import java.util.List;

import model.bean.KhachHangBEAN;
import model.dao.KhachHangDAO;

public class KhachHangBO {
    KhachHangDAO khachHangDAO = new KhachHangDAO();

    public int countKhachHang() {
        try {
            return khachHangDAO.countKhachHang();
        } catch (SQLException e) {
            System.out.println("Loi dem khach hang: "+ e.getMessage());
            return 0;
        }
    }

    public List<KhachHangBEAN> getAllKhachHang(int pageid, int count) {
        try {
            return khachHangDAO.getAllKhachHang(pageid, count);
        } catch (SQLException e) {
            System.out.println("Loi lay danh sach khach hang: "+ e.getMessage());
            return null;
        }
    }

    public int countKhachHangTimKiem(String rs) {
        try {
            return khachHangDAO.countKhachHangTimKiem(rs);
        } catch (SQLException e) {
            System.out.println("Loi dem khach hang tim kiem: "+ e.getMessage());
            return 0;
        }
    }

    public Object getAllKhachHangTimKiem(String rs, int pageid, int count) {
        try {
            return khachHangDAO.getAllKhachHangTimKiem(rs, pageid, count);
        } catch (SQLException e) {
            System.out.println("Loi lay danh sach khach hang tim kiem: "+ e.getMessage());
            return null;
        }
    }

    public boolean xoaKhachHang(String id) {
       try {
        int rs = khachHangDAO.xoaKhachHang(id);
        if(rs != 0)
            return true;
        return false;
    } catch (SQLException e) {
        System.out.println("Loi xoa khach hang: "+ e.getMessage());
        return false;
    }
       
    }

    public int countKhachHangChuaXacThuc() {
        try {
            return khachHangDAO.countKhachHangChuaXacThuc();
        } catch (SQLException e) {
            System.out.println("Loi dem khach hang chua xac thuc: "+ e.getMessage());
            return 0;
        }
    }

    public int countKhachHangDaXacThuc() {
        try {
            return khachHangDAO.countKhachHangDaXacThuc();
        } catch (SQLException e) {
            System.out.println("Loi dem khach hang da xac thuc: "+ e.getMessage());
            return 0;
        }
    }
    //của tỉnh
    
    public boolean dangKy(KhachHangBEAN kh) {
        return khachHangDAO.dangKy(kh);
    }
    public boolean suaThongTinKhachHang(KhachHangBEAN kh) {
        return khachHangDAO.suaThongTinKhachHang(kh);
    }
    public boolean boSungThongTinKhachHang(String maKhachHang, String soTaiKhoan, String nganHang) {
        return khachHangDAO.boSungThongTinKhachHang(maKhachHang, soTaiKhoan, nganHang);
    }
}
