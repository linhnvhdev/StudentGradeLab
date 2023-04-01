<%-- 
    Document   : update-lecturer
    Created on : Mar 30, 2023, 1:23:35 AM
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
                <br/>
                <br/>
                <br/>
                <h1>Update Lecturer</h1>
                <br/>
                <br/>
                <br/>
                <font size="+2">
                    <div class="form-group">
                        <form action="/admin/admin-lecturer-list/edit" method="post">
                            <input type="hidden"  value="${lec.id}"  name="lid" />
                            Name : <input class="form-control" type="text"  value="${lec.name}"  name="name" />
                            <br />
                            Dob : <input class="form-control" type="Date"  value="${lec.dob}"  name="dob" />
                            <br />
                            Gender : <input type="radio" name="gender" value="male" ${lec.gender ? 'checked':''}/>Male  
                            <input type="radio" name="gender" value="female" ${lec.gender ? '':'checked'}/>Female
                            <br/>
                            <br/>
                            <input type="hidden"  value="${lec.user.code}"  name="code" />
                            Pass : <input class="form-control" type="text"  value="${lec.user.password}"  name="pass" />
                            <br />
                            <input class="btn btn-success" name="submit" value="Update" type="submit" />
                        </form>
                    </div>
                </font>
            </div>
        </body>
    </html>
</f:view>
