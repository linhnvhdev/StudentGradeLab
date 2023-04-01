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
            <h1>Add grade type</h1>
            <br/>
            <br/>
            <br/>
            <form method="post" action="addType">
                <div class="form-group">
                    <input class="form-control" type="hidden" name="courseId" value="${courseId}">
                Grade Type: <input class="form-control" type="text" name="gradeType">
                <br><!-- comment -->
                Weight: <input class="form-control" type="number" name="weight" step="any">
                <br><!-- comment -->
                Fail Score: <input class="form-control" type="number" name="failScore" step="any"> 
                <br><!-- comment -->
                <input class="btn btn-warning" type="submit" value="add"><!-- comment -->
                </div>
            </form>
                </div>
        </body>
    </html>
</f:view>
