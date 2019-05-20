package model.bean;

public class AnhBEAN {
    private String maAnh;
    private String path;
    private String maHoSo;
    
    
    
    public AnhBEAN() {
        super();
    }
    public AnhBEAN(String maAnh, String path, String maHoSo) {
        super();
        this.maAnh = maAnh;
        this.path = path;
        this.maHoSo = maHoSo;
    }
    /**
     * @return the maAnh
     */
    public String getMaAnh() {
        return maAnh;
    }
    /**
     * @param maAnh the maAnh to set
     */
    public void setMaAnh(String maAnh) {
        this.maAnh = maAnh;
    }
    /**
     * @return the path
     */
    public String getPath() {
        return path;
    }
    /**
     * @param path the path to set
     */
    public void setPath(String path) {
        this.path = path;
    }
    /**
     * @return the maHoSo
     */
    public String getMaHoSo() {
        return maHoSo;
    }
    /**
     * @param maHoSo the maHoSo to set
     */
    public void setMaHoSo(String maHoSo) {
        this.maHoSo = maHoSo;
    }
    
    
}   
