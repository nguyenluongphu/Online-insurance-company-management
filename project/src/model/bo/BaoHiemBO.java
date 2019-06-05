package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.bean.BaoHiemBEAN;
import model.dao.BaoHiemDAO;

public class BaoHiemBO {
    BaoHiemDAO baoHiemDAO = new BaoHiemDAO();
    public int countBaoHiem() {
       try {
        return baoHiemDAO.countBaoHiem();
    } catch (SQLException e) {
       System.out.println("Loi dem so bao hiem: " + e.getMessage());
       return 0;
    }
    }
    public List<BaoHiemBEAN> getAllBaoHiem(int pageid, int count) {
        try {
            return baoHiemDAO.getAllBaoHiem(pageid, count);
        } catch (SQLException e) {
            System.out.println("Loi get ds bao hiem: " + e.getMessage());
            return null;
        }
    }
    public String themBaoHiem(String loaiBaoHiem, String moTa, String stmucDenBu) {
        try {
            Integer mucDenBu = Integer.parseInt(stmucDenBu);
            int rs = baoHiemDAO.themBaoHiem(loaiBaoHiem, moTa, mucDenBu);
            String maBH = "";
            if(rs != 0){
                maBH = baoHiemDAO.getMaBaoHiemMoi();
            }
            return maBH;
        } catch (SQLException e) {
            System.out.println("Loi them bao hiem: " + e.getMessage());
            return null;
        }
        
    }
    public boolean xoaBaoHiem(String id) {
        try {
            int rs = baoHiemDAO.xoaBaoHiem(id);
            if(rs != 0)
                return true;
            return false;
        } catch (SQLException e) {
            System.out.println("Loi xoa bao hiem: " + e.getMessage());
            return false;
        }
    }
    public void UpLoadSingleFile(HttpServletRequest request) {
        baoHiemDAO.UpLoadSingleFile(request);
    }
    public boolean themAnh(String path, String maBaoHiem) {
        try {
            int rs = baoHiemDAO.themAnh(path, maBaoHiem);
            if(rs != 0)
                return true;
            return false;
        } catch (SQLException e) {
            System.out.println("Loi them anh bao hiem: " + e.getMessage());
            return false;
        }
    }
    public BaoHiemBEAN getBaoHiem(String id) {
        try {
            return baoHiemDAO.getBaoHiem(id);
        } catch (SQLException e) {
            System.out.println("Loi get bao hiem theo id: " + e.getMessage());
            return null;
        }
    }
    public boolean suaBaoHiem(String maBaoHiem, String loaiBaoHiem, String moTa) {
       try {
        int rs = baoHiemDAO.suaBaoHiem(maBaoHiem, loaiBaoHiem, moTa);
        if(rs != 0)
            return true;
        return false;
    } catch (SQLException e) {
        System.out.println("Loi sua bao hiem: " + e.getMessage());
        return false;
    }
    }
    
    //của tỉnh
    public ArrayList<BaoHiemBEAN> getListBaoHiem(){
        return baoHiemDAO.getListBaoHiem();
    }
    public ArrayList<BaoHiemBEAN> getListBaoHiemByKey(String key){
        return baoHiemDAO.getListBaoHiemByKey(key);
    }
    public String getLoaiBaoHiem(String maBaoHiem) {
        return baoHiemDAO.getLoaiBaoHiem(maBaoHiem);
    }
}
