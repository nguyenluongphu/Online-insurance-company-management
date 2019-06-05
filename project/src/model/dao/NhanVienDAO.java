package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.bean.NhanVienBEAN;

public class NhanVienDAO {
    ConnectionDatabase con = new ConnectionDatabase();
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

    public List<NhanVienBEAN> getAllNhanVien(int pageid, int count) throws SQLException {
        con.getConnection();

        String sql = "SELECT * FROM NHANVIEN ORDER BY MaNhanVien OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setInt(1, pageid);
        cmd.setInt(2, count);
        ResultSet rs = cmd.executeQuery();
        List<NhanVienBEAN> dsNhanVien = new ArrayList<NhanVienBEAN>();
        while (rs.next()) {
            String maNhanVien = rs.getString("MaNhanVien");
            String hoTen = rs.getString("HoTen");
            Date ngaySinh = rs.getDate("NgaySinh");
            String gioiTinh = rs.getString("GioiTinh");
            String soDienThoai = rs.getString("SoDienThoai");
            String email = rs.getString("Email");
            String cmnd = rs.getString("CMND");
            String diaChi = rs.getString("DiaChi");
            String soTaiKhoan = rs.getString("SoTaiKhoan");
            String nganHang = rs.getString("NganHang");
            String maChucVu = rs.getString("MaChucVu");

            dsNhanVien.add(new NhanVienBEAN(maNhanVien, hoTen, ngaySinh, gioiTinh, soDienThoai, email, cmnd, diaChi,
                    soTaiKhoan, nganHang, maChucVu));
        }
        con.connec.close();
        rs.close();
        return dsNhanVien;
    }

