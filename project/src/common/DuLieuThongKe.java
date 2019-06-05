package common;

public class DuLieuThongKe {
    private String thang;
    private Float phantram;
    
    public DuLieuThongKe(String thang, Float phantram) {
        super();
        this.thang = thang;
        this.phantram = phantram;
    }
    /**
     * @return the thang
     */
    public String getThang() {
        return thang;
    }
    /**
     * @param thang the thang to set
     */
    public void setThang(String thang) {
        this.thang = thang;
    }
    /**
     * @return the phantram
     */
    public Float getPhantram() {
        return phantram;
    }
    /**
     * @param phantram the phantram to set
     */
    public void setPhantram(Float phantram) {
        this.phantram = phantram;
    }
    
    
}
