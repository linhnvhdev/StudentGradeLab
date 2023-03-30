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
        </head>
        <body>
            <h1>Update Lecturer</h1>
            <form action="/admin/admin-lecturer-list/edit" method="post">
                <input type="hidden"  value="${lec.id}"  name="lid" />
                Name : <input type="text"  value="${lec.name}"  name="name" />
                <br />
                Dob : <input type="Date"  value="${lec.dob}"  name="dob" />
                <br />
                Gender : <input type="radio" name="gender" value="male" ${lec.gender ? 'checked':''}/>Male  
                <input type="radio" name="gender" value="female" ${lec.gender ? '':'checked'}/>Female
                <br/>
                <input type="hidden"  value="${lec.user.code}"  name="code" />
                Pass : <input type="text"  value="${lec.user.password}"  name="pass" />
                <br />
                <input name="submit" value="Update" type="submit" />
            </form>
        </body>
    </html>
</f:view>
