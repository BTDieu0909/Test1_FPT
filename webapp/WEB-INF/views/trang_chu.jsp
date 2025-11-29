<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hệ Thống Quản Lý Việc Làm Sinh Viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 50px 0; }
        .feature-card { transition: transform 0.3s; cursor: pointer; }
        .feature-card:hover { transform: translateY(-5px); }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">QL Sinh Viên FPT</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/nhap-sinhvien">Nhập Liệu</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/tim-sinhvien">Tìm Sinh Viên</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/tim-vieclam">Tìm Việc Làm</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="hero-section text-center mb-5">
    <div class="container">
        <h1 class="display-4">Hệ Thống Theo Dõi Việc Làm</h1>
        <p class="lead">Quản lý hồ sơ sinh viên, tốt nghiệp và tình trạng việc làm sau khi ra trường.</p>
    </div>
</div>

<div class="container">
    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Thành công!</strong> ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <div class="row g-4">
        <div class="col-md-4">
            <div class="card h-100 feature-card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title text-primary">Khai Báo Tốt Nghiệp</h5>
                    <p class="card-text">Nhập thông tin sinh viên và hồ sơ tốt nghiệp mới.</p>
                    <a href="${pageContext.request.contextPath}/nhap-sinhvien" class="btn btn-outline-primary mt-2">Truy cập</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 feature-card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title text-success">Tìm Kiếm Sinh Viên</h5>
                    <p class="card-text">Tra cứu thông tin cá nhân và liên lạc của sinh viên.</p>
                    <a href="${pageContext.request.contextPath}/tim-sinhvien" class="btn btn-outline-success mt-2">Truy cập</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 feature-card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title text-warning">Thống Kê Việc Làm</h5>
                    <p class="card-text">Xem chi tiết công ty và vị trí làm việc của cựu sinh viên.</p>
                    <a href="${pageContext.request.contextPath}/tim-vieclam" class="btn btn-outline-warning mt-2">Truy cập</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>