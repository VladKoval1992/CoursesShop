<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <meta content="text/html; charset=utf-8" />

    <title>Редарування курсу</title>
    <link rel='stylesheet prefetch' href='/resources/css/bootstrap.min.css'  type="text/css"/>
    <link rel="shortcut icon" href="/resources/jpg/edit.png" type="image/x-icon">
</head>
<body>
<div align="center">
    <c:url value="/changeCourse" var="regUrl" />

    <form enctype="multipart/form-data" class="well form-horizontal" action="${regUrl}" method="POST" id="register_form">
        <fieldset>
            <legend>Редагування курсу!</legend>

            <div class="form-group">
                <label class="col-md-4 control-label">Назва курсу</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-plus"></i></span>
                        <input name="nameCourses" value="${nameCourses}" placeholder="Назва курсу"  class="form-control" type="text">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label">Ціна курсу</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                        <input name="price" value="${price}" placeholder="в гривні (UAH)"  class="form-control" type="text">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label">Опис курсу</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <textarea style="width: 400px"   name="descriptionOfCourses" class="form-control" rows="10"
                        placeholder="Введіть опис курсу від 20 до 1000 символів" minlength="20" maxlength="1000" required="required">${descriptionOfCourses}</textarea>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label">Еемблема </label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-paperclip"></i></span>
                        <input  name="emblemOfCourcses" class="form-control" type="file" >
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="col-md-4">
                    <button type="submit" class="btn btn-warning"> Рудагувати курс  <span class="glyphicon glyphicon-save"></span></button>
                    <button type="submit" class="btn btn-warning" onclick="history.back()"> Назад  <span class="glyphicon glyphicon-arrow-left"></span></button>

                </div>
            </div>

         </fieldset>
        <input type="hidden" name="oldNameCourses" value="${nameCourses}">
           </form>

<script src='/resources/js/jquery.min.js'></script>
<script src='/resources/js/bootstrap.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
<script  src="/resources/js/editcourses.js"></script>


</body>
</html>
