package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import common.DuLieuThongKe;
import model.bean.HoSoTaiNanBEAN;
import model.dao.HoSoTaiNanDAO;

public class HoSoTaiNanBO {
    HoSoTaiNanDAO hoSoTaiNanDAO = new HoSoTaiNanDAO();
    public int countHoSo() {
        try {
            return hoSoTaiNanDAO.countHoSo();
        } catch (SQLException e) {
            System.out.println("Loi dem ho so: " + e.getMessage());
            return 0;
        }
    }

    public List<HoSoTaiNanBEAN> getAllHoSo(int pageid, int count) {
        try {
            return hoSoTaiNanDAO.getAllHoSo(pageid, count);
        } catch (SQLException e) {
            System.out.println("Loi lay danh sach ho so: " + e.getMessage());
            return null;
        }
    }

    public HoSoTaiNanBEAN getHoSoTaiNan(String id) {
        try {
            return hoSoTaiNanDAO.getHoSoTaiNan(id);
        } catch (SQLException e) {
            System.out.println("Loi lay 1 ho so: " + e.getMessage());
            return null;
        }
    }

    public boolean capNhatNhanVienGiamDinh(String id, String maNV, String trangThai) {
        try {
            int rs = hoSoTaiNanDAO.capNhatNhanVienGiamDinh(id, maNV, trangThai);
            if(rs != 0)
                return true;
            return false;
        } catch (SQLException e) {
            System.out.println("Loi cap nhat ma nhan vien giam dinh ho so: " + e.getMessage());
            return false;
        }
    }

    public boolean xoaHoSo(String id) {
        int rs = 0;
        try {
            rs = hoSoTaiNanDAO.xoaHoSo(id);
            if(rs != 0)
                return true;
            return false;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.out.println("Loi xoa ho so: " + e.getMessage());
            return false;
        }
        
    }

    public boolean capNhatXacThucGiamDinh(String id, String mucDoThietHai, String mucDoDenBu, String lyDo,
            String xacNhanDenBu) {
        try {
            int rs = hoSoTaiNanDAO.capNhatNhanVienGiamDinh(id, mucDoThietHai, mucDoDenBu, lyDo, xacNhanDenBu);
            if(rs != 0)
                return true;
            return false;
        } catch (SQLException e) {
            System.out.println("Loi cap nhat giam dinh ho so: " + e.getMessage());
            return false;
        }
    }

    public boolean capNhatHoanThanhXacThuc(String idHoSo, String xacThuc) {
        try {
            int rs = hoSoTaiNanDAO.capNhatHoanThanhXacThuc(idHoSo, xacThuc);
            if(rs != 0)
                return true;
            return false;
        } catch (SQLException e) {
            System.out.println("Loi cap nhat xac thuc ho so: " + e.getMessage());
            return false;
        }
        
    }

    public int countHoSoTimKiem(String rs) {
        try {
            return hoSoTaiNanDAO.countHoSoTimKiem(rs);
        } catch (SQLException e) {
            System.out.println("Loi dem ho so: " + e.getMessage());
            return 0;
        }
    }

    public Object getAllHoSoTimKiem(String rs, int pageid, int count) {
        try {
            return hoSoTaiNanDAO.getAllHoSoTimKiem(rs, pageid, count);
        } catch (SQLException e) {
            System.out.println("Loi lay danh sach ho so: " + e.getMessage());
            return null;
        }
    }

     public int countKhachHangChuaXacThuc() {
        try {
            return hoSoTaiNanDAO.countKhachHangChuaXacThuc();
        } catch (SQLException e) {
            System.out.println("Loi dem khach hang chua xac thuc: "+ e.getMessage());
            return 0;
        }
    }

    public int countKhachHangDaXacThuc() {
        try {
            return hoSoTaiNanDAO.countKhachHangDaXacThuc();
        } catch (SQLException e) {
            System.out.println("Loi dem khach hang da xac thuc: "+ e.getMessage());
            return 0;
        }
    }

    public List<Integer> getDanhSachThangTaiNan() {
        try {
            return hoSoTaiNanDAO.getDanhSachThangTaiNan();
        } catch (SQLException e) {
            System.out.println("Loi lay ds thang tai nan: "+ e.getMessage());
            return null;
        }
    }

    public List<String> getAllNam() {
        try {
            return hoSoTaiNanDAO.getAllNam();
        } catch (SQLException e) {
            System.out.println("Loi get nam tai nan: "+ e.getMessage());
            return null;
        }
    }

    public List<Integer> getDanhSachThangTaiNan(String nam) {
        try {
            return hoSoTaiNanDAO.getDanhSachThangTaiNan(nam);
        } catch (SQLException e) {
            System.out.println("Loi dem thang tai nan theo nam: "+ e.getMessage());
            return null;
        }
    }

    public List<DuLieuThongKe> getDanhSachThangTaiNanPhanTram(String nam) {
        try {
            return hoSoTaiNanDAO.getDanhSachThangTaiNanPhanTram(nam);
        } catch (SQLException e) {
            System.out.println("Loi get nam tai nan: "+ e.getMessage());
            return null;
        }
    }
    public int countHoSoChoXacThuc() {
        try {
            return hoSoTaiNanDAO.countHoSoChoXacThuc();
        } catch (SQLException e) {
            System.out.println("Loi dem ho so cho xac thuc: "+ e.getMessage());
            return 0;
        }
    }
    //của tỉnh
    
    public boolean themHoSoTaiNan(String tenDangNhap, String bienSo, Date ngayXayRaTaiNan, String tenTaiXe,String coBangLaiChua, String moTaThietHai, String diaDiemTaiNan) {
        return hoSoTaiNanDAO.themHoSoTaiNan(tenDangNhap, bienSo, ngayXayRaTaiNan, tenTaiXe, coBangLaiChua, moTaThietHai, diaDiemTaiNan);
    }
    public ArrayList<HoSoTaiNanBEAN> getListHoSoTaiNan(String maKhachHang){
        return hoSoTaiNanDAO.getListHoSoTaiNan(maKhachHang);
    }

}
