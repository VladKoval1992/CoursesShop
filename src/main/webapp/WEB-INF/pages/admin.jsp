<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Адміністратор користувачів</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/clock.css">
    <link rel="stylesheet" href="/resources/css/enum.css">
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/clock.js"></script>
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
            </td >
            <td class="bord"><button style="color: black" type="button" id="exit" class="btn btn-warning navbar-btn">
                <span style="color: red" class="glyphicon glyphicon-off"></span>Вийти </button></td>
        </tr>

    </table>


    <nav class="navbar navbar-default">
        <div class="container-fluid">

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul  class="nav navbar-nav">

                    <li><img height="30" width="30" src="resources/jpg/AddUser1.ico"/><button type="button" id="add_user"
                    class="btn btn-default navbar-btn">Додати користувача</button></li>


                    <li><img height="30" width="30" src="resources/jpg/RemoveUser.ico"/><button type="button" id="delete_user"
                    class="btn btn-default navbar-btn">Видалити користувача</button></li>


                    <form class="navbar-form navbar-right" role="search" action="/search" method="post">
                        <button type="submit" class="btn btn-default">Пошук</button>
                        <div class="form-group">
                            <input type="text" class="form-control" name="pattern" placeholder="Пошук по імені">
                        </div>
                    </form>
                </ul>


            </div>
        </div>
    </nav>

    <table class="table table-striped, enum">
        <thead>
        <tr>
            <td></td>
            <td><b>№</b></td>
            <td><b>Ім'я</b></td>
            <td><b>Фамілія</b></td>
            <td><b>Дата народження</b></td>
            <td><b>E-Mail</b></td>
            <td><b>Телефон</b></td>
            <td><b>Адреса</b></td>
            <td><b>Місто</b></td>
            <td><b>Країна</b></td>
            <td><b>Ким виступає</b></td>
        </tr>
        </thead>
        <c:forEach items="${userList}" var="user">
            <tr>
                <td><input type="checkbox" name="toDelete[]" value="${user.id}" id="checkbox_${user.id}"/></td>
                <td> <num>
                <td>${user.name}</td>
                <td>${user.lastName}</td>
                <td>${user.birthday}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>${user.adres}</td>
                <td>${user.city}</td>
                <td>${user.country}</td>
                <td>${user.role}</td>

            </tr>
        </c:forEach>

    </table>

    <c:if test="${back ne null}">
        <td><button style="color: black" type="button" id="back_admin" class="btn btn-warning navbar-btn">
           НАЗАД </button></td>
    </c:if>
</div>

<script>
    $('.dropdown-toggle').dropdown();

    $('#add_user').click(function(){
        window.location.href='/register';
    });

    $('#back_admin').click(function(){
        window.location.href='/admin';
    });


    $('#exit').click(function(){
        window.location.href='/logout';
    });



    $('#delete_user').click(function(){
        var data = { 'toDelete[]' : []};
        $(":checked").each(function() {
            data['toDelete[]'].push($(this).val());
        });
        $.post("/delete", data, function(data, status) {
            window.location.reload();
        });
    });
</script>
</body>
</html>