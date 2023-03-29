<%-- 
    Document   : create-student
    Created on : Mar 29, 2023, 11:53:59 PM
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
            <h1>Create Student</h1>
            <form action="/admin/admin-student-list/create" method="post">
                Name : <input type="text"  value=""  name="name" />
                <br />
                Dob : <input type="Date"  value=""  name="dob" />
                <br />
                Gender : <input type="radio" name="gender" value="male"/>Male  <input type="radio" name="gender" value="female"/>Female
                <br/>
                Curriculum : <select name="curriculum">
                    <c:forEach items="${curriculums}" var="cur">
                        <option value="${cur.id}">${cur.name}</option>
                    </c:forEach>
                </select>
                <br/>
                Semester : <select name="semester">
                    <c:forEach items="${semesters}" var="sem">
                        <option value="${sem.id}">${sem.name}</option>
                    </c:forEach>
                </select>
                <br/>
                Term : <input type="text"  value=""  name="term" />
                <br />
                Code : <input type="text"  value=""  name="code" />
                <br />
                Pass : <input type="text"  value=""  name="pass" />
                <br />
                <input name="submit" value="Create" type="submit" />
            </form>
        </body>
    </html>
</f:view>
