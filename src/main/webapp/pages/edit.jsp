<%--
  Created by IntelliJ IDEA.
  User: Kliis
  Date: 30.10.2021
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Editing</title>
</head>
<body>
<a href="/">Main page</a><br><br>
<form action="/editing" method="post">
    <h1>Enter old username and password</h1>
    <input type="text" name="username" placeholder="Username" required pattern=^[a-zA-Z]+$>
    <input type="password" name="password" placeholder="Password" required>
    <h1>Enter a new user and password</h1>
    <input type="text" name="newName" placeholder="new name" required pattern=^[a-zA-Z]+$>
    <input type="password" name="newPassword" placeholder="new password" required>
    <button>Submit</button>
</form>
</body>
</html>
