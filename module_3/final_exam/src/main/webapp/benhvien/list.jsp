<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 4/15/2022
  Time: 5:56 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List</title>
    <link rel="stylesheet" href="/asset/bootstrap-4.1.3-dist/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h2 class="text-center" style="color:red">Danh sách bệnh án</h2>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row p-lg-3">
        <div class="col-lg-12">
            <a href="/benhan?action=create" class="btn btn-success mt-lg-2">Thêm mới</a>
            <c:if test="${message!= null}">
                <p class="text-success text-center">${message}</p>
            </c:if>
            <table id="benhAn" class="table table-bordered mt-lg-2">
                <thead class="thead-light">
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Mã bệnh án</th>
                    <th scope="col">Mã bệnh nhân</th>
                    <th scope="col">Tên bệnh nhân</th>
                    <th scope="col">Ngày nhập viện</th>
                    <th scope="col">Ngày ra viện</th>
                    <th scope="col">Lý do</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach varStatus="loop" var="benhAn" items="${benhAnList}">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${benhAn.ma_benh_an}</td>
                        <td>${benhAn.ma_benh_nhan}</td>
                        <td>${benhAn.ten_benh_nhan}</td>
                        <td>${benhAn.ngay_nhap_vien}</td>
                        <td>${benhAn.ngay_ra_vien}</td>
                        <td>${benhAn.ly_do}</td>
                        <td>
                            <button type="button" class="btn btn-info">
                                <a href="/benhan?action=update&id=${benhAn.ma_benh_an}" class="text-white">Sửa</a>
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger" onclick="setValueForm('${benhAn.ma_benh_an}')"
                                    data-toggle="modal" data-target="#modalDelete">
                                Xóa
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Modal confirm delete -->
<div class="modal fade" id="modalDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="/benhan?action=delete">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa bệnh án</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input name="ma_benh_an" id="ma_benh_an" hidden>
                    Bạn có muốn xóa bệnh án này không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="/asset/jquery/jquery-3.6.0.min.js"></script>
<script src="/asset/bootstrap-4.1.3-dist/js/popper.min.js"></script>
<script src="/asset/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
<script src="/asset/bootstrap-4.1.3-dist/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#benhAn').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 2
        })
    })
</script>
<script>
    function setValueForm(id) {
        document.getElementById("ma_benh_an").value = id;
    }
</script>
</body>
</html>
