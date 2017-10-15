
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Власний кабінет</title>


<link href="resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="resources/css/ddsmoothmenu.css" />
    <link rel="stylesheet" href="/resources/css/box.css">

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
    <table class="table table-striped">
        <tr>

            <td align="center" width="700"><a  class="image" href="/editUser" ><img title="Профіль" height="160" width="160" src="resources/jpg/adminuser.png"/></a></td>
            <td align="center" width="700"><a class="image" href="/userletters" ><img height="160" title="Листи" width="160" src="resources/jpg/mail.png"/></a></td>
            <td align="center" width="700"><a class="image" href="/ordersuser" ><img height="160" title="Замолення" width="160" src="resources/jpg/zakaz.png"/></a></td>

        </tr>

        <tr>

            <td align="center" width="700"> Профіль </td>
            <td align="center" width="700"> Листи </td>
            <td align="center" width="700"> Замолення </td>

        </tr>

    </table>



            
		<hr />



</div>






<div id="tooplate_footer_wrapper">
	<div id="tooplate_footer">
    	© 2017 Ковальчук В.Ю. - Designed by <a href="http://prog.kiev.ua">prog.kiev.ua</a>
    </div>
</div>

</body>
</html>