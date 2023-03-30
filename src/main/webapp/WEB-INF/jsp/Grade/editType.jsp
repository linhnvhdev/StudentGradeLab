<%-- 
    Document   : editType
    Created on : Mar 30, 2023, 2:33:46 PM
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
            <title>Edit Page</title>
        </head>
        <body>
            <h1>Edit type</h1>
            <form method="post" action="editType">
                <input type="hidden" name="courseId" value="${courseId}">
                <input type="hidden" name="oldGradeType" value="${gradeType.grade_type}">
                Grade Type: <input type="text" name="gradeType" value="${gradeType.grade_type}">
                <br><!-- comment -->
                Weight: <input type="number" name="weight" step="any" value="${gradeType.weight}">
                <br><!-- comment -->
                Fail Score: <input type="number" name="failScore" step="any" value="${gradeType.failScore}"> 
                <br><!-- comment -->
                <input type="submit" value="Edit"><!-- comment -->
            </form>
        </body>
    </html>
</f:view>