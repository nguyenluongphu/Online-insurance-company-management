package model.bean;

public class KhachHangBEAN {
    private String maKhachHang;
    private String hoTen;
    private String diaChi;
    private String soDienThoai;
    private String soTaiKhoan;
    private String nganHang;
    
    
    
    public KhachHangBEAN() {
        super();
    }
    public KhachHangBEAN(String maKhachHang, String hoTen, String diaChi, String soDienThoai, String soTaiKhoan,
            String nganHang) {
        super();
        this.maKhachHang = maKhachHang;
        this.hoTen = hoTen;
        this.diaChi = diaChi;
        this.soDienThoai = soDienThoai;
        this.soTaiKhoan = soTaiKhoan;
        this.nganHang = nganHang;
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
    
    
   
}
