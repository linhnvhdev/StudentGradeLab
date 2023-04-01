<%-- 
    Document   : admin-student-transcript
    Created on : Apr 1, 2023, 5:42:27 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Transcript</title>
    </head>
    <body>
        <h1>Transcript</h1>
        <table>
            <tr>
                <th>Term</th>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>Credit</th>
                <th>Grade</th>
                <th>Status</th>
            </tr>
            <c:forEach items="${curriculemCourse}" var="curCourse">
                <tr>
                    <td>${curCourse.term}</td>
                    <td>${curCourse.course.shortname}</td>
                    <td>${curCourse.course.name}</td>
                    <td>${curCourse.course.credit}</td>
                    <td>${averageGrades.get(curCourse.course.id)}</td>
                    <td>${isPass.get(curCourse.course.id)}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
