<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
<head>
    <meta charset="utf-8">
    <title>Авторизація</title>
    <link href="/resources/css/mysite.css" rel="stylesheet"  type="text/css"/>
    <link rel="shortcut icon" href="/resources/jpg/login.ico" type="image/x-icon">
    <style>
        body {
            background-image: url(/resources/jpg/b6.jpg) ;
            height: 100%;

                  }
    </style>
</head>
<body>

<div align="center">
    <c:url value="/j_spring_security_check" var="loginUrl" />

    <form class="form-3" action="${loginUrl}" method="POST">

        <img height="200" width="200" src="/resources/jpg/auth.png" style="margin: 0px 0px 0px; padding-top: 0px; padding-left: 0px;">


        <p class="clearfix">
            <label for="login">E-MAIL</label>
            <input type="text" name="j_login">

            <label for="password">ПАРОЛЬ</label>
            <input type="password" name="j_password">

            <input type="submit" name="submit" value="Вхід">

            <input type="checkbox" name="remember" id="remember">
            <label for="remember">Запамятати мене</label>
        </p>
        <div align="center">
            <p><a href="/register">Зареєструватися</a></p>

        </div>
        <div align="center">
        <c:if test="${param.error ne null}">
            <p style="color:#ff0000"> НЕВІРНО ВВДЕННІ ЛОГІН АБО ПАРОЛЬ!</p>
        </c:if>

        </div>
    </form>
</div>
</body>
</html>
