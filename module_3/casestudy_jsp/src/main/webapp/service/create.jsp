<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 4/8/2022
  Time: 7:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer</title>
    <!-- fontaweasome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
    <link rel="stylesheet" href="/assert/bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/css/dataTables.bootstrap-4.1.3-dist.min.css">
    <link rel="stylesheet" href="/assert/css/base.css">
    <link rel="stylesheet" href="/assert/css/style.css">
    <style>
        body {
            padding: 10px;
            background: linear-gradient(
                    51deg, #ddecf6,#a076b1);
        }

        .container {
            width: 100%;
            max-width: 700px;
            background: #fff;
            padding: 25px 30px;
            border-radius: 5px;
        }

        .container .title {
            font-size: 25px;
            font-weight: 500;
            position: relative;
        }

        .container .title::before {
            content: "";
            left: 0;
            bottom: 0;
            position: absolute;
            height: 3px;
            width: 30px;
            background: linear-gradient(135deg, #71b7e6,#9b59b6);
        }

        .container form .user-details {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 20px 0 12px 0;
        }

        form .user-details .input-box {
            margin-bottom: 15px;
            width: calc(100% / 2 - 20px);
        }

        .user-details .input-box .details {
            display: block;
            font-weight: 500;
        }

        .user-details .input-box input,
        .user-details .input-box select{
            height: 45px;
            width: 100%;
            outline: none;
            border-radius: 5px;
            border: 1px solid #ccc;
            padding-left: 15px;
            font-size: 16px;
            border-bottom-width: 2px;
            transition: all 0.3s ease;
        }

        .user-details .input-box input:focus,
        .user-details .input-box input:valid,
        .user-details .input-box select:focus{
            border-color: #9b59b6;
        }

        form .gender-details .gender-title {
            font-size: 20px;
            font-weight: 500;
        }

        form .gender-details .category {
            display: inline-block;
            margin: 0 10px;
        }

        .gender-details .category input {
            transform: scale(1.2);
        }

        .gender-details label {
            font-size: 20px;
            font-weight: 500;
        }

        form .button {
            height: 45px;
        }

        form .button input {
            height: 100%;
            width: 100%;
            outline: none;
            color: #fff;
            background: linear-gradient(135deg, #71b7e6,#9b59b6);
            border: none;
            font-size: 18px;
            font-weight: 500;
            letter-spacing: 1px;
            border-radius: 5px;
        }

        form .button input:hover {
            background: linear-gradient(135deg,#9b59b6, #71b7e6);
            cursor: pointer;
        }

        @media screen and (max-width: 584px) {
            .container {
                max-width: 100%;
            }
            form .user-details .input-box {
                margin-bottom: 15px;
                width: 100%;
            }
            .container form .user-details{
                max-height: 300px;
                overflow-y: scroll;
            }
            .user-details::-webkit-scrollbar{
                width: 0;
            }
        }
    </style>
</head>
<body>
<div class="app">
    <div class="header">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">
                <img src="/assert/image/big-logo.png" alt="" class="nav-logo">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Employee</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Service</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contract</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>
    <p class="quick-menu">
        <a href="/customer">Quản lý khách hàng</a>
        <i class="fas fa-chevron-right"></i>
        <a href="/customer?action=create">Thêm mới dịch vụ</a>
    </p>
    <p class="">
        <a class="add-new" href="/customer?action=create">
            Thêm mới dịch vụ <i class="fas fa-user-plus"></i>
        </a>
    </p>
    <div class="container">
        <div class="title">Thêm Dịch Vụ</div>
        <form action="/service" method="post">
            <input type="hidden" name="action" value="create">
            <div class="user-details">
                <div class="input-box">
                    <span class="details">Mã dịch vụ</span>
                    <input type="text" required name="serviceId">
                </div>
                <div class="input-box">
                    <span class="details">Tên dịch vụ</span>
                    <input type="text" required name="serviceName">
                </div>
                <div class="input-box">
                    <span class="details">Diện tích</span>
                    <input type="text" required name="serviceArea">
                </div>
                <div class="input-box">
                    <span class="details">Phí dịch vụ</span>
                    <input type="text" required name="serviceCost">
                </div>
                <div class="input-box">
                    <span class="details">Số người tố đa</span>
                    <input type="text" required name="serviceMaxPeople">
                </div>
                <div class="input-box">
                    <span class="details">Loại dịch vụ</span>
                    <select name="serviceTypeId">
                        <c:forEach items="${serviceTypeList}" var="serviceType">
                            <option value="${serviceType.serviceTypeId}">${serviceType.serviceTypeName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-box">
                    <span class="details">Kiểu thuê</span>
                    <select name="rentTypeId">
                        <c:forEach items="${rentTypeList}" var="rentType">
                            <option value="${rentType.rentTypeId}">${rentType.rentTypeName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-box">
                    <span class="details">Tiêu chuẩn phòng</span>
                    <select name="standardRoom">
                        <c:forEach items="${standardRoomList}" var="standardRoom">
                            <option value="${standardRoom}">${standardRoom}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-box">
                    <span class="details">Mô tả</span>
                    <input type="text" required name="desc">
                </div>

                <div class="input-box">
                    <span class="details">Diện tích hồ bơi</span>
                    <input type="text" required name="poolArea">
                </div>
                <div class="input-box">
                    <span class="details">Số tầng</span>
                    <input type="number" required name="numberOfFloor">
                </div>
            </div>
            <div class="button">
                <input type="submit" value="Thêm mới">
            </div>
        </form>
    </div>
</div>
<script src="/assert/jquery/jquery-3.6.0.min.js"></script>
<script src="/assert/bootstrap-4.1.3-dist/js/popper.min.js"></script>
<script src="/assert/js/jquery.dataTables.min.js"></script>
<script src="/assert/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap-4.1.3-dist/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#list').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 10
        })
    })
</script>
</body>
</html>
