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

<jsp:include page="/pages/_header.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <figure class="text-center g-5">
            <h1 class="display-5">Delete user by admin</h1>
        </figure>
        <form action="/admin-delete" method="post">
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
                    <button class="btn btn-primary" type="submit">delete</button>
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
    </div>
</div>

<%--<div class="container ">--%>
<%--    <form action="/admin-history" method="post">--%>
<%--        <div class="row justify-content-center">--%>
<%--            <div class="col-md-3 offset-md-3  gy-5">--%>
<%--                <select class="form-select" aria-label="Default select example" name="userInput">--%>
<%--                    <option selected>Select a user</option>--%>
<%--                    <c:forEach var="users" items="${requestScope.allUsers}">--%>
<%--                        <option value="${users}">${users}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--            <div class="col gy-5">--%>
<%--                <button class="btn btn-primary" type="submit">find</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--    &lt;%&ndash;            <c:if test="${requestScope.errorMessage!=null}">&ndash;%&gt;--%>
<%--    &lt;%&ndash;                <div class="alert alert-danger" role="alert">&ndash;%&gt;--%>
<%--    &lt;%&ndash;                        ${requestScope.errorMessage}&ndash;%&gt;--%>
<%--    &lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--    &lt;%&ndash;            </c:if>&ndash;%&gt;--%>
<%--    &lt;%&ndash;            <c:if test="${requestScope.message!=null}">&ndash;%&gt;--%>
<%--    &lt;%&ndash;                <div class="alert alert-success" role="alert">&ndash;%&gt;--%>
<%--    &lt;%&ndash;                        ${requestScope.message}&ndash;%&gt;--%>
<%--    &lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--    &lt;%&ndash;            </c:if>&ndash;%&gt;--%>
<%--</div>--%>


<%--h1>Delete by admin</h1>--%>
<%--<p>${requestScope.message}</p>--%>
<%--<form action="/admin-delete" method="post">--%>
<%--    <ul>--%>
<%--        <c:forEach var="users" items="${requestScope.allUsers}">--%>
<%--            <li><c:out value="${users}"/>--%>
<%--                <button name="button" value="${users}">delete</button>--%>
<%--            </li>--%>
<%--        </c:forEach>--%>
<%--    </ul--%>
<%--</form>--%>


<%--<ul>--%>
<%--    <c:forEach var="users" items="${requestScope.allUsers}">--%>
<%--        <li><c:out value="${users}"/> <button>delete</button></li>--%>

<%--    </c:forEach>--%>
<%--</ul--%>

</body>
</html>
