package model.bean;

import java.util.Date;

public class NhanVienBEAN {
    private String maNhanVien;
    private String hoTen;
    private Date ngaySinh;
    private String gioiTinh;
    private String soDienThoai;
    private String email;
    private String cmnd;
    private String diaChi;
    private String soTaiKhoan;
    private String nganHang;
    private String maChucVu;
    
    
    public NhanVienBEAN() {
        super();
    }
    public NhanVienBEAN(String maNhanVien, String hoTen, Date ngaySinh, String gioiTinh, String soDienThoai,
            String email, String cmnd, String diaChi, String soTaiKhoan, String nganHang, String maChucVu) {
        super();
        this.maNhanVien = maNhanVien;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
        this.gioiTinh = gioiTinh;
        this.soDienThoai = soDienThoai;
        this.email = email;
        this.cmnd = cmnd;
        this.diaChi = diaChi;
        this.soTaiKhoan = soTaiKhoan;
        this.nganHang = nganHang;
        this.maChucVu = maChucVu;
    }
    /**
     * @return the maNhanVien
     */
    public String getMaNhanVien() {
        return maNhanVien;
    }
    /**
     * @param maNhanVien the maNhanVien to set
     */
    public void setMaNhanVien(String maNhanVien) {
        this.maNhanVien = maNhanVien;
    }
    /**
     * @return the hoTen
     */
    public String getHoTen() {
        return hoTen;
    }
    /**
     * @param hoTen the hoTen to set
     */
    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }
    /**
     * @return the ngaySinh
     */
    public Date getNgaySinh() {
        return ngaySinh;
    }
    /**
     * @param ngaySinh the ngaySinh to set
     */
    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }
    /**
     * @return the gioiTinh
     */
    public String getGioiTinh() {
        return gioiTinh;
    }
    /**
     * @param gioiTinh the gioiTinh to set
     */
    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }
    /**
     * @return the soDienThoai
     */
    public String getSoDienThoai() {
        return soDienThoai;
    }
    /**
     * @param soDienThoai the soDienThoai to set
     */
    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }
    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }
    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    /**
     * @return the cmnd
     */
    public String getCmnd() {
        return cmnd;
    }
    /**
     * @param cmnd the cmnd to set
     */
    public void setCmnd(String cmnd) {
        this.cmnd = cmnd;
    }
    /**
     * @return the diaChi
     */
    public String getDiaChi() {
        return diaChi;
    }
    /**
     * @param diaChi the diaChi to set
     */
    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
    /**
     * @return the soTaiKhoan
     */
    public String getSoTaiKhoan() {
        return soTaiKhoan;
    }
    /**
     * @param soTaiKhoan the soTaiKhoan to set
     */
    public void setSoTaiKhoan(String soTaiKhoan) {
        this.soTaiKhoan = soTaiKhoan;
    }
    /**
     * @return the nganHang
     */
    public String getNganHang() {
        return nganHang;
    }
    /**
     * @param nganHang the nganHang to set
     */
    public void setNganHang(String nganHang) {
        this.nganHang = nganHang;
    }
    /**
     * @return the maChucVu
     */
    public String getMaChucVu() {
        return maChucVu;
    }
    /**
     * @param maChucVu the maChucVu to set
     */
    public void setMaChucVu(String maChucVu) {
        this.maChucVu = maChucVu;
    }
    
    
    
}
