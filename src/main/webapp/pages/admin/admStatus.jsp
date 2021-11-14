<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kliis
  Date: 06.11.2021
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin status</title>
</head>
<body>

<jsp:include page="/pages/_header.jsp"/>



<div class="container">
    <div class="row">
        <figure class="text-center gy-5">
            <h1 class="display-5">Set admin status</h1>
        </figure>
    </div>

    <div class="row justify-content-center">
        <form action="/admin-status" method="post">
            <div class="row justify-content-center">
                <div class="col-md-3 offset-md-4  gy-5">
                    <select class="form-select" aria-label="Default select example" name="userInput">
                        <option selected>Select a user</option>
                        <c:forEach var="users" items="${requestScope.allUsers}">
                            <option value="${users}">${users}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col gy-5">
                    <button class="btn btn-primary" type="submit">set admin</button>
                </div>
            </div>
        </form>
    </div>
    <div class="row">
        <div class="col-md-3 offset-md-4 ">
            <c:if test="${requestScope.errorMessage!=null}">
                <div class="alert alert-danger" role="alert">
                        ${requestScope.errorMessage}
                </div>
            </c:if>
            <c:if test="${requestScope.message!=null}">
                <div class="alert alert-success" role="alert">
                        ${requestScope.message}
                </div>
            </c:if>
        </div>







<%--<a href="/">Main page</a><br><br>--%>
<%--<h1>Set admin status by user id</h1>--%>
<%--<p>${requestScope.message}</p>--%>
<%--<form action="/admin-status" method="post">--%>
<%--    <ul>--%>
<%--        <c:forEach var="users" items="${requestScope.allUsers}">--%>
<%--            <li><c:out value="${users}"/><button name="button"  value="${users}">set admin</button></li>--%>
<%--        </c:forEach>--%>
<%--    </ul--%>
<%--</form>--%>




</body>
</html>
