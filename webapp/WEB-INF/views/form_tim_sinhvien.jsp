<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Tìm kiếm sinh viên</title></head>
<body>
<h2>Tìm kiếm thông tin cơ bản sinh viên</h2>

<form method="post" action="${pageContext.request.contextPath}/tim-sinhvien">
    Từ khóa (CMND / Họ tên):
    <input type="text" name="keyword" value="${keyword}"/>
    <button type="submit">Tìm</button>
</form>

<c:if test="${not empty result}">
    <h3>Kết quả:</h3>
    <table border="1" cellpadding="5">
        <tr>
            <th>SoCMND</th>
            <th>HoTen</th>
            <th>Email</th>
            <th>SoDT</th>
            <th>DiaChi</th>
        </tr>
        <c:forEach items="${result}" var="sv">
            <tr>
                <td>${sv.soCMND}</td>
                <td>${sv.hoTen}</td>
                <td>${sv.email}</td>
                <td>${sv.soDT}</td>
                <td>${sv.diaChi}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<p><a href="${pageContext.request.contextPath}/">Về trang chủ</a></p>
</body>
</html>
