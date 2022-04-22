<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 4/22/2022
  Time: 7:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Currency Convert</title>
</head>
<body>
<h2>Currency convert to VND</h2>
<form action="/convert" method="get">
  <label>USD: </label>
  <input type="text" name="usd" required>
  <input type="submit" value="Convert">
</form>
</body>
</html>
