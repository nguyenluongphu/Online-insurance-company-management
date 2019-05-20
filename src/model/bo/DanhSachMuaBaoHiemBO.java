package model.bo;

import java.sql.SQLException;
import java.util.List;

import model.bean.DanhSachMuaBaoHiemBEAN;
import model.dao.DanhSachMuaBaoHiemDAO;

public class DanhSachMuaBaoHiemBO {
    DanhSachMuaBaoHiemDAO danhSachMuaBaoHiemDAO = new DanhSachMuaBaoHiemDAO();
    public int countKhachHangMuaBaoHiem() {
        try {
            return danhSachMuaBaoHiemDAO.countKhachHangMuaBaoHiem();
        } catch (SQLException e) {
           System.out.println("loi dem khach hang mua bao hiem: " + e.getMessage());
           return 0;
        }
    }

    public List<DanhSachMuaBaoHiemBEAN> getAllKhachHangMuaBaoHiem(int pageid, int count) {
        try {
            return danhSachMuaBaoHiemDAO.getAllKhachHangMuaBaoHiem(pageid, count);
        } catch (SQLException e) {
            System.out.println("loi get all ds khach hang mua bao hiem: " + e.getMessage());
            return null;
        }
    }

    public int countKhachHangMuaBaoHiemChuaThanhToan() {
        try {
            return danhSachMuaBaoHiemDAO.countKhachHangMuaBaoHiemChuaThanhToan();
        } catch (SQLException e) {
           System.out.println("loi dem chua thanh toan: " + e.getMessage());
           return 0;
        }
    }

    public int countKhachHangMuaBaoHiemDaThanhToan() {
        try {
            return danhSachMuaBaoHiemDAO.countKhachHangMuaBaoHiemDaThanhToan();
        } catch (SQLException e) {
           System.out.println("loi dem phiếu đã thanh toán: " + e.getMessage());
           return 0;
        }
    }

    public int countKhachHangMuaBaoHiemDaXacNhanThanhToan() {
        try {
            return danhSachMuaBaoHiemDAO.countKhachHangMuaBaoHiemDaXacNhanThanhToan();
        } catch (SQLException e) {
           System.out.println("loi dem phiếu đã xác nhận: " + e.getMessage());
           return 0;
        }
    }

    public List<DanhSachMuaBaoHiemBEAN> getAllPhieuMuaTimKiem(String rs, int pageid, int count) {
        try {
            return danhSachMuaBaoHiemDAO.getAllPhieuMuaTimKiem(rs, pageid, count);
        } catch (SQLException e) {
            System.out.println("loi get all ds khach hang mua bao hiem tim kiem: " + e.getMessage());
            return null;
        }
    }

    public int countKhachHangMuaBaoHiemTimKiem(String rs) {
        try {
            return danhSachMuaBaoHiemDAO.countKhachHangMuaBaoHiemTimKiem(rs);
        } catch (SQLException e) {
           System.out.println("loi dem phieu tim kiem: " + e.getMessage());
           return 0;
        }
    }

}
