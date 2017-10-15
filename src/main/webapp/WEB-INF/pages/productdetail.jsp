<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Деталі курсу</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <link href="resources/css/tooplate_style.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="resources/css/ddsmoothmenu.css"/>

    <script type="text/javascript" src="resources/js/jquery.min.js"></script>


    <script src="resources/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="resources/js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="resources/js/jquery.timers-1.2.js" type="text/javascript"></script>
    <script src="resources/js/jquery.dualSlider.0.3.min.js" type="text/javascript"></script>

    <script type="text/javascript" src="resources/js/jquery.min.js"></script>
    <link rel="stylesheet" href="resources/css/slimbox2.css" type="text/css" media="screen"/>
    <script type="text/JavaScript" src="resources/js/slimbox2.js"></script>

</head>
<body>


<div id="tooplate_wrapper">
    <div id="tooplate_header">
        <div id="header_top">
            <div id="site_title"><a href="/">Clothing Template</a></div>
            <div id="tooplate_menu" class="ddsmoothmenu">
                <ul>
                    <a href="/" class="button1">НА ГОЛОВНУ</a>
                    <a href="/products" class="button1">НАШІ КУРСИ</a>
                    <a href="/contact" class="button1">КОНТАКТИ</a>

                    <sec:authorize access="hasRole('ANONYMOUS')">
                        <a style="color: #22ff00" href="/login" class="button1"> УВІЙТИ </a>
                    </sec:authorize>

                    <sec:authorize access="hasAnyRole('USER', 'ADMIN')">
                        <a style="color: red" href="/logout" class="button1"> ВИЙТИ </a>
                    </sec:authorize>
                </ul>
                <br style="clear: left"/>
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
                    <c:if test="${sizeShoppingCart ne null}"> (${sizeShoppingCart}) </c:if></span>
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


    <div id="tooplate_main"><span class="main_border main_border_t"></span><span
            class="main_border main_border_b"></span>

        <div class="product">
            <div class="col col_2 product_preview">
                <img src="/photo/${nameCourses}" style="width: 200px; height: 200px" class=" left" alt="image"/></a>

            </div>
            <div class="col col_2 product_detail">
                <h1>Про курс:</h1>

                <p>${descriptionOfCourses}</p>
                <div class="clear h20"></div>
                <sec:authorize access="hasAnyRole('USER', 'ADMIN')">
                    <p class="price">${price} грн.<span></span></p>
                    <div class="clear h20"></div>

                    <a href="/addCourse?nameCourses=${nameCourses}" class="button left">Додати до корзини</a>
                </sec:authorize>

                <sec:authorize access="hasRole('ANONYMOUS')">
                    <p style="color:red;">Шановний користувач, для того щоб придбати курс вам необхідно
                        <a href="/login" style="color: red">АВТОРИЗУВАТИСЯ</a> в системі</p>
                </sec:authorize>


            </div>
            <div class="">
            </div>

            <div class="clear"></div>
        </div>

        <hr/>

        <div class="product">
            <h2>Рекомендуємо пройти:</h2>
            <c:forEach items="${coursesList}" var="courses">
                <div class="product_box">
                    <div class="img_box"><span></span>
                        <a href="/description?nameCourses=${courses.nameCourses}"><img
                                style="width:160px; height: 145px" src="/photo/${courses.nameCourses}" alt="image"/></a>
                    </div>
                    <h2><a href="/description?nameCourses=${courses.nameCourses}">${courses.nameCourses}</a></h2>
                    <p class="price">${courses.price} грн.</p>
                </div>
            </c:forEach>
        </div>


        <div class="clear"></div>
    </div>

</div>


<div id="tooplate_footer_wrapper">
    <div id="tooplate_footer">
        © 2017 Ковальчук В.Ю. - Designed by <a href="http://prog.kiev.ua">prog.kiev.ua</a>
    </div>
</div>

</body>
</html>