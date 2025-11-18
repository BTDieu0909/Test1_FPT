package vn.fpt.model;

import java.sql.Date;

public class TotNghiep {
    private String soCMND;   // FK SINHVIEN
    private String maTruong; // FK TRUONG
    private String maNganh;  // FK NGANH
    private Integer namTN;
    private String xepLoai;

    public String getSoCMND() {
        return soCMND;
    }

    public void setSoCMND(String soCMND) {
        this.soCMND = soCMND;
    }

    public String getMaTruong() {
        return maTruong;
    }

    public void setMaTruong(String maTruong) {
        this.maTruong = maTruong;
    }

    public String getMaNganh() {
        return maNganh;
    }

    public void setMaNganh(String maNganh) {
        this.maNganh = maNganh;
    }

    public Integer getNamTN() {
        return namTN;
    }

    public void setNamTN(Integer namTN) {
        this.namTN = namTN;
    }

    public String getXepLoai() {
        return xepLoai;
    }

    public void setXepLoai(String xepLoai) {
        this.xepLoai = xepLoai;
    }
}
