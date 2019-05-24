package model.bo;


import model.bean.ThongTinCaNhanBEAN;
import model.dao.ThongTinCaNhanDAO;

public class ThongTinCaNhanBO {
    ThongTinCaNhanDAO thongTinCaNhanDAO = new ThongTinCaNhanDAO();
    public ThongTinCaNhanBEAN getThonTinCaNhan(String tenDangNhap){
        return thongTinCaNhanDAO.getThonTinCaNhan(tenDangNhap);
    }
}
