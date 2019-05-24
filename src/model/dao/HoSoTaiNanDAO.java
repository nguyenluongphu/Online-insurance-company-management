package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import common.DuLieuThongKe;
import model.bean.HoSoTaiNanBEAN;

public class HoSoTaiNanDAO {
    ConnectionDatabase con = new ConnectionDatabase();
    public int countHoSo() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM HOSOTAINAN";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if(rs.next());
            count = rs.getInt(1);
        con.connec.close();
        return count;
    }

    public List<HoSoTaiNanBEAN> getAllHoSo(int pageid, int count) throws SQLException {
        con.getConnection();
        
        String sql = "SELECT * FROM HOSOTAINAN ORDER BY MaHoSo OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setInt(1, pageid);
        cmd.setInt(2, count);
        
        ResultSet rs = cmd.executeQuery();
        List<HoSoTaiNanBEAN> dsHoSo = new ArrayList<HoSoTaiNanBEAN>();
        while(rs.next()){
            String maHoSo = rs.getString("MaHoSo");
            String maNhanVien = rs.getString("MaNhanVien");
            String maKhachHang = rs.getString("MaKhachHang");
            String bienSo = rs.getString("BienSo");
            Date ngayXayRaTaiNan = rs.getDate("NgayXayRaTaiNan");
            String tenTaiXe = rs.getString("TenTaiXe");
            String trangThaiXacThuc = rs.getString("TrangThaiXacThuc");
            dsHoSo.add(new HoSoTaiNanBEAN(maHoSo, maNhanVien, maKhachHang, bienSo, ngayXayRaTaiNan, tenTaiXe, trangThaiXacThuc));
        }
        con.connec.close();
        rs.close();
        return dsHoSo;
    }

    public HoSoTaiNanBEAN getHoSoTaiNan(String id) throws SQLException {
        con.getConnection();
        
        String sql = "SELECT * FROM HOSOTAINAN WHERE MaHoSo =?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, id);
        ResultSet rs = cmd.executeQuery();
        HoSoTaiNanBEAN hoSo = null;
        while(rs.next()){
            String maHoSo = rs.getString("MaHoSo");
            String maNhanVien = rs.getString("MaNhanVien");
            String maKhachHang = rs.getString("MaKhachHang");
            String bienSo = rs.getString("BienSo");
            Date ngayXayRaTaiNan = rs.getDate("NgayXayRaTaiNan");
            String tenTaiXe = rs.getString("TenTaiXe");
            String moTaThietHai = rs.getString("MoTaThietHai");
            String coBangLaiChua = rs.getString("CoBangLaiChua");
            String diaDiemTaiNan = rs.getString("DiaDiemTaiNan");
            Integer mucDoThietHai = rs.getInt("MucDoThietHai");
            Integer mucDoDenBu = rs.getInt("MucDoDenBu");
            String lyDo = rs.getString("LyDo");
            String xacNhanDenBu = rs.getString("XacNhanDenBu");
            String trangThaiXacThuc = rs.getString("TrangThaiXacThuc");
            hoSo = new HoSoTaiNanBEAN(maHoSo, maNhanVien, maKhachHang, bienSo, ngayXayRaTaiNan, tenTaiXe, moTaThietHai, coBangLaiChua, diaDiemTaiNan, mucDoThietHai, mucDoDenBu, lyDo, xacNhanDenBu, trangThaiXacThuc);
            
        }
        con.connec.close();
        rs.close();
        return hoSo;
    }

    public int capNhatNhanVienGiamDinh(String id, String maNV, String trangThai) throws SQLException {
        con.getConnection();
        String sql = "UPDATE HOSOTAINAN SET MaNhanVien =?, TrangThaiXacThuc = ?  WHERE MaHoSo =?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, maNV);
        cmd.setString(2, trangThai);
        cmd.setString(3, id);
        
        int rs = 0;
        rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }

    public int xoaHoSo(String id) throws SQLException {
        con.getConnection();
        String sql = "DELETE FROM HOSOTAINAN WHERE MaHoSo = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, id);
        
        int rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }

    public int capNhatNhanVienGiamDinh(String id, String mucDoThietHai, String mucDoDenBu, String lyDo,
            String xacNhanDenBu) throws SQLException {
        con.getConnection();
        String sql = "UPDATE HOSOTAINAN SET MucDoThietHai = ?, MucDoDenBu = ?, LyDo = ?, XacNhanDenBu = ?  WHERE MaHoSo =?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, mucDoThietHai);
        cmd.setString(2, mucDoDenBu);
        cmd.setString(3, lyDo);
        cmd.setString(4, xacNhanDenBu);
        cmd.setString(5, id);
        int rs = 0;
        rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }

    public int capNhatHoanThanhXacThuc(String idHoSo, String xacThuc) throws SQLException {
        con.getConnection();
        String sql = "UPDATE HOSOTAINAN SET TrangThaiXacThuc = ?  WHERE MaHoSo =?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, xacThuc);
        cmd.setString(2, idHoSo);
       
        int rs = 0;
        rs = cmd.executeUpdate();
        con.connec.close();
        return rs;
    }

    public int countHoSoTimKiem(String nd) throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(*) FROM HOSOTAINAN WHERE MaHoSo LIKE ? OR MaKhachHang LIKE ? OR DiaDiemTaiNan LIKE ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, '%'+nd+'%');
        cmd.setString(2, '%'+nd+'%');
        cmd.setString(3, '%'+nd+'%');
        
        ResultSet rs1 = cmd.executeQuery();
        int count = 0;
        if(rs1.next());
            count = rs1.getInt(1);
        con.connec.close();
        return count;
    }

    public Object getAllHoSoTimKiem(String nd, int pageid, int count) throws SQLException {
        con.getConnection();
        
        String sql = "SELECT * FROM HOSOTAINAN WHERE MaHoSo LIKE ? OR TenTaiXe LIKE ? OR TrangThaiXacThuc LIKE ? OR MaKhachHang LIKE ? OR DiaDiemTaiNan LIKE ? ORDER BY MaHoSo OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, '%'+nd+'%');
        cmd.setString(2, '%'+nd+'%');
        cmd.setString(3, '%'+nd+'%');
        cmd.setString(4, '%'+nd+'%');
        cmd.setString(5, '%'+nd+'%');
        cmd.setInt(6, pageid);
        cmd.setInt(7, count);
        ResultSet rs = cmd.executeQuery();
        List<HoSoTaiNanBEAN> dsHoSo = new ArrayList<HoSoTaiNanBEAN>();
        while(rs.next()){
            String maHoSo = rs.getString("MaHoSo");
            String maNhanVien = rs.getString("MaNhanVien");
            String maKhachHang = rs.getString("MaKhachHang");
            String bienSo = rs.getString("BienSo");
            Date ngayXayRaTaiNan = rs.getDate("NgayXayRaTaiNan");
            String tenTaiXe = rs.getString("TenTaiXe");
            String trangThaiXacThuc = rs.getString("TrangThaiXacThuc");
            dsHoSo.add(new HoSoTaiNanBEAN(maHoSo, maNhanVien, maKhachHang, bienSo, ngayXayRaTaiNan, tenTaiXe, trangThaiXacThuc));
        }
        con.connec.close();
        rs.close();
        return dsHoSo;
    }
    
    public int countKhachHangChuaXacThuc() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(HOSOTAINAN.MaKhachHang) FROM HOSOTAINAN WHERE HOSOTAINAN.TrangThaiXacThuc = N'Giám Định'";
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

    public List<Integer> getDanhSachThangTaiNan() throws SQLException {
        con.getConnection();
        List<Integer> dsThang = new ArrayList<Integer>();
        for(int i= 1; i<=12 ; i++){
            String sql = "SELECT COUNT(MaHoSo) FROM  HOSOTAINAN WHERE MONTH(NgayXayRaTaiNan) = ? AND YEAR(NgayXayRaTaiNan) = YEAR(GETDATE())";
            PreparedStatement cmd = con.connec.prepareStatement(sql);
            cmd.setInt(1, i);
            ResultSet rs = cmd.executeQuery();
            int count = 0;
            if(rs.next());
                count = rs.getInt(1);
            dsThang.add(count);
        }
        con.connec.close();
        return dsThang;
    }
    
    public List<String> getAllNam() throws SQLException {
        con.getConnection();
        List<String> dsNam = new ArrayList<String>();
        String sql = "SELECT DISTINCT YEAR(NgayXayRaTaiNan) FROM dbo.HOSOTAINAN";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        while(rs.next()){
            String nam = rs.getString(1);
            dsNam.add(nam);
        }
        con.connec.close();
        return dsNam;
    }

    public List<Integer> getDanhSachThangTaiNan(String nam) throws SQLException {
        con.getConnection();
        List<Integer> dsThang = new ArrayList<Integer>();
        for(int i= 1; i<=12 ; i++){
            String sql = "SELECT COUNT(MaHoSo) FROM  HOSOTAINAN WHERE MONTH(NgayXayRaTaiNan) = ? AND YEAR(NgayXayRaTaiNan) = ?";
            PreparedStatement cmd = con.connec.prepareStatement(sql);
            cmd.setInt(1, i);
            cmd.setString(2, nam);
            ResultSet rs = cmd.executeQuery();
            int count = 0;
            if(rs.next());
                count = rs.getInt(1);
            dsThang.add(count);
        }
        con.connec.close();
        return dsThang;
    }

    public int countTongSoTaiNan(String nam) throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(MaHoSo) FROM  HOSOTAINAN WHERE YEAR(NgayXayRaTaiNan) = ?";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        cmd.setString(1, nam);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if(rs.next());
            count = rs.getInt(1);
        return count;
    }
    
    public List<DuLieuThongKe> getDanhSachThangTaiNanPhanTram(String nam) throws SQLException {
        con.getConnection();
        List<DuLieuThongKe> dsThang = new ArrayList<DuLieuThongKe>();
        int tongSoTaiNan = countTongSoTaiNan(nam);
        for(int i= 1; i<=12 ; i++){
            String sql = "SELECT COUNT(MaHoSo) FROM  HOSOTAINAN WHERE MONTH(NgayXayRaTaiNan) = ? AND YEAR(NgayXayRaTaiNan) = ?";
            PreparedStatement cmd = con.connec.prepareStatement(sql);
            cmd.setInt(1, i);
            cmd.setString(2, nam);
            ResultSet rs = cmd.executeQuery();
            int count = 0;
            if(rs.next());
                count = rs.getInt(1);
                dsThang.add(new DuLieuThongKe("Tháng "+i, (float)count/tongSoTaiNan) );
        }
        con.connec.close();
        return dsThang;
    }
    public int countHoSoChoXacThuc() throws SQLException {
        con.getConnection();
        String sql = "SELECT COUNT(HOSOTAINAN.MaKhachHang) FROM HOSOTAINAN WHERE HOSOTAINAN.TrangThaiXacThuc = N'Xác Thực'";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        int count = 0;
        if(rs.next());
            count = rs.getInt(1);
        con.connec.close();
        return count;
    }
    //của Tỉnh
    
    public ArrayList<HoSoTaiNanBEAN> getListHoSoTaiNan(String maKhachHang){
        String sql = "  SELECT DISTINCT HOSOTAINAN.MaHoSo, HOSOTAINAN.MaNhanVien, HOSOTAINAN.BienSo,NgayXayRaTaiNan,TenTaiXe,CoBangLaiChua,DiaDiemTaiNan,MoTaThietHai,"
                + " (MucDoDenBu * BAOHIEM.MucDenBu)/ 100 AS SoTienDenBu ,XacNhanDenBu,LyDo  FROM dbo.HOSOTAINAN "
                + "INNER JOIN dbo.KHACHHANG ON KHACHHANG.MaKhachHang = HOSOTAINAN.MaKhachHang\r\n" 
                +  " INNER JOIN dbo.PHIEUMUABAOHIEM ON PHIEUMUABAOHIEM.MaKhachHang = KHACHHANG.MaKhachHang "
                + "INNER JOIN dbo.BAOHIEM ON dbo.BAOHIEM.MaBaoHiem = PHIEUMUABAOHIEM.MaBaoHiem\r\n"
                + " WHERE HOSOTAINAN.MaKhachHang = ? ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, maKhachHang);
            ResultSet rs = ps.executeQuery();
            ArrayList<HoSoTaiNanBEAN> list = new ArrayList<>();
            while(rs.next()) {
                HoSoTaiNanBEAN hstn = new HoSoTaiNanBEAN();
                hstn.setMaHoSo(rs.getString("MaHoSo"));
                hstn.setMaNhanVien(rs.getString("MaNhanVien"));
                hstn.setBienSo(rs.getString("BienSo"));
                hstn.setNgayXayRaTaiNan(rs.getDate("NgayXayRaTaiNan"));
                hstn.setTenTaiXe(rs.getString("TenTaiXe"));
                hstn.setCoBangLaiChua(rs.getString("CoBangLaiChua"));
                hstn.setDiaDiemTaiNan(rs.getString("DiaDiemTaiNan"));
                hstn.setMoTaThietHai(rs.getString("MoTaThietHai"));
                hstn.setMucDoDenBu(rs.getInt("SoTienDenBu"));
                hstn.setXacNhanDenBu(rs.getString("XacNhanDenBu"));
                hstn.setLyDo(rs.getString("LyDo"));
                
                list.add(hstn);
            }
            rs.close();
            con.connec.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean themHoSoTaiNan(String tenDangNhap, String bienSo, Date ngayXayRaTaiNan, String tenTaiXe,String coBangLaiChua, String moTaThietHai, String diaDiemTaiNan) {
        String sql = " INSERT INTO dbo.HOSOTAINAN( MaHoSo, MaKhachHang , BienSo ,NgayXayRaTaiNan \r\n" + 
                ",TenTaiXe ,MoTaThietHai ,CoBangLaiChua ,DiaDiemTaiNan, TrangThaiXacThuc)\r\n" + 
                "VALUES  ( N'' ,(SELECT MaKhachHang FROM dbo.TAIKHOAN WHERE TenDangNhap = ?) ,? , ? ,\r\n" + 
                " ? , ? , ? , ? ,N'Giám Định') ";
        try {
            con.getConnection();
            PreparedStatement ps = con.connec.prepareStatement(sql);
            ps.setString(1, tenDangNhap);
            ps.setString(2, bienSo);
            ps.setDate(3, new java.sql.Date(ngayXayRaTaiNan.getTime()));
            ps.setString(4, tenTaiXe);
            ps.setString(5, moTaThietHai);
            ps.setString(6, coBangLaiChua);
            ps.setString(7, diaDiemTaiNan);
            ps.executeUpdate();
            con.connec.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
}
