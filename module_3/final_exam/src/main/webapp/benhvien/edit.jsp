<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 4/15/2022
  Time: 12:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Edit</title>
  <link rel="stylesheet" href="/asset/bootstrap-4.1.3-dist/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
  <div class="row p-lg-3">
    <div class="col-lg-12">
      <h3 class="text-center">Sửa bệnh án</h3>
      <form action="/benhan?action=update&id=${benhAn.ma_benh_an}" method="post">
        <div class="form-group">
          <label for="price0">Mã bệnh án</label>
          <input type="text" value="${benhAn.ma_benh_an}" class="form-control" id="price0"
                 required readonly>
        </div>
        <div class="form-group">
          <label for="pricea">Mã bệnh nhân</label>
          <input type="text" value="${benhAn.ma_benh_nhan}" class="form-control" id="pricea"
                 required readonly>
        </div>
        <div class="form-group">
          <label for="category">Tên bệnh nhân</label>
          <select class="form-control" id="category" name="ma_benh_nhan" required>
            <c:forEach var="benhNhan" items="${benhNhanList}">
              <c:choose>
                <c:when test="${benhNhan.ma_benh_nhan == benhAn.ma_benh_nhan}">
                  <option selected value="${benhNhan.ma_benh_nhan}">${benhNhan.ten_benh_nhan}</option>
                </c:when>
                <c:otherwise>
                  <option value="${benhNhan.ma_benh_nhan}">${benhNhan.ten_benh_nhan}</option>
                </c:otherwise>
              </c:choose>
              <%--                            <option value="${benhNhan.ma_benh_nhan}">${benhNhan.ten_benh_nhan}</option>--%>
            </c:forEach>
          </select>
        </div>
        <div class="form-group">
          <label for="price1">Ngày nhập viện</label>
          <input type="date" value="${benhAn.ngay_nhap_vien}" class="form-control" id="price1"
                 name="ngay_nhap_vien" required>
        </div>
        <div class="form-group">
          <label for="price2">Ngày ra viện</label>
          <input type="date" value="${benhAn.ngay_ra_vien}" class="form-control" id="price2"
                 name="ngay_ra_vien" required>
        </div>
        <div class="form-group">
          <label for="price3">Lý do</label>
          <input type="text" value="${benhAn.ly_do}" class="form-control" id="price3" name="ly_do" required>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </div>
  </div>
</div>
</body>
</html>