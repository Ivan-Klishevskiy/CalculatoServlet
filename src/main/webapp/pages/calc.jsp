<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kliis
  Date: 30.10.2021
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/">Main page</a><br><br>
<form action="/calculator" method="post">
    <input type="number" name="firstNumber" placeholder="firstNumber" step="any">
    <select name="sign">
        <option disabled>Select sign</option>
        <option value="+"selected>+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
    </select>
    <input type="number" name="secondNumber" placeholder="secondNumber" step="any">
    <button>=</button>
    <span>${requestScope.result}</span>
</form>

<ul>
    <c:forEach var="record" items="${requestScope.history}">
        <li><c:out value="${record}"/></li>
    </c:forEach>
</ul>
</body>
</html>
