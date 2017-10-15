<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Користувачі які зробили замовлення </title>
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
            </td>
            <td class="bord"><button style="color: black" type="button" id="exit" class="btn btn-warning navbar-btn">
                <span style="color: red" class="glyphicon glyphicon-off"></span>Вийти </button></td>
        </tr>

    </table>


    <table class="table table-striped, enum">
        <thead>
        <tr>

            <td><b>№</b></td>
            <td><b>Ім'я киристувача</b></td>
            <td></td>
            <td align="center"><b>Кількість замовлень</b></td>
        </tr>
        </thead>
        <c:forEach items="${usersList}" var="user">
            <tr>

                <td style="width: 10px"> <num>
                <td style="width: 100px"> <a href="/ordersalluser?login=${user.email}&userName=${user.name}">
                <img title="${user.name}" height="50" width="50" src="resources/jpg/user.png"/>${user.name}</a></td>
                <td style="width: 700px"> <button style="background: #22ff00" type="button"
                 onclick="window.location.href='/userdata?login=${user.email}'"
                  class="btn btn-default navbar-btn">  Дані замовника</button> </td>
                <td style="width: 10px" align="center"> <img height="50" width="50" src="resources/jpg/zakaz.png"/> ${user.orderSize} </td>


            </tr>
        </c:forEach>

    </table>


</div>

<script>
    $('.dropdown-toggle').dropdown();


    $('#exit').click(function(){
        window.location.href='/logout';
    });


</script>
</body>
</html>