<%--
  Created by IntelliJ IDEA.
  User: Kliis
  Date: 30.10.2021
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="_header.jsp"/>


<div class="container">
    <div class="row justify-content-center">
        <figure class="text-center g-5">
            <h1 class="display-5">Calculator</h1>
        </figure>
    </div>

    <form action="/calculator" method="post">
        <div class="row justify-content-center">
            <div class="col-md-2">
                <input type="number" class="form-control" id="InputFirst" placeholder="firstValue"
                       name="firstNumber" required>
            </div>
            <div class="col-md-1">
                <select class="form-select" aria-label="Default select example" name="sign">
                    <option disabled>sign</option>
                    <option value="+" selected>+</option>
                    <option value="-">-</option>
                    <option value="*">*</option>
                    <option value="/">/</option>
                </select>
            </div>
            <div class="col-md-2">
                <input type="number" class="form-control" id="InputSecond" placeholder="firstValue"
                       name="secondNumber" required>
            </div>
            <div class="col-1">
                <button class="btn btn-primary" type="submit" >result</button>
            </div>
            <div class="col-md-1">
                <ul class="list-group">
                    <c:if test="${requestScope.result!=null}">
                        <input class="form-control" type="text" placeholder="${requestScope.result}" readonly>
                    </c:if>
                    <c:if test="${requestScope.result==null}">
                        <input class="form-control" type="text" placeholder="...." readonly>
                    </c:if>
                </ul>
            </div>
        </div>
    </form>
    <div class="row justify-content-center">
        <div class="col-md-2 ">
            <ul class="list-group">
                <c:forEach var="record" items="${requestScope.history}">
                    <li class="list-group-item">${record}</li>
                </c:forEach>
            </ul>
        </div>
    </div>


</div>


<%--<form action="/calculator" method="post">--%>
<%--    <input type="number" name="firstNumber" placeholder="firstNumber" step="any">--%>
<%--    <select name="sign">--%>
<%--        <option disabled>Select sign</option>--%>
<%--        <option value="+" selected>+</option>--%>
<%--        <option value="-">-</option>--%>
<%--        <option value="*">*</option>--%>
<%--        <option value="/">/</option>--%>
<%--    </select>--%>
<%--    <input type="number" name="secondNumber" placeholder="secondNumber" step="any">--%>
<%--    <button>=</button>--%>
<%--    <span>${requestScope.result}</span>--%>
<%--</form>--%>

<%--<ul>--%>
<%--    <c:forEach var="record" items="${requestScope.history}">--%>
<%--        <li><c:out value="${record}"/></li>--%>
<%--    </c:forEach>--%>
<%--</ul>--%>
</body>
</html>
