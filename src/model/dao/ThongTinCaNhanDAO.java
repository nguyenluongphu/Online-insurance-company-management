package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.ThongTinCaNhanBEAN;

public class ThongTinCaNhanDAO {

    ConnectionDatabase con = new ConnectionDatabase();
    public ThongTinCaNhanBEAN getThonTinCaNhan(String tenDangNhap){
        String sql = " SELECT HoTen,DiaChi,SoDienThoai,TenDangNhap,NganHang,SoTaiKhoan \n" + 
                "FROM dbo.KHACHHANG INNER JOIN dbo.TAIKHOAN ON TAIKHOAN.MaKhachHang = KHACHHANG.MaKhachHang\n" + 
                "WHERE TenDangNhap = ? ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, tenDangNhap);
            ResultSet rs = ps.executeQuery();
            ThongTinCaNhanBEAN ttcn = new ThongTinCaNhanBEAN();
            while(rs.next()) {
                ttcn.setTenDangNhap(rs.getString("TenDangNhap"));
                ttcn.setHoTen(rs.getString("HoTen"));
                ttcn.setDiaChi(rs.getString("DiaChi"));
                ttcn.setSoDienThoai(rs.getString("SoDienThoai"));
                ttcn.setNganHang(rs.getString("NganHang"));
                ttcn.setSoTaiKhoan(rs.getString("SoTaiKhoan"));
                
            }
            rs.close();
            con.connec.close();
            return ttcn;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
