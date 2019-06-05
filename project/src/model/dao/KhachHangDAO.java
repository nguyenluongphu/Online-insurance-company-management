package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.bean.KhachHangBEAN;

public class KhachHangDAO {
    ConnectionDatabase con = new ConnectionDatabase();
    public List<KhachHangBEAN> getAllKhachHang(int pageid, int count) throws SQLException {
        con.getConnection();
        
        String sql = "SELECT * FROM KHACHHANG ORDER BY MaKhachHang OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setInt(1, pageid);
        cmd.setInt(2, count);
        ResultSet rs = cmd.executeQuery();
        List<KhachHangBEAN> dsKhachHang = new ArrayList<KhachHangBEAN>();
        while(rs.next()){
            String maKhachHang = rs.getString("MaKhachHang");
            String hoTen = rs.getString("HoTen");
            String diaChi = rs.getString("DiaChi");
            String soDienThoai = rs.getString("SoDienThoai");
            String soTaiKhoan = rs.getString("SoTaiKhoan");
            String nganHang = rs.getString("NganHang");
            
            dsKhachHang.add(new KhachHangBEAN(maKhachHang, hoTen, diaChi, soDienThoai, soTaiKhoan, nganHang));
        }
        con.connec.close();
        rs.close();
        return dsKhachHang;
    }

    public int countKhachHang() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM KHACHHANG";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if(rs.next());
            count = rs.getInt(1);
        con.connec.close();
        return count;
    }

    public int countKhachHangTimKiem(String nd) throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM KHACHHANG WHERE MaKhachHang = ? OR HoTen LIKE ? OR DiaChi LIKE ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, '%'+nd+'%');
        cmd.setString(2, '%'+nd+'%');
        cmd.setString(3, '%'+nd+'%');
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if(rs.next());
            count = rs.getInt(1);
        con.connec.close();
        return count;
    }

    public List<KhachHangBEAN> getAllKhachHangTimKiem(String nd, int pageid, int count) throws SQLException {
        con.getConnection();
        
        String sql = "SELECT * FROM KHACHHANG WHERE MaKhachHang = ? OR HoTen LIKE ? OR DiaChi LIKE ? ORDER BY MaKhachHang OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, '%'+nd+'%');
        cmd.setString(2, '%'+nd+'%');
        cmd.setString(3, '%'+nd+'%');
        cmd.setInt(4, pageid);
        cmd.setInt(5, count);
        ResultSet rs = cmd.executeQuery();
        List<KhachHangBEAN> dsKhachHang = new ArrayList<KhachHangBEAN>();
        while(rs.next()){
            String maKhachHang = rs.getString("MaKhachHang");
            String hoTen = rs.getString("HoTen");
            String diaChi = rs.getString("DiaChi");
            String soDienThoai = rs.getString("SoDienThoai");
            String soTaiKhoan = rs.getString("SoTaiKhoan");
            String nganHang = rs.getString("NganHang");
            
            dsKhachHang.add(new KhachHangBEAN(maKhachHang, hoTen, diaChi, soDienThoai, soTaiKhoan, nganHang));
        }
        con.connec.close();
        rs.close();
        return dsKhachHang;
    }

    public int xoaKhachHang(String id) throws SQLException {
        con.getConnection();
        String sql = "DELETE FROM KHACHHANG WHERE MaKhachHang = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, id);
        
        int rs = 0;
        rs = cmd.executeUpdate();
        return rs;
        
    }

    public int countKhachHangChuaXacThuc() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(HOSOTAINAN.MaKhachHang) FROM HOSOTAINAN WHERE HOSOTAINAN.TrangThaiXacThuc <> N'Đã Xác Thực'";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if(rs.next());
            count = rs.getInt(1);
        con.connec.close();
        return count;
    }

    public int countKhachHangDaXacThuc() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(HOSOTAINAN.MaKhachHang) FROM HOSOTAINAN WHERE HOSOTAINAN.TrangThaiXacThuc = N'Đã Xác Thực'";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if(rs.next());
            count = rs.getInt(1);
        con.connec.close();
        return count;
    }
    // của tỉnh 
    
    public boolean dangKy(KhachHangBEAN kh) {
        String sql = " INSERT INTO dbo.KHACHHANG( MaKhachHang , HoTen ,DiaChi ,SoDienThoai ,SoTaiKhoan ,NganHang) VALUES  ( N'' ,?,?,?,?,?) ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, kh.getHoTen());
            ps.setString(2, kh.getDiaChi());
            ps.setString(3, kh.getSoDienThoai());
            ps.setString(4, kh.getSoTaiKhoan());
            ps.setString(5, kh.getNganHang());
            ps.executeUpdate();
            con.connec.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
   
    public boolean suaThongTinKhachHang(KhachHangBEAN kh) {
        String sql = " UPDATE KHACHHANG SET HoTen = ?, DiaChi = ?, SoDienThoai = ?, SoTaiKhoan = ?, NganHang = ?  WHERE MaKhachHang = ? ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, kh.getHoTen());
            ps.setString(2, kh.getDiaChi());
            ps.setString(3, kh.getSoDienThoai());
            ps.setString(4, kh.getSoTaiKhoan());
            ps.setString(5, kh.getNganHang());
            ps.setString(6, kh.getMaKhachHang());
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean boSungThongTinKhachHang(String maKhachHang, String soTaiKhoan, String nganHang) {
        String sql = " UPDATE KHACHHANG SET SoTaiKhoan = ?, NganHang = ? WHERE MaKhachHang = ? ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, soTaiKhoan);
            ps.setString(2, nganHang);
            ps.setString(3, maKhachHang);
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
