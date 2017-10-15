
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Стань програмістом</title>

    <link href="resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" href="/resources/css/ddsmoothmenu.css" />
    <script type="text/javascript" src="resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="resources/js/ddsmoothmenu.js">


    </script>

    <script type="text/javascript">

        ddsmoothmenu.init({
            mainmenuid: "tooplate_menu",
            orientation: 'h',
            classname: 'ddsmoothmenu',
            //customtheme:
            contentsource: "markup"
        })

    </script>

    <link rel="stylesheet" type="text/css" media="all" href="resources/css/jquery.dualSlider.0.2.css" />

    <script src="resources/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="resources/js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="resources/js/jquery.timers-1.2.js" type="text/javascript"></script>
    <script src="resources/js/jquery.dualSlider.0.3.min.js" type="text/javascript"></script>


    <script type="text/javascript">

        $(document).ready(function() {

            $("#carousel").dualSlider({
                auto:false,
                autoDelay: 6000,
                easingCarousel: "swing",
                easingDetails: "easeOutBack",
                durationCarousel: 1000,
                durationDetails: 600
            });

        });


    </script>

    <link rel="stylesheet" href="resources/css/slimbox2.css" type="text/css" media="screen" />
    <script type="text/JavaScript" src="resources/js/slimbox2.js"></script>

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






    <div id="tooplate_slider" class="section_content"><span class="frame"></span>
        <div id="carousel">
            <div class="panel">

                <div class="details_wrapper">

                    <div class="details">
                        <c:forEach items="${coursesList}" var="courses" end="2">
                        <div class="detail">
                            <h2>${courses.nameCourses}</h2>
                            <p>Акційна пропозиція курс ${courses.nameCourses} всього за ${courses.price} грн. не прогав свій шанс </p>
                            <a href="/description?nameCourses=${courses.nameCourses}" title="Дізнатися більше" class="slider_more">Дізнатися більше</a>
                        </div>

                        </c:forEach>


                    </div>

                </div>

            </div>

            <a href="javascript:void(0);" class="previous" title="Previous" >Previous</a>
            <a href="javascript:void(0);" class="next" title="Next">Next</a>

            <div id="slider-image-frame">
                <div class="backgrounds">

                    <div class="item item_1">
                        <img style="height: 288px; width: 900px" src="resources/jpg/001.jpg" alt="image" />
                    </div>

                    <div class="item item_2">
                        <img src="resources/jpg/002.jpg" alt="image" />
                    </div>

                    <div class="item item_3">
                        <img src="resources/jpg/003.jpg" alt="image" />
                    </div>



                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>







    <div id="tooplate_main"><span class="main_border main_border_t"></span><span class="main_border main_border_b"></span>
        <div class="product">
            <h1>Новий навчальний курс</h1>
            <c:forEach items="${coursesList}" var="courses" end="3">
            <div class="product_box">
                <div class="img_box"><span></span>
                    <a href="/description?nameCourses=${courses.nameCourses}"><img style="width:160px; height: 145px" src="/photo/${courses.nameCourses}" alt="image" /></a>
                </div>
                <h2><a href="/description?nameCourses=${courses.nameCourses}">${courses.nameCourses}</a></h2>
                <p class="price">${courses.price} грн.</p>
            </div>
            </c:forEach>
        </div>
        <div class="clear h20"></div>
        <hr />
        <div class="clear h10"></div>
    </div>
</div>


<div id="tooplate_footer_wrapper">
    <div id="tooplate_footer">
        © 2017 Ковальчук В.Ю.- Designed by <a href="http://prog.kiev.ua">prog.kiev.ua</a>
    </div>
</div>

</body>
</html>