<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 3/30/2022
  Time: 4:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Update</title>
  </head>
  <body>
  <p>
    <a href="/users">Return the list</a>
  </p>
  <form method="post">
    <input type="hidden" name="id" value="${user.id}">
    <p>Name</p>
    <input type="text" value="${user.name}" name="name">
    <p>Email</p>
    <input type="email" value="${user.email}" name="email">
    <p>Country</p>
    <input type="text" value="${user.country}" name="country">
    <input type="submit" value="Cập Nhật">
  </form>
  </body>
</html>
