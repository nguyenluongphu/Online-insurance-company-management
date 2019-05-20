package model.bean;

import java.util.Date;

public class PhieuMuaBaoHiemBEAN {
    private String maPhieuMuaBaoHiem;
    private String maKhachHang;
    private String maNhanVien;
    private String bienSo;
    private Date ngayMua;
    private String tinhTrangThanhToan;
    private String maBaoHiem;
    private String phuongThucThanhToan;
    private String soChoNgoi;
    private Integer thoiHan;
    private Integer soTienThucThu;
    private Integer soTienDaThanhToan;
    
    
    
    public PhieuMuaBaoHiemBEAN() {
        super();
    }
    public PhieuMuaBaoHiemBEAN(String maPhieuMuaBaoHiem, String maKhachHang, String maNhanVien, String bienSo,
            Date ngayMua, String tinhTrangThanhToan, String maBaoHiem, String phuongThucThanhToan, String soChoNgoi,
            Integer thoiHan,Integer soTienThucThu, Integer soTienDaThanhToan) {
        super();
        this.maPhieuMuaBaoHiem = maPhieuMuaBaoHiem;
        this.maKhachHang = maKhachHang;
        this.maNhanVien = maNhanVien;
        this.bienSo = bienSo;
        this.ngayMua = ngayMua;
        this.tinhTrangThanhToan = tinhTrangThanhToan;
        this.maBaoHiem = maBaoHiem;
        this.phuongThucThanhToan = phuongThucThanhToan;
        this.soChoNgoi = soChoNgoi;
        this.thoiHan = thoiHan;
        this.soTienThucThu = soTienThucThu;
        this.soTienDaThanhToan = soTienDaThanhToan;
    }
    /**
     * @return the maPhieuMuaBaoHiem
     */
    public String getMaPhieuMuaBaoHiem() {
        return maPhieuMuaBaoHiem;
    }
    /**
     * @param maPhieuMuaBaoHiem the maPhieuMuaBaoHiem to set
     */
    public void setMaPhieuMuaBaoHiem(String maPhieuMuaBaoHiem) {
        this.maPhieuMuaBaoHiem = maPhieuMuaBaoHiem;
    }
    /**
     * @return the maKhachHang
     */
    public String getMaKhachHang() {
        return maKhachHang;
    }
    /**
     * @param maKhachHang the maKhachHang to set
     */
    public void setMaKhachHang(String maKhachHang) {
        this.maKhachHang = maKhachHang;
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
     * @return the bienSo
     */
    public String getBienSo() {
        return bienSo;
    }
    /**
     * @param bienSo the bienSo to set
     */
    public void setBienSo(String bienSo) {
        this.bienSo = bienSo;
    }
    /**
     * @return the ngayMua
     */
    public Date getNgayMua() {
        return ngayMua;
    }
    /**
     * @param ngayMua the ngayMua to set
     */
    public void setNgayMua(Date ngayMua) {
        this.ngayMua = ngayMua;
    }
    /**
     * @return the tinhTrangThanhToan
     */
    public String getTinhTrangThanhToan() {
        return tinhTrangThanhToan;
    }
    /**
     * @param tinhTrangThanhToan the tinhTrangThanhToan to set
     */
    public void setTinhTrangThanhToan(String tinhTrangThanhToan) {
        this.tinhTrangThanhToan = tinhTrangThanhToan;
    }
    /**
     * @return the maBaoHiem
     */
    public String getMaBaoHiem() {
        return maBaoHiem;
    }
    /**
     * @param maBaoHiem the maBaoHiem to set
     */
    public void setMaBaoHiem(String maBaoHiem) {
        this.maBaoHiem = maBaoHiem;
    }
    /**
     * @return the phuongThucThanhToan
     */
    public String getPhuongThucThanhToan() {
        return phuongThucThanhToan;
    }
    /**
     * @param phuongThucThanhToan the phuongThucThanhToan to set
     */
    public void setPhuongThucThanhToan(String phuongThucThanhToan) {
        this.phuongThucThanhToan = phuongThucThanhToan;
    }
    /**
     * @return the soChoNgoi
     */
    public String getSoChoNgoi() {
        return soChoNgoi;
    }
    /**
     * @param soChoNgoi the soChoNgoi to set
     */
    public void setSoChoNgoi(String soChoNgoi) {
        this.soChoNgoi = soChoNgoi;
    }
    /**
     * @return the thoiHan
     */
    public Integer getThoiHan() {
        return thoiHan;
    }
    /**
     * @param thoiHan the thoiHan to set
     */
    public void setThoiHan(Integer thoiHan) {
        this.thoiHan = thoiHan;
    }

    /**
     * @return the soTienThucThu
     */
    public Integer getSoTienThucThu() {
        return soTienThucThu;
    }
    /**
     * @param soTienThucThu the soTienThucThu to set
     */
    public void setSoTienThucThu(Integer soTienThucThu) {
        this.soTienThucThu = soTienThucThu;
    }
    /**
     * @return the soTienDaThanhToan
     */
    public Integer getSoTienDaThanhToan() {
        return soTienDaThanhToan;
    }
    /**
     * @param soTienDaThanhToan the soTienDaThanhToan to set
     */
    public void setSoTienDaThanhToan(Integer soTienDaThanhToan) {
        this.soTienDaThanhToan = soTienDaThanhToan;
    }
    
   
}
