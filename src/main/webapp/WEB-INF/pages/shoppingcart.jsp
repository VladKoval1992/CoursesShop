<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> Корзина</title>

<link href="resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="resources/css/ddsmoothmenu.css" />


</head>
<body>

<div id="tooplate_wrapper">
	<div id="tooplate_header">
    	<div id="header_top">
        	<div id="site_title"><a href="/">Кошик</a></div>
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
        <c:if test="${sizeShoppingCart == null or sizeShoppingCart == 0}">

            <h1 align="center" >Ваша корзина порожня</h1>
        <h1 align="center" > <img align="center" height="160" title="Замолення" width="160" src="resources/jpg/zakaz.png"/></h1>
        </c:if>

        <c:if test="${sizeShoppingCart >0}">
            <div id="content">
    	<h1>У вас в корзині:</h1>
    	
        <table width="580px" cols="0" cellspacing="0" cellpadding="5">
          <tr bgcolor="#ddd">
                <th width="100" align="left"> Емблема </th>
                <th width="190" align="left">Назва </th>
                <th width="100" align="left"> Ціна </th>
                <th width="90"> </th>
                
          </tr>
            <c:forEach items="${selectedCourses}" var="courses" varStatus="id">

            <tr>
                <td><img style="width:160px; height: 145px" src="/photo/${courses.nameCourses}" alt="image" /></td>
                <td>${courses.nameCourses}</td>
                <td> ${courses.price} грн.</td>
                <td align="center"> <a href="/deleteCourseShoppingcart?id=${id.index}">
                    <img src="resources/jpg/remove.png" alt="Видалити" /><br />Видалити</a> </td>
            </tr>

            </c:forEach>


            <tr>
                 <td align="right"></td>
                <td style="color: red">   <p class="right">Всього на суму:</p></td>
                <td style="color: red">   <p class="left">${costOfCourses} грн.</p></td>
                <td>   <p class="left"><a href="/checkout" class="button">Придбати</a></p>  </td>
            </tr>

        </table>


        
		</div>

        <div id="sidebar">
			<div class="sidebar_section sidebar_section_bg">
               
                      <h3>Популярні курси</h3>
         		<ul class="sidebar_link_list popular_products">
                    <c:forEach items="${coursesList}" var="courses" end="5">
                    <li>
                        <a href="/description?nameCourses=${courses.nameCourses}"><img style="width:50px; height: 50px" src="/photo/${courses.nameCourses}" alt="image" /></a>
                        <a href="/description?nameCourses=${courses.nameCourses}">${courses.nameCourses}</a>
                        <p class="price">${courses.price} грн.</p>
					</li>
                    </c:forEach>






















              </ul>
            </div>
        </div>
        </c:if>

        <div class="clear"></div>
    </div> 
    
</div> 


<div id="tooplate_footer_wrapper">
	<div id="tooplate_footer">
    	© 2017 Ковальчук В.Ю.  
        
        - Designed by <a href="http://prog.kiev.ua">prog.kiev.ua</a>
    </div>
</div>

</body>
</html>
