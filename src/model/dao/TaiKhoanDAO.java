package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.MD5;
import model.bean.TaiKhoanBEAN;

public class TaiKhoanDAO {
    ConnectionDatabase con = new ConnectionDatabase();
    public boolean kiemTraTaiKhoan(String user, String pass, String quyen) throws SQLException {
        con.getConnection();
        String sql = "SELECT * FROM TAIKHOAN WHERE TenDangNhap = ? AND MatKhau = ? AND Quyen = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, user);
        cmd.setString(2, MD5.MaHoa(pass));
        cmd.setString(3, quyen);
        
        ResultSet rs = cmd.executeQuery();
        
        if(rs.next()){
            return true;
        }
        return false;
    }
    public int themTaiKhoan(String maNV, String matKhau, String maChucVu) throws SQLException {
        con.getConnection();
        String sql = "INSERT INTO TAIKHOAN (TenDangNhap, MatKhau, Quyen, MaNhanVien) VALUES (?,?,?,?)";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, maNV);
        cmd.setString(2, MD5.MaHoa(matKhau));
        cmd.setString(3, maChucVu);
        cmd.setString(4, maNV);
        
        int rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }
    public int xoaTaiKhoan(String id) throws SQLException {
        con.getConnection();
        String sql = "DELETE FROM TAIKHOAN WHERE TenDangNhap = ? ";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, id);
        int rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }
    
    //của Tỉnh
    public TaiKhoanBEAN dangNhap(String tenDangNhap, String matKhau) {
        String sql = "SELECT * FROM TAIKHOAN WHERE TenDangNhap = ? AND MatKhau = ? AND Quyen = N'KH' ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, tenDangNhap);
            ps.setString(2, matKhau);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                TaiKhoanBEAN tk = new TaiKhoanBEAN();
                tk.setTenDangNhap(rs.getString("TenDangNhap"));
                tk.setMatKhau(rs.getString("MatKhau"));
                tk.setQuyen(rs.getString("Quyen"));

                con.connec.close();
                return tk;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public String getHoTen(String tenDangNhap) {
        String sql = " SELECT HoTen FROM dbo.KHACHHANG INNER JOIN dbo.TAIKHOAN ON TAIKHOAN.MaKhachHang = KHACHHANG.MaKhachHang\r\n" + 
                " WHERE TenDangNhap = ? ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, tenDangNhap);
            ResultSet rs = ps.executeQuery();
            String name = "";
            if (rs.next()) {
                name = rs.getString("HoTen");
                con.connec.close();
                return name;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public String getMaKhachHang(String tenDangNhap) {
        String sql = " SELECT KHACHHANG.MaKhachHang FROM dbo.KHACHHANG INNER JOIN dbo.TAIKHOAN ON TAIKHOAN.MaKhachHang = KHACHHANG.MaKhachHang\r\n" + 
                " WHERE TenDangNhap = ? ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, tenDangNhap);
            ResultSet rs = ps.executeQuery();
            String name = "";
            if (rs.next()) {
                name = rs.getString("MaKhachHang");
                con.connec.close();
                return name;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean checkTaiKhoan(String tenDangNhap) {
        String sql = " SELECT * FROM TAIKHOAN WHERE TenDangNhap = ? ";
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
    
    public boolean checkMatKhau(String tenDangNhap, String matKhau) {
        String sql = " SELECT * FROM TAIKHOAN WHERE TenDangNhap = ? AND MatKhau = ? ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, tenDangNhap);
            ps.setString(2, matKhau);
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
    
    
    public boolean themTaiKhoan(TaiKhoanBEAN tk) {
        String sql = " INSERT INTO dbo.TAIKHOAN( TenDangNhap , MatKhau ,Quyen ,MaKhachHang ) VALUES  (?,?,N'KH',(SELECT TOP(1) MaKhachHang FROM dbo.KHACHHANG ORDER BY MaKhachHang DESC)) ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, tk.getTenDangNhap());
            ps.setString(2, tk.getMatKhau());
            ps.executeUpdate();
            con.connec.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean suaMatKhau(String tenDangNhap, String matKhau) {
        String sql = " UPDATE TAIKHOAN SET MatKhau = ? WHERE TenDangNhap = ? ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, matKhau);
            ps.setString(2, tenDangNhap);
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
