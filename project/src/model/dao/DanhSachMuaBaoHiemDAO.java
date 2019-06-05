package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.bean.DanhSachMuaBaoHiemBEAN;

public class DanhSachMuaBaoHiemDAO {
    ConnectionDatabase con = new ConnectionDatabase();
    public int countKhachHangMuaBaoHiem() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM DanhSachMuaBaoHiem";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if(rs.next());
            count = rs.getInt(1);
        con.connec.close();
        return count;
    }

    public List<DanhSachMuaBaoHiemBEAN> getAllKhachHangMuaBaoHiem(int pageid, int count) throws SQLException {
        con.getConnection();
        
        String sql = "SELECT * FROM DanhSachMuaBaoHiem ORDER BY MaPhieuBaoHiem OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setInt(1, pageid);
        cmd.setInt(2, count);
        ResultSet rs = cmd.executeQuery();
        List<DanhSachMuaBaoHiemBEAN> dsKhachHangMuaBaoHiem = new ArrayList<DanhSachMuaBaoHiemBEAN>();
        while(rs.next()){
            String maPhieuBaoHiem = rs.getString("MaPhieuBaoHiem");
            String maKhachHang = rs.getString("MaKhachHang");
            String hoTen = rs.getString("HoTen");
            String diaChi = rs.getString("DiaChi");
            String soDienThoai = rs.getString("SoDienThoai");
            String bienSo = rs.getString("BienSo");
            String maBaoHiem = rs.getString("MaBaoHiem");
            String loaiBaoHiem = rs.getString("LoaiBaoHiem");
            String anh = rs.getString("Anh");
            String mucDenBu = rs.getString("MucDenBu");
            Integer thoiHan = rs.getInt("ThoiHan");
            String soChoNgoi = rs.getString("SoChoNgoi");
            Date ngayMua = rs.getDate("NgayMua");
            Integer soTienThucThu = rs.getInt("SoTienThucThu");
            String phuongThucThanhToan = rs.getString("PhuongThucThanhToan");
            String soTaiKhoan = rs.getString("SoTaiKhoan");
            String nganHang = rs.getString("NganHang");
            String soTienDaThanhToan = rs.getString("SoTienDaThanhToan");
            String maNhanVien = rs.getString("MaNhanVien");
            String tinhTrangThanhToan = rs.getString("TinhTrangThanhToan");
            
            dsKhachHangMuaBaoHiem.add(new DanhSachMuaBaoHiemBEAN(maPhieuBaoHiem, maKhachHang, hoTen, diaChi, soDienThoai, bienSo, maBaoHiem, loaiBaoHiem, anh, mucDenBu, thoiHan, soChoNgoi, ngayMua, soTienThucThu, phuongThucThanhToan, soTaiKhoan, nganHang, soTienDaThanhToan, maNhanVien, tinhTrangThanhToan));
            
        }
        con.connec.close();
        rs.close();
        return dsKhachHangMuaBaoHiem;
    }

    public int countKhachHangMuaBaoHiemChuaThanhToan() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM DanhSachMuaBaoHiem WHERE TinhTrangThanhToan = N'Chưa Thanh Toán'";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if(rs.next());
            count = rs.getInt(1);
        con.connec.close();
        return count;
    }

    public int countKhachHangMuaBaoHiemDaThanhToan() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM DanhSachMuaBaoHiem WHERE TinhTrangThanhToan = N'Đã Thanh Toán'";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if(rs.next());
            count = rs.getInt(1);
        con.connec.close();
        return count;
    }

    public int countKhachHangMuaBaoHiemDaXacNhanThanhToan() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM DanhSachMuaBaoHiem WHERE MaNhanVien IS NOT NULL";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if(rs.next());
            count = rs.getInt(1);
        con.connec.close();
        return count;
    }

    public List<DanhSachMuaBaoHiemBEAN> getAllPhieuMuaTimKiem(String nd, int pageid, int count) throws SQLException {
        con.getConnection();
        
        String sql = "SELECT * FROM DanhSachMuaBaoHiem WHERE MaPhieuBaoHiem LIKE ? OR HoTen LIKE ? OR LoaiBaoHiem LIKE ? OR DiaChi LIKE ? OR TinhTrangThanhToan LIKE ? ORDER BY MaPhieuBaoHiem OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, '%'+nd+'%');
        cmd.setString(2, '%'+nd+'%');
        cmd.setString(3, '%'+nd+'%');
        cmd.setString(4, '%'+nd+'%');
        cmd.setString(5, '%'+nd+'%');
        cmd.setInt(6, pageid);
        cmd.setInt(7, count);
        ResultSet rs = cmd.executeQuery();
        List<DanhSachMuaBaoHiemBEAN> dsKhachHangMuaBaoHiem = new ArrayList<DanhSachMuaBaoHiemBEAN>();
        while(rs.next()){
            String maPhieuBaoHiem = rs.getString("MaPhieuBaoHiem");
            String maKhachHang = rs.getString("MaKhachHang");
            String hoTen = rs.getString("HoTen");
            String diaChi = rs.getString("DiaChi");
            String soDienThoai = rs.getString("SoDienThoai");
            String bienSo = rs.getString("BienSo");
            String maBaoHiem = rs.getString("MaBaoHiem");
            String loaiBaoHiem = rs.getString("LoaiBaoHiem");
            String anh = rs.getString("Anh");
            String mucDenBu = rs.getString("MucDenBu");
            Integer thoiHan = rs.getInt("ThoiHan");
            String soChoNgoi = rs.getString("SoChoNgoi");
            Date ngayMua = rs.getDate("NgayMua");
            Integer soTienThucThu = rs.getInt("SoTienThucThu");
            String phuongThucThanhToan = rs.getString("PhuongThucThanhToan");
            String soTaiKhoan = rs.getString("SoTaiKhoan");
            String nganHang = rs.getString("NganHang");
            String soTienDaThanhToan = rs.getString("SoTienDaThanhToan");
            String maNhanVien = rs.getString("MaNhanVien");
            String tinhTrangThanhToan = rs.getString("TinhTrangThanhToan");
            
            dsKhachHangMuaBaoHiem.add(new DanhSachMuaBaoHiemBEAN(maPhieuBaoHiem, maKhachHang, hoTen, diaChi, soDienThoai, bienSo, maBaoHiem, loaiBaoHiem, anh, mucDenBu, thoiHan, soChoNgoi, ngayMua, soTienThucThu, phuongThucThanhToan, soTaiKhoan, nganHang, soTienDaThanhToan, maNhanVien, tinhTrangThanhToan));
            
        }
        con.connec.close();
        rs.close();
        return dsKhachHangMuaBaoHiem;
    }

    public int countKhachHangMuaBaoHiemTimKiem(String nd) throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM DanhSachMuaBaoHiem WHERE MaPhieuBaoHiem LIKE ? OR HoTen LIKE ? OR LoaiBaoHiem LIKE ? OR DiaChi LIKE ? OR TinhTrangThanhToan LIKE ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, '%'+nd+'%');
        cmd.setString(2, '%'+nd+'%');
        cmd.setString(3, '%'+nd+'%');
        cmd.setString(4, '%'+nd+'%');
        cmd.setString(5, '%'+nd+'%');
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if(rs.next());
            count = rs.getInt(1);
        con.connec.close();
        return count;
    }

}
