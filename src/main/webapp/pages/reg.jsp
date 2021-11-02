<%--
  Created by IntelliJ IDEA.
  User: Kliis
  Date: 30.10.2021
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<form action="/registration" method="post">
    <input type="text" name="name" placeholder="Name" required pattern=^[a-zA-Z]+$>
    <input type="text" name="username" placeholder="Username" required pattern=^[a-zA-Z]+$>
    <input type="password" name="password" placeholder="Password" required>
    <button>Submit</button>
</form>
</body>
</html>
