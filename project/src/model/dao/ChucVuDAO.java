package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.bean.ChucVuBEAN;

public class ChucVuDAO {
    ConnectionDatabase con = new  ConnectionDatabase();
    public List<ChucVuBEAN> getAllChucVu() throws SQLException {
        con.getConnection();
        
        String sql ="SELECT * FROM CHUCVU";
        PreparedStatement cmd = con.connec.prepareStatement(sql);
        ResultSet rs = cmd.executeQuery();
        
        List<ChucVuBEAN> dsChucVu = new ArrayList<ChucVuBEAN>();
        
        while(rs.next()){
            String maChucVu = rs.getString("MaChucVu");
            String tenChucVu = rs.getString("TenChucVu");
            dsChucVu.add(new ChucVuBEAN(maChucVu, tenChucVu));
        }
        
        rs.close();
        con.connec.close();
        return dsChucVu;
    }

}
