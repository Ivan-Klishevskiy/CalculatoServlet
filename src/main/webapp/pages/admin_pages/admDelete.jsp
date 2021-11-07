<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kliis
  Date: 07.11.2021
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete by admin</title>
</head>
<body>

<a href="/">Main page</a><br><br>

<h1>Delete by admin</h1>

<form action="/admin-delete" method="post">
    <input type="text" name="username" placeholder="Enter username">
    <button>Submit</button>
</form>

<p>${requestScope.message}</p>

<ul>
    <c:forEach var="users" items="${requestScope.allUsers}">
        <li><c:out value="${users}"/></li>
    </c:forEach>
</ul

</body>
</html>
