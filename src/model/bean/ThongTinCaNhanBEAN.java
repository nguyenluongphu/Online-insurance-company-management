package model.bean;

public class ThongTinCaNhanBEAN {
    private String tenDangNhap;
    private String hoTen;
    private String diaChi;
    private String soDienThoai;
    private String nganHang;
    private String soTaiKhoan;
    
    
    public ThongTinCaNhanBEAN() {
        super();
    }
    public ThongTinCaNhanBEAN(String tenDangNhap, String hoTen, String diaChi, String soDienThoai, String nganHang,
            String soTaiKhoan) {
        super();
        this.tenDangNhap = tenDangNhap;
        this.hoTen = hoTen;
        this.diaChi = diaChi;
        this.soDienThoai = soDienThoai;
        this.nganHang = nganHang;
        this.soTaiKhoan = soTaiKhoan;
    }
    /**
     * @return the tenDangNhap
     */
    public String getTenDangNhap() {
        return tenDangNhap;
    }
    /**
     * @param tenDangNhap the tenDangNhap to set
     */
    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
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
    
    
}
