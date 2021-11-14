<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<jsp:include page="_header.jsp"/>

<form action="/editing" method="post">
    <div class="row justify-content-center">

        <figure class="text-center g-5">
            <h1 class="display-5">Editing an account</h1>
        </figure>

        <div class="col-md-3">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInput" placeholder="username"
                       name="username" required>
                <label for="floatingInput">Username</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" placeholder="Password"
                       name="password" required>
                <label for="floatingPassword">Password</label>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingUser" placeholder="New name"
                       name="newName" required>
                <label for="floatingUser">New name</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingNewPassword" placeholder="New password"
                       name="newPassword" required>
                <label for="floatingNewPassword">New password</label>
            </div>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-3 offset-md-2 gy-3">
            <button class="btn btn-primary" type="submit">Change data</button>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-3 ">
            <c:if test="${requestScope.message!=null}">
                <div class="alert alert-danger" role="alert">
                        ${requestScope.message}
                </div>
            </c:if>
        </div>
    </div>
</form>
</body>
</html>
