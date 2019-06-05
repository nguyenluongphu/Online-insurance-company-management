package model.bo;

import java.sql.SQLException;
import java.util.List;

import model.bean.ChucVuBEAN;
import model.dao.ChucVuDAO;

public class ChucVuBO {
    ChucVuDAO chucVuDAO = new  ChucVuDAO();
    public List<ChucVuBEAN> getAllChucVu() {
        try {
            return chucVuDAO.getAllChucVu();
        } catch (SQLException e) {
            System.out.println("Loi lay danh sach chuc vu: " + e.getMessage());
            return null;
        }
    }

}
