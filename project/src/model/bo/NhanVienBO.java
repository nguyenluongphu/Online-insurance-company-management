package model.bo;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import model.bean.NhanVienBEAN;
import model.dao.NhanVienDAO;

public class NhanVienBO {
    NhanVienDAO nhanVienDAO = new  NhanVienDAO();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    public List<NhanVienBEAN> getAllNhanVien(int pageid, int count) {
        try {
            return nhanVienDAO.getAllNhanVien(pageid, count);
        } catch (SQLException e) {
            System.out.println("Loi get nhan vien: " + e.getMessage());
            return null;
        }
//        } catch (ParseException e) {
//            System.out.println("Loi chuyen doi ngay thang get nhan vien: " + e.getMessage());
//            return null;
//        }
    }
    public int countNhanVien() {
        try {
            return nhanVienDAO.countNhanVien();
        } catch (SQLException e) {
            System.out.println("Loi dem nhan vien: " +e.getMessage());
            return 0;
        }
    }
    TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
    public boolean themNhanVien(String hoTen, String stngaySinh, String gioiTinh, String soDienThoai, String email,
            String cmnd, String diaChi, String soTaiKhoan, String nganHang, String maChucVu, String matKhau){
        Date ngaySinh;
        try {
            ngaySinh = sdf.parse(stngaySinh);
            int rs = nhanVienDAO.themNhanVien(hoTen, ngaySinh, gioiTinh, soDienThoai, email, cmnd, diaChi, soTaiKhoan, nganHang, maChucVu);
            String maNV = "";
            if(rs != 0){
                maNV = nhanVienDAO.getMaNhanVien(cmnd);
                if(maNV.equals("") == false){
                    if(taiKhoanBO.themTaiKhoan(maNV, matKhau, maChucVu))
                        return true;
                }
            }
            return false;
        } catch (ParseException e) {
            System.out.println("loi chuyen doi ngay thang them nhan vien: "+ e.getMessage());
            return false;
        } catch (SQLException e) {
            System.out.println("loi them nhan vien: "+ e.getMessage());
            return false;
        }
        
    }
    public boolean xoaNhanVien(String id) {
        try {
            int rs = nhanVienDAO.xoaNhanVien(id);
            if(rs != 0)
                return true;
            return false;
        } catch (SQLException e) {
            System.out.println("loi xoa nhan vien:" + e.getMessage());
            return false;
        }
    }
    public NhanVienBEAN getNhanVien(String id) {
        try {
            return nhanVienDAO.getNhanVien(id);
        } catch (SQLException e) {
            System.out.println("Loi get nhan vien: " + e.getMessage());
            return null;
        }
    }
    public boolean suaNhanVien(String maNhanVien, String hoTen, String stngaySinh, String gioiTinh, String soDienThoai, String email,
            String cmnd, String diaChi, String soTaiKhoan, String nganHang, String maChucVu) {
            try {
                Date ngaySinh = sdf.parse(stngaySinh);
                int rs = nhanVienDAO.suaNhanVien(maNhanVien, hoTen, ngaySinh, gioiTinh, soDienThoai, email, cmnd, diaChi, soTaiKhoan, nganHang, maChucVu);
                if(rs != 0)
                    return true;
                return false;
            } catch (SQLException e) {
               System.out.println("Lỗi sửa nhân viên: " + e.getMessage());
               return false;
            } catch (ParseException e) {
                System.out.println("Lỗi chuyển đổi ngày tháng trong sửa nhân viên: " + e.getMessage());
                return false;
            }
    }
    public Object getAllNhanVienTimKiem(String rs, int pageid, int count) {
        try {
            return nhanVienDAO.getAllNhanVienTimKiem(rs, pageid, count);
        } catch (SQLException e) {
            System.out.println("Loi get nhan vien: " + e.getMessage());
            return null;
        }
    }
    public int countNhanVienTimKiem(String rs) {
        try {
            return nhanVienDAO.countNhanVienTimKiem(rs);
        } catch (SQLException e) {
            System.out.println("Loi dem nhan vien: " +e.getMessage());
            return 0;
        }
    }
    public String getTenNhanVien(String user) {
        try {
            return nhanVienDAO.getTenNhanVien(user);
        } catch (SQLException e) {
            System.out.println("Loi lay ten nhan vien: " + e.getMessage());
            return null;
        }
    }
    public Object countNhanVienNam() {
        try {
            return nhanVienDAO.countNhanVienNam();
        } catch (SQLException e) {
            System.out.println("Loi dem nhan vien: " +e.getMessage());
            return 0;
        }
    }
    public Object countNhanVienNu() {
        try {
            return nhanVienDAO.countNhanVienNu();
        } catch (SQLException e) {
            System.out.println("Loi dem nhan vien: " +e.getMessage());
            return 0;
        }
    }

}
