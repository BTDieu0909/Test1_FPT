<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Tìm kiếm việc làm</title></head>
<body>
<h2>Tìm kiếm thông tin tốt nghiệp và việc làm</h2>

<form method="post" action="${pageContext.request.contextPath}/tim-vieclam">
    Từ khóa (CMND / Tên công ty / Địa điểm):
    <input type="text" name="keyword" value="${keyword}"/>
    <button type="submit">Tìm</button>
</form>

<c:if test="${not empty result}">
    <h3>Kết quả:</h3>
    <table border="1" cellpadding="5">
        <thead>
            <tr>
                <th>SoCMND</th>
                <th>Ngành (Công ty)</th>
                <th>Tên Công Ty</th>
                <th>Thời Gian Làm</th>
                <th>Địa Chỉ Cty</th>
                <th>Vị Trí</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${result}" var="r">
                <tr>
                    <td>${r.soCMND}</td>
                    <td>${r.maNganh}</td>
                    <td>${r.tenCongTy}</td>
                    <td>${r.thoiGianLamViec}</td>

                    <td>${r.diaChiCongTy}</td>
                    <td>${r.viTriCongViec}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<p><a href="${pageContext.request.contextPath}/">Về trang chủ</a></p>
</body>
</html>