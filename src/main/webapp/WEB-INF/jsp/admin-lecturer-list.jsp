<%-- 
    Document   : admin-lecturer-list
    Created on : Mar 30, 2023, 1:14:26 AM
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
                    <td>ID</td>
                    <td>name</td>
                    <td>dob</td>
                    <td>gender</td>
                    <td>user ID</td>
                    <td>Lecturer password</td>
                    <td></td>
                </tr>
                <c:forEach items="${lec}" var="l">
                    <tr>
                        <td>${l.id}</td>
                        <td>${l.name}</td>
                        <td>${l.dob}</td>
                        <td>${l.gender}</td>
                        <td>${l.user.code}</td>
                        <td>${l.user.password}</td>
                        <td>
                            <a href="/admin/admin-lecturer-list/edit?id=${l.id}">Edit</a>
                            <a href="/admin/admin-lecturer-list/delete?id=${l.id}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <a href="/admin/admin-lecturer-list/create">Create</a>
            <a href="/admin">Back</a>
        </body>
    </html>
</f:view>
