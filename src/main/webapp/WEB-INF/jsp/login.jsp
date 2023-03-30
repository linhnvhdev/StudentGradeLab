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
        <title>Login Page</title>
        <style>
            body {
                display: flex;
                flex-direction: row;
                height: 100vh;
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
            }

            .image {
                flex: 1;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .login {
                flex: 1;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                background-color: #f2f2f2;
                padding: 50px;
            }

            .login form {
                width: 100%;
                max-width: 400px;
                display: flex;
                flex-direction: column;
            }

            .login input[type="text"],
            .login input[type="password"],
            .login input[type="submit"] {
                margin-bottom: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }

            .login input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .login input[type="submit"]:hover {
                background-color: #0062cc;
            }

            .title {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <div class="image">
            <img src="https://is4-ssl.mzstatic.com/image/thumb/Purple123/v4/ea/56/9f/ea569f0f-1f72-7e20-c178-dde6cfcfcbdc/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.webp" alt="App Icon">
        </div>
        <div class="login">
            <h1 class="title">FPT University Academic Portal</h1>
            <form method="post" action="login">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password">
                <input type="submit" value="Login">
            </form>
        </div>
    </body>
</html>

