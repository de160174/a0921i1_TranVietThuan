<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 3/21/2022
  Time: 6:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang danh sách sinh viên</h1>
<table border="1" style="border-collapse:  collapse">
    <tr>
        <th>STT</th>
        <th>Id</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Birthday</th>
        <th>Point</th>
        <th>Xếp loại</th>
        <th>Account</th>
        <th>class Name</th>
        <th>Email</th>
    </tr>
    <c:forEach items="${studentList}" var="student" varStatus="item">
    <tr>
        <td>${item.count}</td>
        <td>${student.id}</td>
        <td>${student.name}</td>

        <c:if test="${student.gender}">
            <td>Nam</td>
        </c:if>
        <c:if test="${!student.gender}">
            <td>Nữ</td>
        </c:if>

        <td>${student.birthday}</td>
        <td>${student.point}</td>
        <c:choose>
            <c:when test="${student.point>=8}">
                <td>Giỏi</td>
            </c:when>
            <c:when test="${student.point>=7}">
                <td>Khá</td>
            </c:when>
            <c:when test="${student.point>=5}">
                <td>TrungBinh</td>
            </c:when>
            <c:otherwise>
                <td>Yếu</td>
            </c:otherwise>
        </c:choose>
        <td>${student.account}</td>

<%--        Hiện thị theo classid--%>
        <td>${student.classId}</td>

<%--    Dùng để hiện thị tên lớp theo id-lớp --%>
<%--        <c:forEach items="${classList}" var="c1">--%>
<%--            <c:if test="${c1.id==student.classId}">--%>
<%--                <td>${c1.className}</td>--%>
<%--            </c:if>--%>
<%--        </c:forEach>--%>

<%--        <td>${student.email}</td>--%>
        <td><c:out value="${student.email}"></c:out></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
