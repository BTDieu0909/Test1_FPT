<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Nhập Thông Tin Tốt Nghiệp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <a href="${pageContext.request.contextPath}/" class="text-decoration-none mb-3 d-inline-block">&larr; Quay lại Trang chủ</a>

    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Khai Báo Thông Tin Sinh Viên Tốt Nghiệp</h4>
        </div>
        <div class="card-body">

            <c:if test="${not empty errors}">
                <div class="alert alert-danger">
                    <ul class="mb-0">
                        <c:forEach items="${errors}" var="e">
                            <li>${e}</li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>

            <form method="post" action="${pageContext.request.contextPath}/nhap-sinhvien">
                <div class="row">
                    <div class="col-md-6 border-end">
                        <h5 class="text-secondary mb-3">I. Thông Tin Cá Nhân</h5>

                        <div class="mb-3">
                            <label class="form-label">Số CMND <span class="text-danger">*</span></label>
                            <input type="text" name="soCMND" class="form-control" placeholder="Nhập số CMND..." required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Họ Tên</label>
                            <input type="text" name="hoTen" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Số Điện Thoại</label>
                            <input type="text" name="soDT" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Địa Chỉ</label>
                            <textarea name="diaChi" class="form-control" rows="2"></textarea>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <h5 class="text-secondary mb-3">II. Thông Tin Tốt Nghiệp</h5>

                        <div class="mb-3">
                            <label class="form-label">Trường Tốt Nghiệp <span class="text-danger">*</span></label>
                            <select name="maTruong" class="form-select" required>
                                <option value="">-- Chọn trường --</option>
                                <c:forEach items="${listTruong}" var="t">
                                    <option value="${t.maTruong}">${t.tenTruong}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Ngành Tốt Nghiệp <span class="text-danger">*</span></label>
                            <select name="maNganh" class="form-select" required>
                                <option value="">-- Chọn ngành --</option>
                                <c:forEach items="${listNganh}" var="n">
                                    <option value="${n.maNganh}">${n.tenNganh}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Năm Tốt Nghiệp</label>
                                <input type="number" name="namTN" class="form-control" placeholder="VD: 2023">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Xếp Loại</label>
                                <select name="xepLoai" class="form-select">
                                    <option value="Gioi">Giỏi</option>
                                    <option value="Kha">Khá</option>
                                    <option value="TrungBinh">Trung Bình</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-success btn-lg px-5">Lưu Hồ Sơ</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>