    public int countNhanVien() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM NHANVIEN";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if (rs.next())
            ;
        count = rs.getInt(1);
        con.connec.close();
        return count;
    }

    public int themNhanVien(String hoTen, Date ngaySinh, String gioiTinh, String soDienThoai, String email, String cmnd,
            String diaChi, String soTaiKhoan, String nganHang, String maChucVu) throws SQLException {
        con.getConnection();
        String sql = "INSERT INTO NHANVIEN (MaNhanVien, HoTen, NgaySinh, GioiTinh, SoDienThoai, Email, CMND, DiaChi, SoTaiKhoan, NganHang, MaChucVu) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, "");
        cmd.setString(2, hoTen);
        cmd.setDate(3, new java.sql.Date(ngaySinh.getTime()));
        cmd.setString(4, gioiTinh);
        cmd.setString(5, soDienThoai);
        cmd.setString(6, email);
        cmd.setString(7, cmnd);
        cmd.setString(8, diaChi);
        cmd.setString(9, soTaiKhoan);
        cmd.setString(10, nganHang);
        cmd.setString(11, maChucVu);

        int rs = cmd.executeUpdate();
        return rs;
    }

    public int xoaNhanVien(String id) throws SQLException {
        con.getConnection();

        String sql = "DELETE FROM NHANVIEN WHERE MaNhanVien = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, id);
        int rs = cmd.executeUpdate();
        con.connec.close();
        return rs;

    }

    public NhanVienBEAN getNhanVien(String id) throws SQLException {
        con.getConnection();

        String sql = "SELECT * FROM NHANVIEN WHERE MaNhanVien = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, id);
        ResultSet rs = cmd.executeQuery();
        NhanVienBEAN nhanVienBEAN = null;
        if (rs.next()) {
            String maNhanVien = rs.getString("MaNhanVien");
            String hoTen = rs.getString("HoTen");
            Date ngaySinh = rs.getDate("NgaySinh");
            String gioiTinh = rs.getString("GioiTinh");
            String soDienThoai = rs.getString("SoDienThoai");
            String email = rs.getString("Email");
            String cmnd = rs.getString("CMND");
            String diaChi = rs.getString("DiaChi");
            String soTaiKhoan = rs.getString("SoTaiKhoan");
            String nganHang = rs.getString("NganHang");
            String maChucVu = rs.getString("MaChucVu");

            nhanVienBEAN = new NhanVienBEAN(maNhanVien, hoTen, ngaySinh, gioiTinh, soDienThoai, email, cmnd, diaChi,
                    soTaiKhoan, nganHang, maChucVu);
        }
        con.connec.close();
        rs.close();
        return nhanVienBEAN;
    }

    public int suaNhanVien(String maNhanVien, String hoTen, Date ngaySinh, String gioiTinh, String soDienThoai,
            String email, String cmnd, String diaChi, String soTaiKhoan, String nganHang, String maChucVu)
            throws SQLException {
        con.getConnection();

        String sql = "UPDATE NHANVIEN SET HoTen =?, NgaySinh =?, GioiTinh =?, SoDienThoai =?, Email =?, CMND =?, DiaChi =?, SoTaiKhoan =?, NganHang =?, MaChucVu =? WHERE MaNhanVien = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, hoTen);
        cmd.setDate(2, new java.sql.Date(ngaySinh.getTime()));
        cmd.setString(3, gioiTinh);
        cmd.setString(4, soDienThoai);
        cmd.setString(5, email);
        cmd.setString(6, cmnd);
        cmd.setString(7, diaChi);
        cmd.setString(8, soTaiKhoan);
        cmd.setString(9, nganHang);
        cmd.setString(10, maChucVu);
        cmd.setString(11, maNhanVien);

        int rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }

    public int countNhanVienTimKiem(String nd) throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM NHANVIEN WHERE MaNhanVien = ? OR HoTen LIKE ? OR DiaChi LIKE ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, '%' + nd + '%');
        cmd.setString(2, '%' + nd + '%');
        cmd.setString(3, '%' + nd + '%');

        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if (rs.next())
            ;
        count = rs.getInt(1);
        con.connec.close();
        return count;
    }

    public Object getAllNhanVienTimKiem(String nd, int pageid, int count) throws SQLException {
        con.getConnection();

        String sql = "SELECT * FROM NHANVIEN WHERE MaNhanVien = ? OR HoTen LIKE ? OR DiaChi LIKE ? ORDER BY MaNhanVien OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, '%' + nd + '%');
        cmd.setString(2, '%' + nd + '%');
        cmd.setString(3, '%' + nd + '%');
        cmd.setInt(4, pageid);
        cmd.setInt(5, count);
        ResultSet rs = cmd.executeQuery();
        List<NhanVienBEAN> dsNhanVien = new ArrayList<NhanVienBEAN>();
        while (rs.next()) {
            String maNhanVien = rs.getString("MaNhanVien");
            String hoTen = rs.getString("HoTen");
            Date ngaySinh = rs.getDate("NgaySinh");
            String gioiTinh = rs.getString("GioiTinh");
            String soDienThoai = rs.getString("SoDienThoai");
            String email = rs.getString("Email");
            String cmnd = rs.getString("CMND");
            String diaChi = rs.getString("DiaChi");
            String soTaiKhoan = rs.getString("SoTaiKhoan");
            String nganHang = rs.getString("NganHang");
            String maChucVu = rs.getString("MaChucVu");

            dsNhanVien.add(new NhanVienBEAN(maNhanVien, hoTen, ngaySinh, gioiTinh, soDienThoai, email, cmnd, diaChi,
                    soTaiKhoan, nganHang, maChucVu));
        }
        con.connec.close();
        rs.close();
        return dsNhanVien;
    }

    public String getTenNhanVien(String user) throws SQLException {
        con.getConnection();
        String sql = "SELECT * FROM NHANVIEN WHERE MaNhanVien = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, user);
        ResultSet rs = cmd.executeQuery();
        String ten = "";
        if (rs.next()) {
            ten = rs.getString("HoTen");
        }

        rs.close();
        con.connec.close();
        return ten;

    }

    public String getMaNhanVien(String cmnd) throws SQLException {
        con.getConnection();
        String sql = "SELECT * FROM NHANVIEN WHERE CMND = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, cmnd);
        ResultSet rs = cmd.executeQuery();
        String ma = "";
        if (rs.next()) {
            ma = rs.getString("MaNhanVien");
        }

        rs.close();
        con.connec.close();
        return ma;
    }

    public Object countNhanVienNam() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM NHANVIEN WHERE GioiTinh = N'Nam'";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if (rs.next())
            ;
        count = rs.getInt(1);
        con.connec.close();
        return count;
    }

    public Object countNhanVienNu() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM NHANVIEN WHERE GioiTinh = N'Nữ'";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if (rs.next())
            ;
        count = rs.getInt(1);
        con.connec.close();
        return count;
    }
}
