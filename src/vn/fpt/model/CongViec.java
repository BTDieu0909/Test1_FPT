package vn.fpt.model;

public class CongViec {
    private String soCMND;       // FK SINHVIEN
    private String maNganh;   // mã ngành vào công ty
    private String tenCongTy;
    private String thoiGianLamViec;
    private String diaChiCongTy;
    private String viTriCongViec;

    public String getSoCMND() {
        return soCMND;
    }

    public void setSoCMND(String soCMND) {
        this.soCMND = soCMND;
    }



    public String getMaNganh() { // Getter chuẩn
        return maNganh;
    }
    public void setMaNganh(String maNganh) {
        this.maNganh = maNganh;
    }

    public String getTenCongTy() {
        return tenCongTy;
    }

    public void setTenCongTy(String tenCongTy) {
        this.tenCongTy = tenCongTy;
    }

    public String getThoiGianLamViec() {
        return thoiGianLamViec;
    }

    public void setThoiGianLamViec(String thoiGianLamViec) {
        this.thoiGianLamViec = thoiGianLamViec;
    }

    public String getDiaChiCongTy() {
        return diaChiCongTy;
    }

    public void setDiaChiCongTy(String diaChiCongTy) {
        this.diaChiCongTy = diaChiCongTy;
    }

    public String getViTriCongViec() {
        return viTriCongViec;
    }

    public void setViTriCongViec(String viTriCongViec) {
        this.viTriCongViec = viTriCongViec;
    }
}
