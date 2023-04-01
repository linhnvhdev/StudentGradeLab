<%-- 
    Document   : edit
    Created on : Mar 29, 2023, 5:03:15 PM
    Author     : linhnvhdev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Grade</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            int index = 0;
        %>
        <div class="container">
            <h1>${group.name} Grade</h1>
            <c:set var="index" value="0" />
            <form:form method="post" action="save" modelAttribute="gradeList">
                <input type="hidden" name="groupId" value="${group.id}"><!-- comment -->
                <table border="true" class="table">
                    <tr class="warning">
                        <th>Students</th>
                            <c:forEach items="${gradeTypes}" var="gradeType">
                            <th>${gradeType.grade_type}</th>
                            </c:forEach>
                    </tr>
                    <c:forEach items="${studentGrades.keySet()}" var="student">
                        <tr class="active">
                            <td>${student.name}</td>
                            <c:forEach items="${studentGrades.get(student)}" var="grade">
                                <td>
                                    <form:input path="grades[${index}].value" name="value" value="${grade.value}"/>
                                    <form:input type="hidden" path="grades[${index}].student_id" name="student_id" value="${student.id}" />
                                    <form:input type="hidden" path="grades[${index}].course_id" name="course_id" value="${grade.course_id}" />
                                    <form:input type="hidden" path="grades[${index}].semester_id" name="semester_id" value="${grade.semester_id}" />
                                    <form:input type="hidden" path="grades[${index}].grade_type" name="grade_type" value="${grade.grade_type}" />
                                </td>
                                <c:set var="index" value="${index + 1}" />
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </table>
                <input class="btn btn-warning" type="submit" value="save">
            </form:form>
        </div>
    </body>
</html>
