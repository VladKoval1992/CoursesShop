<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Дані замовника </title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/clock.css">
    <link rel="stylesheet" href="/resources/css/box.css">

    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/clock.js"></script>

    <link rel="stylesheet" href="/resources/css/order.css">
</head>

<body>

<div class="container">
    <table class="Clock">
        <tr>
            <td class="bord"><a href="/adminall"><img height="80" width="85" src="resources/jpg/admin1.ico"/></a></td>

            <td class="bord">
                <div class="clock">
                    <div id="Date"></div>
                    <ul>

                        <li id="hours"></li>
                        <li id="point">:</li>
                        <li id="min"></li>
                        <li id="point">:</li>
                        <li id="sec"></li>
                    </ul>
                </div>
            </td>
            <td class="bord">
                <button style="color: black" type="button" id="exit" class="btn btn-warning navbar-btn">
                    <span style="color: red" class="glyphicon glyphicon-off"></span>Вийти
                </button>
            </td>
        </tr>

    </table>



    <table>

        <table cellspacing='0' width="500">
            <tr class='even' align="center">
                <td colspan="2"> <b> Дані замовника </b></td>
            </tr>
                <tr>
                    <td style="width: 200px"> Імя </td>
                    <td style="width: 300px">  ${userdata.name} </td>
                </tr>
            <tr>
                <td style="width: 200px"> Фамілія </td>
                <td style="width: 300px">  ${userdata.lastName} </td>
            </tr>

            <tr>
                <td style="width: 200px"> Дата народження </td>
                <td style="width: 300px">  ${userdata.birthday} </td>
            </tr>

            <tr>
                <td style="width: 200px"> Стать </td>
                <td style="width: 300px">  ${userdata.sex} </td>
            </tr>

            <tr>
                <td style="width: 200px"> E-mail </td>
                <td style="width: 300px">  ${userdata.email} </td>
            </tr>

            <tr>
                <td style="width: 200px">Телефон </td>
                <td style="width: 300px">  ${userdata.phone} </td>
            </tr>

            <tr>
                <td style="width: 200px">Вулиця </td>
                <td style="width: 300px">  ${userdata.adres} </td>
            </tr>

            <tr>
                <td style="width: 200px">Місто </td>
                <td style="width: 300px">  ${userdata.city} </td>
            </tr>

            <tr>
                <td style="width: 200px">Країна </td>
                <td style="width: 300px">  ${userdata.country} </td>
            </tr>

        </table>
    </table>
</div>

<script>


    $('#exit').click(function () {
        window.location.href = '/logout';
    });




</script>
</body>
</html>