<%--
  Created by IntelliJ IDEA.
  User: Kliis
  Date: 30.10.2021
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authorization</title>
</head>
<body>
<form action="/authorization" method="post">
    <input type="text" name="username" placeholder="Username" required pattern=^[a-zA-Z]+$>
    <input type="password" name="password" placeholder="Password" required>
    <button>Submit</button>
</form>
<p>${requestScope.message}</p>
</body>
</html>
