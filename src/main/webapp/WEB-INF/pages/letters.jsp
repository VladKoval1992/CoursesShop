<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Пошта </title>
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
            </td >
            <td class="bord"><button style="color: black" type="button" id="exit" class="btn btn-warning navbar-btn">
                <span style="color: red" class="glyphicon glyphicon-off"></span>Вийти </button></td>
        </tr>

    </table>


    <nav class="navbar navbar-default">
        <div class="container-fluid">

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul  class="nav navbar-nav">

                    <li><img height="30" width="30" src="resources/jpg/minus.png"/><button type="button" id="delete_mail"
                    class="btn btn-default navbar-btn">Видалити повідомлення</button></li>

                </ul>


            </div>
        </div>
    </nav>

    <table class="table table-striped">
        <thead>
        <tr>
            <td></td>
            <td><b>Листи від -</b> <b style="color: red">${userName}</b></td>

        </tr>
        </thead>
        <c:forEach items="${mailList}" var="mail">
            <tr>
                <td><input type="checkbox" name="toDelete[]" value="${mail.id}" id="checkbox_${mail.id}"/></td>
                <td>   <div class="alert-box success"><span style="color: #0000FF">${mail.time}: </span>   ${mail.mail}  </div> </td>

            </tr>
        </c:forEach>



    </table>


</div>

<script>
    $('.dropdown-toggle').dropdown();


    $('#exit').click(function(){
        window.location.href='/logout';
    });



    $('#delete_mail').click(function(){
        var data = { 'toDelete[]' : []};
        $(":checked").each(function() {
            data['toDelete[]'].push($(this).val());
        });
        $.post("/deleteMail", data, function(data, status) {
            window.location.reload();
        });
    });
</script>
</body>
</html>