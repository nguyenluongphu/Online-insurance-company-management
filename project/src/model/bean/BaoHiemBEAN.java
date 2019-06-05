package model.bean;

public class BaoHiemBEAN {
    private String maBaoHiem;
    private String loaiBaoHiem;
    private String moTa;
    private String anh;
    private Integer mucDenBu;
    
    public BaoHiemBEAN() {
        super();
    }

    public BaoHiemBEAN(String maBaoHiem, String loaiBaoHiem, String moTa, String anh,
            Integer mucDenBu) {
        super();
        this.maBaoHiem = maBaoHiem;
        this.loaiBaoHiem = loaiBaoHiem;
        this.moTa = moTa;
        this.anh = anh;
        this.mucDenBu = mucDenBu;
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
     * @return the loaiBaoHiem
     */
    public String getLoaiBaoHiem() {
        return loaiBaoHiem;
    }

    /**
     * @param loaiBaoHiem the loaiBaoHiem to set
     */
    public void setLoaiBaoHiem(String loaiBaoHiem) {
        this.loaiBaoHiem = loaiBaoHiem;
    }

    /**
     * @return the moTa
     */
    public String getMoTa() {
        return moTa;
    }

    /**
     * @param moTa the moTa to set
     */
    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    /**
     * @return the anh
     */
    public String getAnh() {
        return anh;
    }

    /**
     * @param anh the anh to set
     */
    public void setAnh(String anh) {
        this.anh = anh;
    }

 

    /**
     * @return the mucDenBu
     */
    public Integer getMucDenBu() {
        return mucDenBu;
    }

    /**
     * @param mucDenBu the mucDenBu to set
     */
    public void setMucDenBu(Integer mucDenBu) {
        this.mucDenBu = mucDenBu;
    }
  
    
    
}
