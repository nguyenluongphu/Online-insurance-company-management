package model.bean;

public class XeBEAN {
    private String bienSo;
    private String loaiXe;
    private String maKhachHang;
    
    
    public XeBEAN() {
        super();
    }
    public XeBEAN(String bienSo, String loaiXe, String maKhachHang) {
        super();
        this.bienSo = bienSo;
        this.loaiXe = loaiXe;
        this.maKhachHang = maKhachHang;
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
     * @return the loaiXe
     */
    public String getLoaiXe() {
        return loaiXe;
    }
    /**
     * @param loaiXe the loaiXe to set
     */
    public void setLoaiXe(String loaiXe) {
        this.loaiXe = loaiXe;
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
