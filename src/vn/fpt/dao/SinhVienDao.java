package vn.fpt.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import vn.fpt.model.Nganh;
import vn.fpt.model.SinhVien;
import vn.fpt.model.CongViec;
import vn.fpt.model.TotNghiep;
import vn.fpt.model.Truong;

import java.util.List;

@Repository
public class SinhVienDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // ================== 1. LẤY LIST TRƯỜNG ==================
    public List<Truong> findAllTruong() {
        String sql = "SELECT MaTruong, TenTruong FROM TRUONG ORDER BY TenTruong";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Truong t = new Truong();
            t.setMaTruong(rs.getString("MaTruong"));
            t.setTenTruong(rs.getString("TenTruong"));
            return t;
        });
    }

    // ================== 2. LẤY LIST NGÀNH ==================
    public List<Nganh> findAllNganh() {
        String sql = "SELECT MaNganh, TenNganh FROM NGANH ORDER BY TenNganh";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Nganh n = new Nganh();
            n.setMaNganh(rs.getString("MaNganh"));
            n.setTenNganh(rs.getString("TenNganh"));
            return n;
        });
    }

    // ================== 3. LƯU SINH VIÊN + TỐT NGHIỆP ==================
    public void insertSinhVienVaTotNghiep(SinhVien sv, TotNghiep tn) {
        // 3.1. Lưu bảng SINHVIEN (Chỉ 5 cột theo đúng Database của bạn)
        String sqlSv = "INSERT INTO SINHVIEN " +
                "(SoCMND, HoTen, Email, SoDT, DiaChi) " +
                "VALUES (?, ?, ?, ?, ?)";

        jdbcTemplate.update(sqlSv,
                sv.getSoCMND(),
                sv.getHoTen(),
                sv.getEmail(),
                sv.getSoDT(),
                sv.getDiaChi()
        );

        // 3.2. Lưu bảng TOT_NGHIEP
        String sqlTn = "INSERT INTO TOT_NGHIEP " +
                "(SoCMND, MaTruong, MaNganh, NamTN, XepLoai) " +
                "VALUES (?, ?, ?, ?, ?)";

        jdbcTemplate.update(sqlTn,
                sv.getSoCMND(),
                tn.getMaTruong(),
                tn.getMaNganh(),
                tn.getNamTN(),
                tn.getXepLoai()
        );
    }

    // ================== 4. TÌM KIẾM THÔNG TIN CƠ BẢN SINH VIÊN ==================
    public List<SinhVien> searchSinhVien(String keyword) {
        String kw = keyword == null ? "" : keyword.trim();

        // QUAN TRỌNG: Đã xóa 'GioiTinh' và thêm dấu cách trước chữ FROM
        String sql = "SELECT SoCMND, HoTen, Email, SoDT, DiaChi " +
                "FROM SINHVIEN " +
                "WHERE SoCMND = ? OR HoTen LIKE ?";

        System.out.println("searchSinhVien SQL: " + sql);

        return jdbcTemplate.query(
                sql,
                new Object[]{kw, "%" + kw + "%"},
                (rs, rowNum) -> {
                    SinhVien sv = new SinhVien();
                    sv.setSoCMND(rs.getString("SoCMND"));
                    sv.setHoTen(rs.getString("HoTen"));
                    sv.setEmail(rs.getString("Email"));
                    sv.setSoDT(rs.getString("SoDT"));
                    sv.setDiaChi(rs.getString("DiaChi"));
                    return sv;
                }
        );
    }

    // ================== 5. TÌM KIẾM THÔNG TIN VIỆC LÀM ==================
    // ================== 5. TÌM KIẾM THÔNG TIN VIỆC LÀM ==================
    public List<CongViec> searchViecLam(String keyword) {

        String like = "%" + keyword + "%";

        // SỬA: Dùng đúng tên cột như trong hình ảnh Database bạn gửi
        // Bỏ join TRUONG, NGANH, TOT_NGHIEP nếu không cần thiết, chỉ join SINHVIEN để lấy HoTen
        String sql =
                "SELECT sv.SoCMND, sv.HoTen, " +
                        "       vl.MaNganhVaoCongTy, vl.TenCongTy, " +
                        "       vl.ThoiGianLamViec, vl.DiaChiCongTy, vl.ViTriCongViec " +
                        "FROM CONG_VIEC vl " +
                        "JOIN SINHVIEN sv ON vl.SoCMND = sv.SoCMND " +
                        "WHERE sv.SoCMND LIKE ? " +
                        "   OR sv.HoTen LIKE ? " +
                        "   OR vl.DiaChiCongTy LIKE ?"; // Sửa NoiLamViec -> DiaChiCongTy

        return jdbcTemplate.query(sql,
                new Object[]{like, like, like},
                (rs, rowNum) -> {
                    CongViec tt = new CongViec();

                    // Mapping đúng cột từ database vào đối tượng Java
                    tt.setSoCMND(rs.getString("SoCMND"));

                    // Lưu ý: Nếu Class CongViec của bạn không có biến HoTen,
                    // bạn có thể tạm set nó vào 1 trường nào đó để hiển thị hoặc bỏ qua.
                    // Ở đây mình giữ nguyên logic map MaNganh theo cột db mới:
                    tt.setMaNganh   (rs.getString("MaNganhVaoCongTy"));

                    tt.setTenCongTy(rs.getString("TenCongTy"));
                    tt.setThoiGianLamViec(rs.getString("ThoiGianLamViec"));
                    tt.setDiaChiCongTy(rs.getString("DiaChiCongTy"));
                    tt.setViTriCongViec(rs.getString("ViTriCongViec"));

                    return tt;
                });
    }
}