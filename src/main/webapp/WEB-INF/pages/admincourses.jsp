<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Адміністратор курсів </title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/clock.css">
    <link rel="stylesheet" href="/resources/css/enum.css">
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/clock.js"></script>

    <style>
        table tr td:nth-child(2) {
            word-break: break-all;
        }



    </style>
</head>

<body>

<div class="container">
    <table class="Clock">


        <tr>
            <td class="bord"> <a href="/adminall" ><img height="80" width="85" src="resources/jpg/admin1.ico"/></a></td>
            <td class="bord"><div class="clock">
                <div id="Date" ></div>
                <ul>

                    <li id="hours" ></li>
                    <li id="point">:</li>
                    <li id="min"></li>
                    <li id="point">:</li>
                    <li id="sec"></li>
                </ul>
            </div>
            </td>
            <td class="bord"><button style="color: black" type="button" id="exit" class="btn btn-warning navbar-btn">
                <span style="color: red" class="glyphicon glyphicon-off"></span>Вийти </button></td>
        </tr>

    </table>


    <nav class="navbar navbar-default">
        <div class="container-fluid">

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul  class="nav navbar-nav">

                    <li><img height="30" width="30" src="resources/jpg/plus.png"/><button type="button" id="add_courses"
                    class="btn btn-default navbar-btn">Додати Курс</button></li>


                    <li><img height="30" width="30" src="resources/jpg/minus.png"/><button type="button" id="delete_courses"
                    class="btn btn-default navbar-btn">Видалити Курс</button></li>


                    <form class="navbar-form navbar-right" role="search" action="/search_courses" method="post">
                        <button type="submit" class="btn btn-default">Пошук</button>
                        <div class="form-group">
                            <input type="text" class="form-control" name="pattern" placeholder="Пошук по назві курсу">
                        </div>
                    </form>
                </ul>


            </div>
        </div>
    </nav>

    <table class="table table-striped, enum" style="word-break: break-all">
        <thead>
        <tr>
            <td></td>
            <td ><b>№</b></td>
            <td><b>Назва</b></td>
            <td><b>Вартість</b></td>
            <td><b>Опис</b></td>
            <td><b>Емблема</b></td>

        </tr>
        </thead>
        <c:forEach items="${coursesList}" var="courses">

            <tr>
                <td><input type="checkbox" name="toDelete[]" value="${courses.id}" id="checkbox_${courses.id}"/></td>
                <td style="width: 30px"> <num>
                <td style="width: 200px">${courses.nameCourses}</td>
                <td style="width: 100px">${courses.price} грн.</td>
                <td>${courses.descriptionOfCourses} </td>
                <td>   <img src="/photo/${courses.nameCourses}" style="height: 80px" /> </td>
                <td style="width: 50px"><a href="/editCourses?nameCourses=${courses.nameCourses}" > <img height="30" width="30" src="resources/jpg/edit.png" alt="РЕДАГУВАТИ" /></a> </td>



            </tr>

        </c:forEach>




    </table>

    <c:if test="${back ne null}">
        <td><button style="color: black" type="button" id="back_admin" class="btn btn-warning navbar-btn">
           НАЗАД </button></td>

    </c:if>






<script>
    $('.dropdown-toggle').dropdown();

    $('#add_courses').click(function(){
        window.location.href='/registercourses';
    });

    $('#back_admin').click(function(){
        window.location.href='/admincourses';
    });

    $('#exit').click(function(){
        window.location.href='/logout';
    });



    $('#delete_courses').click(function(){
        var data = { 'toDelete[]' : []};
        $(":checked").each(function() {
            data['toDelete[]'].push($(this).val());
        });
        $.post("/delete_courses", data, function(data, status) {
            window.location.reload();
        });
    });
</script>
</body>
</html>