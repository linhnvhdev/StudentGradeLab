<%-- 
    Document   : student-transcript
    Created on : Apr 1, 2023, 5:22:06 PM
    Author     : linhnvhdev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Transcript</title>
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
            <h1>Transcript</h1>
            <br/>
            <br/>
            <br/>
            <table class="table">
                <tr class="warning">
                    <th>Term</th>
                    <th>Course Code</th>
                    <th>Course Name</th>
                    <th>Credit</th>
                    <th>Grade</th>
                    <th>Status</th>
                </tr>
                <c:forEach items="${curriculemCourse}" var="curCourse">
                    <tr class="active">
                        <td>${curCourse.term}</td>
                        <td>${curCourse.course.shortname}</td>
                        <td>${curCourse.course.name}</td>
                        <td>${curCourse.course.credit}</td>
                        <td>${averageGrades.get(curCourse.course.id)}</td>
                        <td>
                            <c:if test="${isPass.get(curCourse.course.id)}"><button class="btn btn-danger">Not passed</button></c:if>
                            <c:if test="${!isPass.get(curCourse.course.id)}"><button class="btn btn-success">Passed</button></c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
