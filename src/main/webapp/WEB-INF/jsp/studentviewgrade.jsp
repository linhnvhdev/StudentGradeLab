<%-- 
    Document   : test
    Created on : Mar 29, 2023, 11:12:00 AM
    Author     : linhnvhdev
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
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
        </head>
        <body>
            <div class="vh-100 d-flex justify-content-center">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <c:forEach items="${semesters}" var="semester">
                                <c:if test="${sem ne semester.id}">
                                    <a class="btn btn-primary btn-lg m-4" href="viewgrade?sem=${semester.id}" role="button">${semester.description}</a>
                                </c:if>
                                <c:if test="${sem eq semester.id}">
                                    <a class="btn btn-dark btn-lg m-4" href="viewgrade?sem=${semester.id}" role="button">${semester.description}</a>
                                </c:if>
                            </c:forEach>
                            <div class="mt-4"><!-- comment --></div>
                            <c:forEach items="${courses}" var="course">
                                <c:if test="${couid ne course.id}">
                                    <a class="btn btn-warning btn-lg m-4" href="#">${course.shortname}</a>
                                </c:if>
                                <c:if test="${couid eq course.id}">
                                    <a class="btn btn-dark btn-lg m-4" href="#">${course.shortname}</a>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
</f:view>
