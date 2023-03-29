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
        </head>
        <body>
            <button>
                <a href="/admin/admin-student-list">View Students</a>
            </button>
            <button>
                <a href="/admin/admin-student-list">View Teachers</a>
            </button>
            <button>
                <a href="/admin/admin-grades-list">View Grades</a>
            </button>
            <button>
                <a href="/admin/admin-classes-list">View Classes</a>
            </button>
        </body>
    </html>
</f:view>
