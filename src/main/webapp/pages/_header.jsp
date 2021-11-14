<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kliis
  Date: 12.11.2021
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">

                <c:if test="${sessionScope.user==null}">

                    <li class="nav-item">
                        <a class="nav-link disabled">Hello Guest</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/registration">Registration</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/authorization">Authorization</a>
                    </li>

                </c:if>


                <c:if test="${sessionScope.user!=null}">
                    <li class="nav-item">
                        <a class="navbar-brand" href="/">Hello ${sessionScope.user.name}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/calculator">Calculator</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Logout</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/editing">Editing</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/delete">Delete</a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.role!=null}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Admin
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/admin-history">Admin history</a></li>
                            <li><a class="dropdown-item" href="/admin-status">Set status admin</a></li>
                            <li><a class="dropdown-item" href="/admin-delete">Delete by admin</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
