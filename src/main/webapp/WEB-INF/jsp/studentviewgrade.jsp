<%-- 
    Document   : test
    Created on : Mar 29, 2023, 11:12:00 AM
    Author     : linhnvhdev
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
                        <div class="row">
                            <div class="col-sm-12">
                                <font size="+2">Semester: </font>
                                <c:forEach items="${semesters}" var="semester">
                                    <c:if test="${semId ne semester.id}">
                                        <a class="btn btn-primary btn-lg m-4" href="viewgrade?sem=${semester.id}" role="button">${semester.name}</a>
                                    </c:if>
                                    <c:if test="${semId eq semester.id}">
                                        <a class="btn btn-info btn-lg m-4" href="viewgrade?sem=${semester.id}" role="button">${semester.name}</a>
                                    </c:if>
                                </c:forEach>
                                        <br/>
                                        <br/>
                                <div class="mt-4"><!-- comment --></div>
                                <font size="+2">Course: </font>
                                <c:forEach items="${courses}" var="course">
                                    <c:if test="${courseId ne course.id}">
                                        <a class="btn btn-warning btn-lg m-4" href="viewgrade?sem=${semId}&courseId=${course.id}">${course.shortname}</a>
                                    </c:if>
                                    <c:if test="${courseId eq course.id}">
                                        <a class="btn btn-info btn-lg m-4" href="viewgrade?sem=${semId}&courseId=${course.id}">${course.shortname}</a>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <br/>
                        <br/>
                        <table class="table">
                            <tr class="warning">
                                <th>Grade Type</th>
                                <th>Grade</th>
                            </tr>
                            <c:forEach items="${grades.keySet()}" var="grade">
                                <tr class="active">
                                    <td>${grade.grade_type}</td>
                                    <td>${grades.get(grade).value}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
        </body>
    </html>
</f:view>
