<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kliis
  Date: 06.11.2021
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin history</title>
</head>
<body>
<jsp:include page="/pages/_header.jsp"/>

<div class="container ">
    <form action="/admin-history" method="post">
        <div class="row">
            <figure class="text-center gy-5">
                <h1 class="display-5">Find user history</h1>
            </figure>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-4 offset-md-4 gy-3">
                <select class="form-select" aria-label="Default select example" name="userInput">
                    <option selected>Select a user</option>
                    <c:forEach var="users" items="${requestScope.allUsers}">
                        <option value="${users}">${users}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col gy-3">
                <button class="btn btn-primary" type="submit">find</button>
            </div>
        </div>
    </form>
    <div class="row">
        <div class="col-md-3 offset-md-3 ">
            <ul class="list-group">
                <c:forEach var="content" items="${requestScope.history}">
                    <li class="list-group-item">${content}</li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

</body>
</html>
