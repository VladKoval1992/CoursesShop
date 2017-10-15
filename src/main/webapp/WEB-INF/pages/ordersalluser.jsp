<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Замовлення користувача </title>
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


    <nav class="navbar navbar-default">
        <div class="container-fluid">

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">

                    <li><img height="30" width="30" src="resources/jpg/minus.png"/>
                        <button type="button" id="delete_order" class="btn btn-default navbar-btn">Видалити замовлення </button>
                    </li>



                </ul>


            </div>
        </div>
    </nav>

    <table>

        <table cellspacing='0' width="1100">
            <thead>
            <tr class='even'>

                <td></td>
                <td><b>Замовлення №</b></td>
                <td><b>Вартість замовлення</b></td>
                <td><b>Що замовленно</b></td>
            </tr>
            </thead>
            <c:forEach items="${orders}" var="orders">
                <tr>
                    <td><input type="checkbox" name="toDelete[]" value="${orders.id}" id="checkbox_${orders.id}"/></td>
                    <td> ${orders.numberOrder}</td>
                    <td style="width: 150px">  ${orders.priceOrder} грн.</td>
                    <td style="width: 400px">

                        <table style="width: 100%;">
                            <c:forEach items="${orders.courses}" var="courses">
                                <tr>
                                    <td>${courses.nameCourses}</td>
                                    <td>${courses.price} грн.</td>
                                </tr>
                            </c:forEach>
                        </table>


                    </td>

                </tr>
            </c:forEach>

        </table>
    </table>
</div>

<script>


    $('#exit').click(function () {
        window.location.href = '/logout';
    });



    $('#delete_order').click(function () {
        var data = {'toDelete[]': []};
        $(":checked").each(function () {
            data['toDelete[]'].push($(this).val());
        });
        $.post("/deleteOrder", data, function (data, status) {
            window.location.reload();
        });
    });
</script>
</body>
</html>