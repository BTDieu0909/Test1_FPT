package vn.fpt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import vn.fpt.dao.SinhVienDao;
import vn.fpt.model.SinhVien;
import vn.fpt.model.TotNghiep;
import vn.fpt.model.CongViec;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/") // base url
public class HomeController {

    private final SinhVienDao sinhVienDao;

    @Autowired
    public HomeController(SinhVienDao sinhVienDao) {
        this.sinhVienDao = sinhVienDao;
    }

    // Trang chủ
    @GetMapping
    public String home() {
        return "trang_chu";
    }

    // ---- YÊU CẦU 2: FORM NHẬP THÔNG TIN TỐT NGHIỆP ----

    // Hiển thị form
    @GetMapping("nhap-sinhvien")
    public String showFormNhap(Model model) {
        model.addAttribute("sv", new SinhVien());
        model.addAttribute("tn", new TotNghiep());
        model.addAttribute("listTruong", sinhVienDao.findAllTruong());
        model.addAttribute("listNganh", sinhVienDao.findAllNganh());
        return "form_nhap_sinhvien";
    }

    // Xử lý submit form
    @PostMapping("nhap-sinhvien")
    public String handleNhap(HttpServletRequest request, Model model) {

        String soCMND = request.getParameter("soCMND");
        String hoTen = request.getParameter("hoTen");
        String email = request.getParameter("email");
        String soDT = request.getParameter("soDT");
        String diaChi = request.getParameter("diaChi");


        String maTruong = request.getParameter("maTruong");
        String maNganh = request.getParameter("maNganh");
        String xepLoai = request.getParameter("xepLoai");

        List<String> errors = new ArrayList<>();

        if (soCMND == null || soCMND.trim().isEmpty()) {
            errors.add("Số CMND bắt buộc nhập");
        }
        if (maTruong == null || maTruong.trim().isEmpty()) {
            errors.add("Mã trường bắt buộc nhập");
        }
        if (maNganh == null || maNganh.trim().isEmpty()) {
            errors.add("Mã ngành bắt buộc nhập");
        }



        if (!errors.isEmpty()) {
            model.addAttribute("errors", errors);
            model.addAttribute("listTruong", sinhVienDao.findAllTruong());
            model.addAttribute("listNganh", sinhVienDao.findAllNganh());
            return "form_nhap_sinhvien";
        }

        SinhVien sv = new SinhVien();
        sv.setSoCMND(soCMND);
        sv.setHoTen(hoTen);
        sv.setEmail(email);
        sv.setSoDT(soDT);
        sv.setDiaChi(diaChi);

        TotNghiep tn = new TotNghiep();
        tn.setMaTruong(maTruong);
        tn.setMaNganh(maNganh);

        tn.setXepLoai(xepLoai);

        sinhVienDao.insertSinhVienVaTotNghiep(sv, tn);

        model.addAttribute("message", "Lưu thông tin thành công!");
        return "trang_chu";
    }

    // ---- YÊU CẦU 3: TÌM KIẾM ----

    // Form 1: tìm kiếm thông tin cơ bản
    @GetMapping("tim-sinhvien")
    public String showFormTimSV() {
        return "form_tim_sinhvien";
    }

    @PostMapping("tim-sinhvien")
    public String handleTimSV(@RequestParam("keyword") String keyword, Model model) {
        List<SinhVien> list = sinhVienDao.searchSinhVien(keyword);
        model.addAttribute("result", list);
        model.addAttribute("keyword", keyword);
        return "form_tim_sinhvien";
    }

    // Form 2: tìm kiếm thông tin tốt nghiệp + việc làm
    @GetMapping("tim-vieclam")
    public String showFormTimVL() {
        return "form_tim_vieclam";
    }

    @PostMapping("tim-vieclam")
    public String handleTimVL(@RequestParam("keyword") String keyword, Model model) {
        List<CongViec> list = sinhVienDao.searchViecLam(keyword);
        model.addAttribute("result", list);
        model.addAttribute("keyword", keyword);
        return "form_tim_vieclam";
    }

    @GetMapping("/tim-sinhvien-kq")
    public String ketQuaTimSinhVien(
            @RequestParam("keyword") String keyword,
            Model model) {

        List<SinhVien> ds = sinhVienDao.searchSinhVien(keyword);
        System.out.println("KQ tim sinh vien size = " + ds.size());

        model.addAttribute("keyword", keyword);
        model.addAttribute("dsSinhVien", ds);
        return "ketqua-sinhvien";  // tên JSP hiển thị kết quả
    }

}
