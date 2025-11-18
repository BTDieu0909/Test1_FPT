<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FPT Polytechnic - QL Việc Làm SV</title>
</head>
<body>

<ul>
    <li><a href="${pageContext.request.contextPath}/nhap-sinhvien">Nhập thông tin tốt nghiệp</a></li>
    <li><a href="${pageContext.request.contextPath}/tim-sinhvien">Tìm kiếm sinh viên</a></li>
    <li><a href="${pageContext.request.contextPath}/tim-vieclam">Tìm kiếm việc làm</a></li>
</ul>

<c:if test="${not empty message}">
    <p style="color: green">${message}</p>
</c:if>

</body>
</html>
