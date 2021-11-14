<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kliis
  Date: 30.10.2021
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<jsp:include page="_header.jsp"/>


<div class="container">
    <div class="row justify-content-center">
        <figure class="text-center g-5">
            <h1 class="display-5">Delete account</h1>
        </figure>

        <form action="/delete" method="post">
            <div class="row justify-content-center">
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
            </div>
            <div class="row justify-content-center">
                <div class="col-md-3 offset-md-2 gy-3">
                    <button class="btn btn-primary" type="submit">Delete</button>
                </div>
            </div>
        </form>
        <div class="row justify-content-center">
            <div class="col-md-3 ">
                <c:if test="${requestScope.message!=null}">
                    <div class="alert alert-danger" role="alert">
                            ${requestScope.message}
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

</body>
</html>
