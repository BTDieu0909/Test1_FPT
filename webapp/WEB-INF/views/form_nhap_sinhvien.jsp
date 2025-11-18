<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Nhập thông tin tốt nghiệp</title></head>
<body>
<h2>Nhập thông tin sinh viên sau tốt nghiệp</h2>

<c:if test="${not empty errors}">
    <ul style="color: red">
        <c:forEach items="${errors}" var="e">
            <li>${e}</li>
        </c:forEach>
    </ul>
</c:if>

<form method="post" action="${pageContext.request.contextPath}/nhap-sinhvien">
    <fieldset>
        <legend>Thông tin sinh viên (SINHVIEN)</legend>
        Số CMND*: <input type="text" name="soCMND"/><br/>
        Họ tên: <input type="text" name="hoTen"/><br/>
        Email: <input type="email" name="email"/><br/>
        SĐT: <input type="text" name="soDT"/><br/>
        Địa chỉ: <input type="text" name="diaChi"/><br/>
        Ngày sinh: <input type="date" name="ngaySinh"/><br/>
        Giới tính:
        <select name="gioiTinh">
            <option value="">--Chọn--</option>
            <option value="M">Nam</option>
            <option value="F">Nữ</option>
        </select>
    </fieldset>

    <fieldset>
        <legend>Thông tin tốt nghiệp (TOT_NGHIEP)</legend>
        Trường*:
        <select name="maTruong">
            <option value="">--Chọn trường--</option>
            <c:forEach items="${listTruong}" var="t">
                <option value="${t.maTruong}">${t.maTruong} - ${t.tenTruong}</option>
            </c:forEach>
        </select><br/>

        Ngành*:
        <select name="maNganh">
            <option value="">--Chọn ngành--</option>
            <c:forEach items="${listNganh}" var="n">
                <option value="${n.maNganh}">${n.maNganh} - ${n.tenNganh}</option>
            </c:forEach>
        </select><br/>

        Ngày tốt nghiệp*: <input type="date" name="ngayTN"/><br/>
        Xếp loại: <input type="text" name="xepLoai"/><br/>
    </fieldset>

    <button type="submit">Lưu</button>
</form>

<p><a href="${pageContext.request.contextPath}/">Về trang chủ</a></p>
</body>
</html>
