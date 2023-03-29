<%-- 
    Document   : newjsf
    Created on : Mar 29, 2023, 2:37:24 PM
    Author     : loidinhcap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>





<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>JSP Page</title>
    </head>
    <body>
        ${user.code}<br><!-- comment -->
        ${user.password}<br><!-- comment -->
        ${user.role.id}
    </body>
</html>
