<%-- 
    Document   : addType
    Created on : Mar 30, 2023, 2:15:59 PM
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
        </head>
        <body>
            <h1>Add type</h1>
            <form method="post" action="addType">
                <input type="hidden" name="courseId" value="${courseId}">
                Grade Type: <input type="text" name="gradeType">
                <br><!-- comment -->
                Weight: <input type="number" name="weight" step="any">
                <br><!-- comment -->
                Fail Score: <input type="number" name="failScore" step="any"> 
                <br><!-- comment -->
                <input type="submit" value="add"><!-- comment -->
            </form>
        </body>
    </html>
</f:view>
