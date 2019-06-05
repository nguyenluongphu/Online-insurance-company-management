package model.bo;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.bean.AnhBEAN;
import model.dao.AnhDAO;

public class AnhBO {
    AnhDAO anhDAO = new AnhDAO();
    public void UpLoadSingleFile(HttpServletRequest request) {
        anhDAO.UpLoadSingleFile(request);
    }
    public List<AnhBEAN> getListAnh() {
        return anhDAO.getListAnh();
    }
    public boolean themAnh(String path, String idHoSo) {
        try {
            int rs =  anhDAO.themAnh(path, idHoSo);
            if(rs != 0)
                return true;
            return false;
        } catch (SQLException e) {
            System.out.println("loi them anh:" + e.getMessage());
            return false;
        }
    }
    public List<AnhBEAN> getListAnh(String idHoSo) {
        try {
            return anhDAO.getListAnh(idHoSo);
        } catch (SQLException e) {
            System.out.println("loi lay anh:" + e.getMessage());
            return null;
        }
    }

}
