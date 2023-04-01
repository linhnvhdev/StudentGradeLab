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
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </head>
        <body>
            <blockquote class="blockquote-reverse">
                    <h1>Welcome admin!</h1>
                    <a href="/logout" class="btn btn-primary">Log out</a>
                </blockquote>
            <font size="+1">
                <br/>
                <br/>
                <br/>
                <div class="container">
                    <h2>Choose major, semester and kind of sort</h2>
                    <br/>
                    <div class="row" style="background-color: darkorange">
                        <form action="/admin/admin-grades-list" method="get">
                            Semester : <select name="s_sort">
                                <option value="0"
                                        <c:if test="${0 == s_sort}">selected</c:if>
                                            >None                        
                                        </option>
                                <c:forEach items="${semesters}" var="sem">
                                    <option value="${sem.id}"
                                            <c:if test="${sem.id == s_sort}">selected</c:if>
                                                >
                                            ${sem.name}</option>
                                    </c:forEach>
                            </select>
                            Major : <select name="m_sort">
                                <option value="0"
                                        <c:if test="${0 == m_sort}">selected</c:if>
                                            >None                        
                                        </option>
                                <c:forEach items="${majors}" var="sem">
                                    <option value="${sem.id}"
                                            <c:if test="${sem.id == m_sort}">selected</c:if>
                                                >
                                            ${sem.name}</option>
                                    </c:forEach>
                            </select>
                            Sort: <select name="g_sort">
                                <option value="none"
                                        <c:if test="${g_sort == 'none'}">selected</c:if>
                                            >None                        
                                        </option>
                                        <option value="asc"
                                        <c:if test="${g_sort == 'asc'}">selected</c:if>
                                            >Grade ascending</option>
                                        <option value="desc"
                                        <c:if test="${g_sort == 'desc'}">selected</c:if> 
                                            >Grade descending</option>
                                </select>
                                <input name="submit" value="Filter" type="submit" />
                        </div>
                        </form>
                        <br/>
                        <br/>
                        <br/>
                        <table border="5px" class="table">
                            <tr class="warning">
                                <td>Student</td>
                                <td>Student Code</td>
                                <td>Major</td>
                                <td>Semester</td>
                                <td>Average</td>
                            </tr>
                        <c:forEach items="${list}" var="l">
                            <tr class="active">
                                <td><a href="/admin/admin-grades-list/student?id=${l.value.student.id}">${l.value.student.name}</a></td>
                                <td>${l.value.student.user.code}</td>
                                <td>${l.value.student.curriculum.dept.major.name}</td>
                                <td>${l.value.semester.name}</td>
                                <td>${l.value.averageGrade}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <button>
                        <a href="/admin/admin-grades-list/export">Export to excel</a>
                    </button>
                        <a class="btn btn-warning" href="/admin">Back</a>
                </div>
            </font>
        </body>
    </html>
</f:view>
