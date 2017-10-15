<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <meta content="text/html; charset=utf-8" />

    <title>Реєстрація користувача</title>
    <link rel='stylesheet prefetch' href='/resources/css/bootstrap.min.css'  type="text/css"/>
    <link rel="shortcut icon" href="/resources/jpg/adduser.ico" type="image/x-icon">
</head>
<body>
<div align="center">
    <c:url value="/newuser" var="regUrl" />

    <form class="well form-horizontal" action="${regUrl}" method="POST" id="contact_form">
        <fieldset>
            <legend>Реєстрація нового користувача!</legend>

            <div class="form-group">
                <label class="col-md-4 control-label">Ім'я</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="name" placeholder="Ім'я" class="form-control" type="text">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label">Фамілія</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="lastName" placeholder="Фамілія" class="form-control" type="text">
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label">Дата народження</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="birthday"  class="form-control" type="date" value="1900-01-01">
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
                        <input name="email" placeholder="exemple@gmail.com " class="form-control" type="text">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label">Пароль</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-check"></i></span>
                        <input name="password" placeholder="Пароль" class="form-control" type="password">
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label">Телефон</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                        <input name="phone" placeholder="(093) 434 57 58" class="form-control" type="text">
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label">Адреса</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                        <input name="adres" placeholder="Ломоносова, 44" class="form-control" type="text">
                    </div>
                </div>
            </div>



            <div class="form-group">
                <label class="col-md-4 control-label">Місто</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                        <input name="city" placeholder="Київ" class="form-control" type="text">
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label">Країна</label>
                <div class="col-md-4 selectContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                        <input name="country" placeholder="Україна" class="form-control" type="text">

                    </div>
                </div>
            </div>

            <sec:authorize access="hasRole('ADMIN')">
                <div class="form-group">
                    <label class="col-md-4 control-label">Ким виступає в системі</label>
                    <div class="col-md-4 selectContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                            <select class="selectpicker form-control" name="role" >
                                <option value="USER">USER</option>
                                <option value="ADMIN">ADMIN</option>

                            </select>

                        </div>
                    </div>
                </div>
            </sec:authorize>

            <sec:authorize access="hasRole('ANONYMOUS')">
                <input type="hidden" name="role" value="USER">
            </sec:authorize>




            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="col-md-4">
                    <button type="submit" class="btn btn-warning"> Зареєструватися :)  <span class="glyphicon glyphicon-send"></span></button>
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
