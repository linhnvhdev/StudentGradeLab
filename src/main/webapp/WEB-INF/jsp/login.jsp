<%-- 
    Document   : login
    Created on : Mar 22, 2023, 10:18:52 PM
    Author     : loidinhcap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form:form method="post" action="login" modelAttribute="user">
            Username: <form:input path="code"/><br><!-- comment -->
            Password: <form:input path="password"/><br/><!-- comment -->
            <input type="submit" value="Submit">
        </form:form>
            <font color="red">${error}</font>
    </body>
</html>
