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
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>JSP Page</title>
        </head>
        <body>
            <div class="container">
                <h1>Create new Student</h1>
                <button class="btn btn-warning"><a href="../">Back</a></button>
                <font size="+2">
                    <form action="/admin/admin-student-list/create" method="post">
                        <div class="form-group">
                            Name : <input class="form-control" type="text"  value=""  name="name" />
                        </div>
                        <div class="form-group">
                            Dob : <input class="form-control" type="Date"  value=""  name="dob" />
                        </div>
                        <div class="form-group">
                            Gender : <input type="radio" name="gender" value="male"/>Male  <input type="radio" name="gender" value="female"/>Female
                        </div>
                        <div class="form-group">
                            Curriculum : <select name="curriculum">
                                <c:forEach items="${curriculums}" var="cur">
                                    <option value="${cur.id}">${cur.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            Semester : <select name="semester">
                                <c:forEach items="${semesters}" var="sem">
                                    <option value="${sem.id}">${sem.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            Term : <input class="form-control" type="text"  value=""  name="term" />
                        </div>
                        <div class="form-group">
                            Code : <input class="form-control" type="text"  value=""  name="code" />
                        </div>
                        <div class="form-group">
                            Pass : <input class="form-control" type="text"  value=""  name="pass" />
                        </div>

                        <input class="btn btn-success" name="submit" value="Create" type="submit" />
                    </form>
                </font>
            </div>
        </body>
    </html>
</f:view>
