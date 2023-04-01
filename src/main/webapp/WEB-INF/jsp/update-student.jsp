<%-- 
    Document   : update-student
    Created on : Mar 30, 2023, 12:29:16 AM
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
                <font size="+2">
                    <br/>
                    <br/>
                    <br/>
                    <h1>Update Student</h1>
                    <br/>
                    <br/>
                    <br/>
                    <div class="form-group">
                        <form action="/admin/admin-student-list/edit" method="post">
                            <input type="hidden"  value="${stud.id}"  name="sid" />
                            Name : <input class="form-control" type="text"  value="${stud.name}"  name="name" />
                            <br />
                            Dob : <input class="form-control"  type="Date"  value="${stud.dob}"  name="dob" />
                            <br />
                            Gender : <input type="radio" name="gender" value="male" ${stud.gender ? 'checked':''}/>Male  
                            <input type="radio" name="gender" value="female" ${stud.gender ? '':'checked'}/>Female
                            <br/>
                            <br/>
                            Curriculum : <select  name="curriculum">
                                <c:forEach items="${curriculums}" var="cur">
                                    <option value="${cur.id}"
                                            <c:if test="${cur.id == stud.curriculum.id}">selected</c:if>
                                                >
                                            ${cur.name}</option>
                                    </c:forEach>
                            </select>
                            <br/>
                            <br/>
                            Semester : <select name="semester">
                                <c:forEach items="${semesters}" var="sem">
                                    <option value="${sem.id}"
                                            <c:if test="${sem.id == stud.semester.id}">selected</c:if>
                                                >
                                            ${sem.name}</option>
                                    </c:forEach>
                            </select>
                            <br/>
                            <br/>
                            Term : <input class="form-control"  type="text"  value="${stud.term}"  name="term" />
                            <br />
                            <input class="form-control"  type="hidden"  value="${stud.user.code}"  name="code" />
                            Pass : <input type="text"  value="${stud.user.password}"  name="pass" />
                            <br />
                            <input class="btn btn-success"  name="submit" value="Update" type="submit" />
                        </form>
                    </div>
                </font>
            </div>
        </body>
    </html>
</f:view>
