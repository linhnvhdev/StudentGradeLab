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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="container">
            <br/>
            <br/>
            <br/>
        <h1>Course: ${course.name}</h1>
        <br/>
        <br/>
        <br/>
        <a href="/admin">Back</a> 
        <table border="true" class="table">
            <tr class="warning">
                <th>Grade Type</th>
                <th>Weight</th>
                <th>Fail score</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach items="${gradeTypes}" var="gradeType">
                <tr class="active">
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
        <a class="btn btn-warning" href="/grade/addType?id=${course.id}">Add</a> 
        </div>
    </body>
</html>
