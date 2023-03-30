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
            <title>JSP Page</title>
        </head>
        <h1>Create Lecturer</h1>
        <body>
            <form action="/admin/admin-lecturer-list/create" method="post">
                Name : <input type="text"  value=""  name="name" />
                <br />
                Dob : <input type="Date"  value=""  name="dob" />
                <br />
                Gender : <input type="radio" name="gender" value="male"/>Male  <input type="radio" name="gender" value="female"/>Female
                <br/>     
                Code : <input type="text"  value=""  name="code" />
                <br />
                Pass : <input type="text"  value=""  name="pass" />
                <br />
                <input name="submit" value="Create" type="submit" />
            </form>
            <a href="/admin/admin-lecturer-list">Back</a>
        </body>
    </html>
</f:view>
