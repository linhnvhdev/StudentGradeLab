<%-- 
    Document   : admin-grades-list
    Created on : Apr 1, 2023, 2:51:06 AM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
        </head>
        <body>
            <table border="5px">
                <tr>
                    <td>Student</td>
                    <td>Student Code</td>
                    <td>Major</td>
                    <td>Semester</td>
                    <td>Average</td>
                </tr>
                <c:forEach items="${list}" var="l">
                    <tr>
                        <td>${l.value.student.name}</td>
                        <td>${l.value.student.user.password}</td>
                        <td>${l.value.student.curriculum.dept.major.name}</td>
                        <td>${l.value.semester.name}</td>
                        <td>${l.value.averageGrade}</td>
                    </tr>
                </c:forEach>
            </table>
        </body>
    </html>
</f:view>
