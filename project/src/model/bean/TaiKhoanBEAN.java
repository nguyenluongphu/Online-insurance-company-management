package model.bean;

public class TaiKhoanBEAN {
    private String tenDangNhap;
    private String matKhau;
    private String quyen;
    private String maNhanVien;
    private String maKhachHang;
    
    
    public TaiKhoanBEAN() {
        super();
    }
    
   
    public TaiKhoanBEAN(String tenDangNhap, String matKhau, String quyen, String maNhanVien, String maKhachHang) {
        super();
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.quyen = quyen;
        this.maNhanVien = maNhanVien;
        this.maKhachHang = maKhachHang;
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
     * @return the matKhau
     */
    public String getMatKhau() {
        return matKhau;
    }
    /**
     * @param matKhau the matKhau to set
     */
    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }
    /**
     * @return the quyen
     */
    public String getQuyen() {
        return quyen;
    }
    /**
     * @param quyen the quyen to set
     */
    public void setQuyen(String quyen) {
        this.quyen = quyen;
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
    
    
}
