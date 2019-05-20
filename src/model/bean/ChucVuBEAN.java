package model.bean;

public class ChucVuBEAN {
    private String maChucVu;
    private String tenChucVu;
    
    
    public ChucVuBEAN() {
        super();
    }
    public ChucVuBEAN(String maChucVu, String tenChucVu) {
        super();
        this.maChucVu = maChucVu;
        this.tenChucVu = tenChucVu;
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
    /**
     * @return the tenChucVu
     */
    public String getTenChucVu() {
        return tenChucVu;
    }
    /**
     * @param tenChucVu the tenChucVu to set
     */
    public void setTenChucVu(String tenChucVu) {
        this.tenChucVu = tenChucVu;
    }
    
    
}
