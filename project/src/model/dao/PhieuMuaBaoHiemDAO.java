package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.PhieuMuaBaoHiemBEAN;

public class PhieuMuaBaoHiemDAO {
    ConnectionDatabase con = new ConnectionDatabase();
    public boolean themPhiemMuaBaoHiem(PhieuMuaBaoHiemBEAN bh) {
        String sql = " INSERT INTO dbo.PHIEUMUABAOHIEM( MaPhieuBaoHiem , MaKhachHang  , BienSo , NgayMua ,TinhTrangThanhToan ,MaBaoHiem , PhuongThucThanhToan ,SoChoNgoi ,ThoiHan , SoTienThucThu, SoTienDaThanhToan)\r\n" + 
                "VALUES  ( N'' ,? ,  ? , GETDATE() , N'Chưa thanh toán' ,? ,N'' , ?  ,?,?,?) ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, bh.getMaKhachHang());
            ps.setString(2, bh.getBienSo());
            ps.setString(3, bh.getMaBaoHiem());
            ps.setString(4, bh.getSoChoNgoi());
            ps.setInt(5, bh.getThoiHan());
            ps.setInt(6, bh.getSoTienThucThu());
            ps.setInt(7, bh.getSoTienDaThanhToan());
            ps.executeUpdate();
            con.connec.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public ArrayList<PhieuMuaBaoHiemBEAN> getListPhieuMuaBaoHiem(String maKhachHang){
        String sql = " SELECT DISTINCT dbo.PHIEUMUABAOHIEM.*,LoaiBaoHiem,MucDenBu FROM dbo.PHIEUMUABAOHIEM INNER JOIN dbo.BAOHIEM ON BAOHIEM.MaBaoHiem = PHIEUMUABAOHIEM.MaBaoHiem\r\n" + 
                " WHERE MaKhachHang = ? ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, maKhachHang);
            ResultSet rs = ps.executeQuery();
            ArrayList<PhieuMuaBaoHiemBEAN> list = new ArrayList<>();
            while(rs.next()) {
                PhieuMuaBaoHiemBEAN pmbh = new PhieuMuaBaoHiemBEAN();
                pmbh.setMaPhieuMuaBaoHiem(rs.getString("MaPhieuBaoHiem"));
                pmbh.setMaKhachHang(rs.getString("MaKhachHang"));
                pmbh.setMaNhanVien(rs.getString("LoaiBaoHiem"));
                pmbh.setBienSo(rs.getString("BienSo"));
                pmbh.setNgayMua(rs.getDate("NgayMua"));
                pmbh.setTinhTrangThanhToan(rs.getString("TinhTrangThanhToan"));
                pmbh.setMaBaoHiem(rs.getString("MaBaoHiem"));
                pmbh.setPhuongThucThanhToan(rs.getString("MucDenBu"));
                pmbh.setSoChoNgoi(rs.getString("SoChoNgoi"));
                pmbh.setThoiHan(rs.getInt("ThoiHan"));
                pmbh.setSoTienThucThu(rs.getInt("SoTienThucThu"));
                pmbh.setSoTienDaThanhToan(rs.getInt("SoTienDaThanhToan"));
                
                list.add(pmbh);
            }
            rs.close();
            con.connec.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean boSungPhieuMuaBanHiem(String maKhachHang, String phuongThucThanhToan, int soTienThanhToan) {
        String sql = " UPDATE PHIEUMUABAOHIEM SET TinhTrangThanhToan = N'Đang chờ xác nhận...', PhuongThucThanhToan = ?, SoTienDaThanhToan = ? WHERE  MaKhachHang = ? AND TinhTrangThanhToan = N'Chưa thanh toán'";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, phuongThucThanhToan);
            ps.setInt(2, soTienThanhToan);
            ps.setString(3, maKhachHang);
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean checkDaThanhToan(String tenDangNhap) {
        String sql = "  SELECT DISTINCT TinhTrangThanhToan FROM dbo.PHIEUMUABAOHIEM \r\n" + 
                " WHERE TinhTrangThanhToan = N'Chưa thanh toán' AND MaKhachHang =  ? ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, tenDangNhap);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                con.connec.close();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public int getTongTienThucThu(String tenDangNhap) {
        String sql = " SELECT SUM(SoTienThucThu) AS SoTienThucThu FROM dbo.PHIEUMUABAOHIEM \r\n" + 
                " WHERE TinhTrangThanhToan = N'Chưa thanh toán' AND MaKhachHang = ? ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, tenDangNhap);
            ResultSet rs = ps.executeQuery();
            int soTienThucThu;
            if (rs.next()) {
                soTienThucThu = rs.getInt("SoTienThucThu");
                con.connec.close();
                return soTienThucThu;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int capNhatNhanVienXacNhanThanhToan(String idPhieu, String maNhanVien) throws SQLException {
        con.getConnection();
        String sql = " UPDATE PHIEUMUABAOHIEM SET MaNhanVien = ?, TinhTrangThanhToan = ? WHERE  MaPhieuBaoHiem = ? ";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        
        cmd.setString(1, maNhanVien);
        cmd.setString(2, "Đã thanh toán");
        cmd.setString(3, idPhieu);
       
        int rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }

    public int xoaPhieuMua(String idPhieu) throws SQLException {
        con.getConnection();
        String sql = " DELETE FROM PHIEUMUABAOHIEM WHERE  MaPhieuBaoHiem = ? ";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, idPhieu);
       
        int rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }
}
