<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kliis
  Date: 06.11.2021
  Time: 23:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result history</title>
</head>
<body>
<a href="/admin-history">back</a><br><br>
<ul>
    <c:forEach var="op" items="${requestScope.history}">
        <li><c:out value="${op}"/></li>
    </c:forEach>
</ul>
</body>
</html>
