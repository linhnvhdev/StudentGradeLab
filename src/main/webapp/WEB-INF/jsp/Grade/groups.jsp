<%-- 
    Document   : groups
    Created on : Mar 30, 2023, 4:14:40 PM
    Author     : linhnvhdev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Groups</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="container">
            <blockquote class="blockquote-reverse">
                <h1>Welcome ${sessionScope.user.code}!</h1>
                <a href="/logout" class="btn btn-primary">Log out</a>
            </blockquote>
            <br/>
            <h1>Semesters</h1>
            <c:forEach items="${semesters}" var="semester">
                <a class="btn btn-primary" href="/grade/groups?semesterId=${semester.id}">
                    ${semester.name}
                </a>
            </c:forEach>
            <h1>My Groups</h1>
            <c:forEach items="${groups}" var="group">
                <div class="row">
                    <a class="btn btn-warning" href="/grade/group?id=${group.id}">${group.name}-${group.course.name}</a>
                </div>
            </c:forEach>
        </div>
    </body>
</html>

