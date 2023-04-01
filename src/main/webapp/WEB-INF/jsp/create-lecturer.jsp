<%-- 
    Document   : create-lecturer
    Created on : Mar 30, 2023, 1:20:55 AM
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
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>JSP Page</title>
        </head>
        <body>
            <div class="container">
                <h1>Create new Lecturer</h1>
                <button class="btn btn-warning"><a href="../">Back</a></button>
                <font size="+2">
                    <form action="/admin/admin-lecturer-list/create" method="post">
                        <div class="form-group">
                            Name : <input class="form-control" type="text"  value=""  name="name" />
                            <br />
                            Date of birth : <input class="form-control" type="Date"  value=""  name="dob" />
                            <br />
                            Gender : <input type="radio" name="gender" value="male"/>Male  <input type="radio" name="gender" value="female"/>Female
                            <br/>     
                            <br/>     
                            Code : <input class="form-control"  type="text"  value=""  name="code" />
                            <br />
                            Pass : <input class="form-control"  type="text"  value=""  name="pass" />
                            <br />
                            <input class="btn btn-success" name="submit" value="Create" type="submit" />
                        </div>
                    </form>
                </font>
            </div>
        </body>
    </html>
</f:view>
