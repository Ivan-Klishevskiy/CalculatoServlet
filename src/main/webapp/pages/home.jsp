<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kliis
  Date: 30.10.2021
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<h1>Hello ${sessionScope.user.name}</h1>

<c:if test="${sessionScope.role!=null}">
    <a href="/admin-history">Admin history</a><br>
    <a href="/admin-status">Set status admin</a><br>
    <a href="/admin-delete">Delete by admin</a><br>
</c:if>

<c:if test="${sessionScope.user!=null}">
    <a href="/calculator">Calculator</a><br>
    <a href="/logout">Logout</a><br>
    <a href="/editing">Editing</a><br>
    <a href="/delete">Delete</a><br>
</c:if>

<c:if test="${sessionScope.user==null}">
    <a href="/registration">Registration</a><br>
    <a href="/authorization">Authorization</a><br>
</c:if>
</body>
</html>
