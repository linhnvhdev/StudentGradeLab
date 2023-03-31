<%-- 
    Document   : edit
    Created on : Mar 29, 2023, 5:03:15 PM
    Author     : linhnvhdev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Grade</title>
    </head>
    <body>
        <h1>${group.name} Grade</h1>
        <button>
            <a href="/grade/group/excel?groupId=${group.id}">Export to excel</a>
        </button>
        <table border="true">
            <tr>
                <th>Students</th>
                <c:forEach items="${gradeTypes}" var="gradeType">
                <th>${gradeType.grade_type}</th>
                </c:forEach>
                <th>Average grade</th>
                <th>Status</th>
            </tr>
            <c:forEach items="${studentGrades.keySet()}" var="student">
            <tr>
                <td>${student.name}</td>
                <c:forEach items="${studentGrades.get(student)}" var="grade">
                <td>${grade.value}</td>
                </c:forEach>
                <td>${averageGrades.get(student)}</td>
                <td>${isPass.get(student) ? "Pass" : "Not pass"}</td>
            </tr>
            </c:forEach>
        </table>
        <a href="/grade/edit?id=${group.id}">
            Edit
        </a>
    </body>
</html>
