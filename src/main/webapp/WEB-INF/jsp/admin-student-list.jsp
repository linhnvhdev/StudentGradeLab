<%-- 
    Document   : admin-student-list
    Created on : Mar 29, 2023, 5:05:57 PM
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
        <h1>Student List</h1>
        <body>
            <table border="5px">
                <tr>
                    <td>ID</td>
                    <td>name</td>
                    <td>dob</td>
                    <td>gender</td>
                    <td>curriculum</td>
                    <td>semester</td>
                    <td>user ID</td>
                    <td>Student password</td>
                    <td>term</td>
                    <td></td>
                </tr>
                <c:forEach items="${stud}" var="s">
                    <tr>
                        <td>${s.id}</td>
                        <td>${s.name}</td>
                        <td>${s.dob}</td>
                        <td>${s.gender}</td>
                        <td>${s.curriculum.name}</td>
                        <td>${s.semester.name}</td>
                        <td>${s.user.code}</td>
                        <td>${s.user.password}</td>
                        <td>${s.term}</td>
                        <td>
                            <a href="/admin/admin-student-list/edit?id=${s.id}">Edit</a>
                            <a href="/admin/admin-student-list/delete?id=${s.id}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <a href="/admin/admin-student-list/create">Create</a>
            <a href="/admin/admin-student-list">Back</a>
        </body>
    </html>
</f:view>

