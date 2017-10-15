
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>

<title>Власний кабінет</title>


<link href="resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="resources/css/ddsmoothmenu.css" />
    <link rel="stylesheet" href="/resources/css/box.css">
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
   <button type="button" id="delete" class="btn btn-default navbar-btn">Видалити повідомлення</button>

    <table class="table table-striped">

        <c:forEach items="${mailList}" var="mail">
            <tr>
                <td><input type="checkbox" name="toDelete[]" value="${mail.id}" id="checkbox_${mail.id}"/></td>
                <td>   <div class="alert-box success"><span style="color: #0000FF">${mail.time}: </span>   ${mail.mail}  </div> </td>

            </tr>
        </c:forEach>

    </table>

		<hr />
    </c:if>


    <c:if test="${size < 1}">
        <h1 align="center" >Ви нічого не писали!</h1>
        <h1 align="center" > <img align="center" height="160" title="Замолення" width="160" src="resources/jpg/mail.png"/></h1>
    </c:if>
</div>



<div id="tooplate_footer_wrapper">
	<div id="tooplate_footer">
    	© 2017 Ковальчук В.Ю. - Designed by <a href="http://prog.kiev.ua">prog.kiev.ua</a>
    </div>
</div>
</div>


<script>


    $('#delete').click(function(){
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