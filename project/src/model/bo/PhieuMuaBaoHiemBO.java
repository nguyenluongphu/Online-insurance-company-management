package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.PhieuMuaBaoHiemBEAN;
import model.dao.PhieuMuaBaoHiemDAO;

public class PhieuMuaBaoHiemBO {
    PhieuMuaBaoHiemDAO phieuMuaBaoHiemDAO = new PhieuMuaBaoHiemDAO();
    public boolean themPhiemMuaBaoHiem(PhieuMuaBaoHiemBEAN bh) {
        return phieuMuaBaoHiemDAO.themPhiemMuaBaoHiem(bh);
    }
    public ArrayList<PhieuMuaBaoHiemBEAN> getListPhieuMuaBaoHiem(String maKhachHang){
        return phieuMuaBaoHiemDAO.getListPhieuMuaBaoHiem(maKhachHang);
    }
    public boolean boSungPhieuMuaBanHiem(String maKhachHang, String phuongThucThanhToan, int soTienThanhToan) {
        return phieuMuaBaoHiemDAO.boSungPhieuMuaBanHiem(maKhachHang, phuongThucThanhToan, soTienThanhToan);
    }
    public boolean checkDaThanhToan(String tenDangNhap) {
        return phieuMuaBaoHiemDAO.checkDaThanhToan(tenDangNhap);
    }
    public int getTongTienThucThu(String tenDangNhap) {
        return phieuMuaBaoHiemDAO.getTongTienThucThu(tenDangNhap);
    }
    
    //Nguễn Lương Phú
    public boolean capNhatNhanVienXacNhanThanhToan(String idPhieu, String maNhanVien) {
        try {
            int rs = phieuMuaBaoHiemDAO.capNhatNhanVienXacNhanThanhToan(idPhieu,maNhanVien);
            if(rs != 0)
                return true;
            return false;
        } catch (SQLException e) {
            System.out.println("Loi cap nhat ma nhan vien phieu mua bao hiem: "+ e.getMessage());
            return false;
        }
    }
    public boolean xoaPhieuMua(String idPhieu) {
        try {
            int rs = phieuMuaBaoHiemDAO.xoaPhieuMua(idPhieu);
            if(rs != 0)
                return true;
            return false;
        } catch (SQLException e) {
            System.out.println("Loi xoa phieu mua bao hiem: "+ e.getMessage());
            return false;
        }
    }
}
