<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Tìm Kiếm Việc Làm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <a href="${pageContext.request.contextPath}/" class="text-decoration-none">&larr; Về trang chủ</a>

    <h2 class="text-center text-warning my-4">Tra Cứu Thông Tin Việc Làm</h2>

    <div class="row justify-content-center mb-4">
        <div class="col-md-8">
            <form method="post" action="${pageContext.request.contextPath}/tim-vieclam" class="d-flex shadow-sm">
                <input type="text" name="keyword" value="${keyword}" class="form-control form-control-lg rounded-0 rounded-start" placeholder="Nhập Tên công ty, địa chỉ...">
                <button type="submit" class="btn btn-warning text-white btn-lg rounded-0 rounded-end">Tìm Kiếm</button>
            </form>
        </div>
    </div>

    <c:if test="${not empty result}">
        <div class="card shadow-sm">
            <div class="card-header bg-secondary text-white">Danh sách việc làm</div>
            <div class="card-body p-0">
                <table class="table table-hover table-bordered mb-0">
                    <thead class="table-primary">
                        <tr>
                            <th>Số CMND</th>
                            <th>Mã Ngành (CTy)</th>
                            <th>Tên Công Ty</th>
                            <th>Thời Gian Làm</th>
                            <th>Địa Chỉ</th>
                            <th>Vị Trí</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${result}" var="r">
                            <tr>
                                <td>${r.soCMND}</td>
                                <td>${r.maNganh}</td>
                                <td class="fw-bold text-success">${r.tenCongTy}</td>
                                <td>${r.thoiGianLamViec}</td>
                                <td>${r.diaChiCongTy}</td>
                                <td><span class="badge bg-secondary">${r.viTriCongViec}</span></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>

    <c:if test="${empty result && not empty keyword}">
        <div class="alert alert-warning text-center">Không tìm thấy dữ liệu nào.</div>
    </c:if>
</div>
</body>
</html>