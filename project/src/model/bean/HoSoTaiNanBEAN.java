package model.bean;

import java.util.Date;

public class HoSoTaiNanBEAN {
    private String maHoSo;
    private String maNhanVien;
    private String maKhachHang;
    private String bienSo;
    private Date ngayXayRaTaiNan;
    private String tenTaiXe;
    private String moTaThietHai;
    private String coBangLaiChua;
    private String diaDiemTaiNan;
    private Integer mucDoThietHai;
    private Integer mucDoDenBu;
    private String lyDo;
    private String xacNhanDenBu;
    private String trangThaiXacThuc;
    
    
    
    public HoSoTaiNanBEAN() {
        super();
    }


    public HoSoTaiNanBEAN(String maHoSo, String maNhanVien, String maKhachHang, String bienSo, Date ngayXayRaTaiNan,
            String tenTaiXe, String moTaThietHai, String coBangLaiChua, String diaDiemTaiNan, Integer mucDoThietHai,
            Integer mucDoDenBu, String lyDo, String xacNhanDenBu, String trangThaiXacThuc) {
        super();
        this.maHoSo = maHoSo;
        this.maNhanVien = maNhanVien;
        this.maKhachHang = maKhachHang;
        this.bienSo = bienSo;
        this.ngayXayRaTaiNan = ngayXayRaTaiNan;
        this.tenTaiXe = tenTaiXe;
        this.moTaThietHai = moTaThietHai;
        this.coBangLaiChua = coBangLaiChua;
        this.diaDiemTaiNan = diaDiemTaiNan;
        this.mucDoThietHai = mucDoThietHai;
        this.mucDoDenBu = mucDoDenBu;
        this.lyDo = lyDo;
        this.xacNhanDenBu = xacNhanDenBu;
        this.trangThaiXacThuc = trangThaiXacThuc;
    }
    
    
    public HoSoTaiNanBEAN(String maHoSo, String maNhanVien, String maKhachHang, String bienSo, Date ngayXayRaTaiNan,
            String tenTaiXe, String trangThaiXacThuc) {
        super();
        this.maHoSo = maHoSo;
        this.maNhanVien = maNhanVien;
        this.maKhachHang = maKhachHang;
        this.bienSo = bienSo;
        this.ngayXayRaTaiNan = ngayXayRaTaiNan;
        this.tenTaiXe = tenTaiXe;
        this.trangThaiXacThuc = trangThaiXacThuc;
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
     * @return the ngayXayRaTaiNan
     */
    public Date getNgayXayRaTaiNan() {
        return ngayXayRaTaiNan;
    }
    /**
     * @param ngayXayRaTaiNan the ngayXayRaTaiNan to set
     */
    public void setNgayXayRaTaiNan(Date ngayXayRaTaiNan) {
        this.ngayXayRaTaiNan = ngayXayRaTaiNan;
    }
    /**
     * @return the tenTaiXe
     */
    public String getTenTaiXe() {
        return tenTaiXe;
    }
    /**
     * @param tenTaiXe the tenTaiXe to set
     */
    public void setTenTaiXe(String tenTaiXe) {
        this.tenTaiXe = tenTaiXe;
    }
    /**
     * @return the moTaThietHai
     */
    public String getMoTaThietHai() {
        return moTaThietHai;
    }
    /**
     * @param moTaThietHai the moTaThietHai to set
     */
    public void setMoTaThietHai(String moTaThietHai) {
        this.moTaThietHai = moTaThietHai;
    }
    /**
     * @return the coBangLaiChua
     */
    public String getCoBangLaiChua() {
        return coBangLaiChua;
    }
    /**
     * @param coBangLaiChua the coBangLaiChua to set
     */
    public void setCoBangLaiChua(String coBangLaiChua) {
        this.coBangLaiChua = coBangLaiChua;
    }
    /**
     * @return the diaDiemTaiNan
     */
    public String getDiaDiemTaiNan() {
        return diaDiemTaiNan;
    }
    /**
     * @param diaDiemTaiNan the diaDiemTaiNan to set
     */
    public void setDiaDiemTaiNan(String diaDiemTaiNan) {
        this.diaDiemTaiNan = diaDiemTaiNan;
    }
    /**
     * @return the mucDoThietHai
     */
    public Integer getMucDoThietHai() {
        return mucDoThietHai;
    }
    /**
     * @param mucDoThietHai the mucDoThietHai to set
     */
    public void setMucDoThietHai(Integer mucDoThietHai) {
        this.mucDoThietHai = mucDoThietHai;
    }
    /**
     * @return the mucDoDenBu
     */
    public Integer getMucDoDenBu() {
        return mucDoDenBu;
    }
    /**
     * @param mucDoDenBu the mucDoDenBu to set
     */
    public void setMucDoDenBu(Integer mucDoDenBu) {
        this.mucDoDenBu = mucDoDenBu;
    }
    /**
     * @return the lyDo
     */
    public String getLyDo() {
        return lyDo;
    }
    /**
     * @param lyDo the lyDo to set
     */
    public void setLyDo(String lyDo) {
        this.lyDo = lyDo;
    }
    /**
     * @return the xacNhanDenBu
     */
    public String getXacNhanDenBu() {
        return xacNhanDenBu;
    }
    /**
     * @param xacNhanDenBu the xacNhanDenBu to set
     */
    public void setXacNhanDenBu(String xacNhanDenBu) {
        this.xacNhanDenBu = xacNhanDenBu;
    }
    /**
     * @return the trangThaiXacThuc
     */
    public String getTrangThaiXacThuc() {
        return trangThaiXacThuc;
    }
    /**
     * @param trangThaiXacThuc the trangThaiXacThuc to set
     */
    public void setTrangThaiXacThuc(String trangThaiXacThuc) {
        this.trangThaiXacThuc = trangThaiXacThuc;
    }
    
    
}
