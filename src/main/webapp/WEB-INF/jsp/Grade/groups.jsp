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
    </head>
    <body>
        <h1>Semesters</h1>
        <c:forEach items="${semesters}" var="semester">
            <a href="/grade/groups?semesterId=${semester.id}">
              ${semester.name}
            </a>
        </c:forEach>
        <h1>My Groups</h1>
        <c:forEach items="${groups}" var="group">
            <div>
                <a href="/grade/group?id=${group.id}">${group.name}</a>
            </div>
        </c:forEach>
    </body>
</html>
    
