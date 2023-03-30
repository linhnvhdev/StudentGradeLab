<%-- 
    Document   : gradeType
    Created on : Mar 29, 2023, 2:48:59 PM
    Author     : linhnvhdev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Grade Type</title>
    </head>
    <body>
        <h1>Course: ${course.name}</h1>
        <table border="true">
            <tr>
                <th>Grade Type</th>
                <th>Weight</th>
                <th>Fail score</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach items="${gradeTypes}" var="gradeType">
                <tr>
                    <td>
                        ${gradeType.grade_type}
                    </td>
                    <td>
                        ${gradeType.weight}
                    </td>
                    <td>
                        ${gradeType.failScore}
                    </td>
                    <td>
                        <a href="/grade/editType?id=${gradeType.course_id}&type=${gradeType.grade_type}">Edit</a>
                    </td>
                    <td>
                        <a href="/grade/deleteType?id=${gradeType.course_id}&type=${gradeType.grade_type}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="/grade/addType?id=${course.id}">Add</a> 
    </body>
</html>
