<%-- 
    Document   : admin-lecturer-list
    Created on : Mar 30, 2023, 1:14:26 AM
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
                        <button class="btn btn-block text-center"style="background-color: darkorange">
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
                        <button class="btn btn-block text-center" >
                            <h4>    <a href="/admin/admin-course-list" class="text-center">View Courses</a></h4>
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
                        <a href="/admin/admin-lecturer-list/create"><h4>Create new Lecturer</h4></a>
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
                        <th>Code</th>
                        <th>Name</th>
                        <th>Credit</th>
                        <th></th>
                    </tr>
                    <c:forEach items="${courses}" var="course">
                        <tr class="active">
                            <td>${course.id}</td>
                            <td>${course.shortname}</td>
                            <td>${course.name}</td>
                            <td>${course.credit}</td>
                            <td>
                                <a href="/grade/type?id=${course.id}">Grade type</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </body>
    </html>
</f:view>
