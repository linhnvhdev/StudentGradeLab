<%-- 
    Document   : admin
    Created on : Mar 29, 2023, 2:37:50 PM
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
            <div class="container">
                <blockquote class="blockquote-reverse">
                    <h1>Welcome ${sessionScope.user.code}!</h1>
                    <a href="/logout" class="btn btn-primary">Log out</a>
                </blockquote>
            </div>
            <div class="container" style="background-color: darkorange">
                <div class="row">
                    <div class="col-md-3">
                        <button class="btn btn-block text-center" style="background-color: darkorange">
                            <h4>   <a href="/student/viewgrade" class="text-center">View Grade</a></h4>
                        </button>
                    </div>
                    <div class="col-md-3">
                        <button class="btn btn-block text-center" style="background-color: darkorange">
                            <h4>   <a href="/student/transcript" class="text-center">View Transcript</a></h4>
                        </button>
                    </div>
                </div>
            </div>
    </body>
</html>
</f:view>
