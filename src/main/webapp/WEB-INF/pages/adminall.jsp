<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Адміністратор магазину </title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/clock.css">
    <link rel="stylesheet" href="/resources/css/box.css">
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
            </td>
            <td class="bord"><button style="color: black" type="button" id="exit" class="btn btn-warning navbar-btn">
                <span style="color: red" class="glyphicon glyphicon-off"></span>Вийти </button></td>
        </tr>

    </table>




    <table class="table table-striped">
            <tr>

                <td><a class="image" href="/admin" ><img title="Користувачі" height="160" width="160" src="resources/jpg/adminuser.png"/></a></td>
                <td><a class="image"href="/admincourses" ><img title="Перелік курсів" height="160" width="160" src="resources/jpg/foldercourses.png"/></a></td>
                <td><a class="image" href="/lettersalluser" ><img height="160" title="Пошта" width="160" src="resources/jpg/mail.png"/></a></td>
                <td><a class="image" href="/ordersadmin" ><img height="160" title="Замолення" width="160" src="resources/jpg/zakaz.png"/></a></td>

            </tr>

    </table>


</div>

<script>

    $('#exit').click(function(){
        window.location.href='/logout';
    });

</script>
</body>
</html>