<%-- 
    Document   : admin-student-list
    Created on : Mar 29, 2023, 5:05:57 PM
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
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>JSP Page</title>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        </head>
        <body>
            <div class="container">
                <blockquote class="blockquote-reverse">
                    <h1>Welcome admin!</h1>
                    <a href="/logout" class="btn btn-primary">Log out</a>
                </blockquote>
            </div>
            <br/>
            <br/>
            <br/>
            <div class="container" style="background-color: darkorange">
                <div class="row">
                    <div class="col-md-3">
                        <button class="btn btn-block text-center">
                            <h4>   <a href="/admin/admin-student-list" class="text-center">View Students</a></h4>
                        </button>
                    </div>
                    <div class="col-md-3">
                        <button class="btn btn-block text-center" style="background-color: darkorange">
                            <h4>   <a href="/admin/admin-lecturer-list" class="text-center">View Teachers</a></h4>
                        </button>
                    </div>
                    <div class="col-md-3">
                        <button class="btn btn-block text-center" style="background-color: darkorange">
                            <h4>   <a href="/admin/admin-grades-list" class="text-center">View Grades</a></h4>
                        </button>
                    </div>
                    <div class="col-md-3">
                        <button class="btn btn-block text-center" style="background-color: darkorange">
                            <h4>    <a href="/admin/admin-course-list" class="text-center">View Course</a></h4>
                        </button>
                    </div>
                </div>
            </div>
            <br/>
            <br/>

            <div class="container text-center">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <button class="btn btn-block text-center" style="background-color: gold">
                        <a href="/admin/admin-student-list/create"><h4>Create new student</h4></a>
                    </button>
                </div>
                <div class="col-md-3">
                    <button class="btn btn-block text-center" style="background-color: gold">
                        <a href="/admin"><h4>Back</h4></a>
                    </button>
                </div>
                <br/>
            </div>

            <br/>
            <br/>

            <div class="container">
                <table border="5px" class="table">
                    <tr class="warning">
                        <th>ID</th>
                        <th>Name</th>
                        <th>Date of birth</th>
                        <th>Gender</th>
                        <th>Curriculum</th>
                        <th>Semester</th>
                        <th>User ID</th>
                        <th>Student password</th>
                        <th>Term</th>
                        <th></th>
                        <th></th>
                    </tr>
                    <c:forEach items="${stud}" var="s">
                        <tr class="active">
                            <td>${s.id}</td>
                            <td>${s.name}</td>
                            <td>${s.dob}</td>
                            <td><c:if test="${s.gender}">Male</c:if><c:if test="${!s.gender}">Female</c:if></td>
                            <td>${s.curriculum.name}</td>
                            <td>${s.semester.name}</td>
                            <td>${s.user.code}</td>
                            <td>${s.user.password}</td>
                            <td>${s.term}</td>
                            <td>
                                <a href="/admin/admin-student-list/edit?id=${s.id}">Edit</a>
                            </td>
                            <td>
                                <a href="/admin/admin-student-list/delete?id=${s.id}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

        </body>
    </html>
</f:view>

