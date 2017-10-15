<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <meta content="text/html; charset=utf-8" />

    <title>Профіль користувача</title>
    <link rel='stylesheet prefetch' href='/resources/css/bootstrap.min.css'  type="text/css"/>
    <link rel="shortcut icon" href="/resources/jpg/adduser.ico" type="image/x-icon">
</head>
<body>
<div align="center">
    <c:url value="/changeUser" var="regUrl" />

    <form class="well form-horizontal" action="${regUrl}" method="POST" id="contact_form">
        <fieldset>
            <legend>Профіль користувача</legend>

            <div class="form-group">
                <label class="col-md-4 control-label">Ім'я</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="name" value="${name}" placeholder="Ім'я" class="form-control" type="text">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label">Фамілія</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="lastName" value="${lastName}" placeholder="Фамілія" class="form-control" type="text">
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label">Дата народження</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="birthday"  class="form-control" type="date" value="${birthday}">
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label">Стать</label>
                <div class="col-md-4 ">
                    <label>
                        <input type="radio" name="sex" value="Жіноча" checked>
                        Жіноча
                    </label>
                    <label>
                        <input type="radio" name="sex" value="Чоловіча">
                        Чоловіча
                    </label>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label">E-Mail</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input name="email" value="${email}" placeholder="exemple@gmail.com " class="form-control" type="text">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label">Пароль</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-check"></i></span>
                        <input name="password" value="${password}" placeholder="Пароль" class="form-control" type="password">
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label">Телефон</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                        <input name="phone"  value="${phone}" placeholder="(093) 434 57 58" class="form-control" type="text">
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label">Адреса</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                        <input name="adres" value="${adres}" placeholder="Ломоносова, 44" class="form-control" type="text">
                    </div>
                </div>
            </div>



            <div class="form-group">
                <label class="col-md-4 control-label">Місто</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                        <input name="city" value="${city}" placeholder="Київ" class="form-control" type="text">
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label">Країна</label>
                <div class="col-md-4 selectContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                        <input name="country" value="${country}" placeholder="Україна" class="form-control" type="text">

                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="col-md-4">
                    <button type="submit" class="btn btn-warning"> Рудагувати дані  <span class="glyphicon glyphicon-save"></span></button>
                    <button type="submit" class="btn btn-warning" onclick="history.back()"> Назад  <span class="glyphicon glyphicon--arrow-left"></span></button>

                </div>
            </div>

        </fieldset>

        <c:if test="${exists ne null}">
            <p style="color: red">  Коричтувач з таким E-Mail вже зареєстрований</p>
        </c:if>


    </form>



<script src='/resources/js/jquery.min.js'></script>
<script src='/resources/js/bootstrap.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

<script  src="/resources/js/index.js"></script>


</body>
</html>
