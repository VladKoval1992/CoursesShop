﻿
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>

<title>Власний кабінет</title>

<link href="resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="resources/css/ddsmoothmenu.css" />
    <link rel="stylesheet" href="/resources/css/box.css">
    <link rel="stylesheet" href="/resources/css/order.css">
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/clock.js"></script>

</head>
<body>



<div id="tooplate_wrapper">
	<div id="tooplate_header">
    	<div id="header_top">
        	<div id="site_title"><a href="/">Clothing Template</a></div>
            <div id="tooplate_menu" class="ddsmoothmenu">
                <ul>
                    <a  href="/" class="button1">НА ГОЛОВНУ</a>
                    <a  href="/products" class="button1">НАШІ КУРСИ</a>
                    <a href="/contact" class="button1">КОНТАКТИ</a>

                    <sec:authorize access="hasRole('ANONYMOUS')">
                        <a style="color: #22ff00" href="/login" class="button1" > УВІЙТИ </a>
                    </sec:authorize>

                    <sec:authorize access="hasAnyRole('USER', 'ADMIN')">
                        <a style="color: red" href="/logout" class="button1" > ВИЙТИ </a>
                    </sec:authorize>
                </ul>
                <br style="clear: left" />
            </div> 
        </div> 
        
        <div id="header_bottom">
            <p>
                <h style="color: red">Доброго дня, ${userName} </h>
                <sec:authorize access="hasAnyRole('USER', 'ADMIN')">
                    <sec:authorize access="hasRole('USER')">
                        <a href="/cabinet">| Власний кабінет |</a>
                    </sec:authorize>

                    <sec:authorize access="hasRole('ADMIN')">
                        <a href="/adminall">| Власний кабінет |</a>
                    </sec:authorize>

                    <sec:authorize access="hasRole('USER')">
                        <a href="/shoppingcart">Кошик</a> <span>
                    <c:if test="${sizeShoppingCart ne null}"> (${sizeShoppingCart})   </c:if></span>
                    </sec:authorize>
                </sec:authorize>
            </p>

            <div id="tooplate_search">
                <form action="/search_courses_index" method="post">
                    <input type="text" placeholder="Пошук...." name="pattern">

                </form>

            </div>
        </div> 
    </div>





<div id="tooplate_main"><span class="main_border main_border_t"></span><span class="main_border main_border_b"></span>
   <c:if test="${size > 0}">
           <table class="" cellspacing='3' width="900" >
            <thead>
            <tr class='even' >


                <td><b>Замовлення №</b></td>
                <td><b>Вартість замовлення</b></td>
                <td><b>Що замовленно</b></td>
            </tr>
            </thead>
            <c:forEach items="${orders}" var="orders">
                <tr>

                    <td > ${orders.numberOrder}</td>
                    <td style="width: 150px">  ${orders.priceOrder} грн. </td>
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

    </c:if>

    <c:if test="${size < 1}">

        <h1 align="center" >Ви нічого не замовляли!</h1>
        <h1 align="center" > <img align="center" height="160" title="Замолення" width="160" src="resources/jpg/zakaz.png"/></h1>
    </c:if>





</div>



<div id="tooplate_footer_wrapper">
	<div id="tooplate_footer">
    	© 2017 Ковальчук В.Ю. - Designed by <a href="http://prog.kiev.ua">prog.kiev.ua</a>
    </div>
</div>
</div>




</body>
</html>