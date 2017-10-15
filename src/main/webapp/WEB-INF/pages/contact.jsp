<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html >
<head>
<meta />
<title>Наші контакти</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<link href="resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="resources/css/ddsmoothmenu.css" />

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
    	
        
        <div class="col col_2">
        	
        	<div id="contact_form">
            <div class="col_4 left">
            <h5>Адреса офісу:</h5>
            метро Золоті Ворта вулиця<br />
            Володимирська 67, бізнес центр<br />
            "Аврора" 4 поверх 345 кабінет<br /><br />
            
            Тел. : 099-999-9999<br />
            Факс: 067-777-7777<br /><br />
            
         
			</div>
            <div class="col_4 right">
            <h5>Адреса школи:</h5>
            метро Золоті Воротв вулиця<br />
            Володимирська 34,  школа №432<br />
            клас 345<br /><br />
            
            Тел. : 095-555-5555<br />
            Факс: 093-333-3333 
            </div>
                <sec:authorize access="hasRole('USER')">
                <div class="clear h30"></div>
                <form method="post" action="/sendMail" method="POST">
                    <label for="text">Повідомлення:</label> <textarea id="text" name="mail" rows="0" cols="0" class="required" minlength="20" maxlength="200"></textarea>
                    <input type="submit" name="Submit" value="Відправити" class="submit_btn" />
                </form>

                </sec:authorize>
        </div>

        </div>
        
        <div class="col col_2">
        	
          

   <div class="img_border">
			

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2540.6170944047644!2d30.51164401540546!3d50.4482324954063!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40d4ce5791674ff5%3A0xf04c07850e2acf98!2z0JfQvtC70L7RgtGL0LUg0LLQvtGA0L7RgtCw!5e0!3m2!1sru!2sua!4v1506975510518" width="430" height="450" frameborder="0" style="border:0" allowfullscreen></iframe></div>
          


  <br /><small><a href="https://www.google.com.ua/maps/place/%D0%97%D0%BE%D0%BB%D0%BE%D1%82%D1%8B%D0%B5+%D0%B2%D0%BE%D1%80%D0%BE%D1%82%D0%B0/@50.4482325,30.511644,17z/data=!3m1!4b1!4m5!3m4!1s0x40d4ce5791674ff5:0xf04c07850e2acf98!8m2!3d50.4482291!4d30.5138328?hl=ru" style="color:#0000FF;text-align:left"> Відкрити карту </a></small>
        </div>
    	
		



<div class="clear"></div>
            
        <div class="clear"></div>
    </div> 
    
</div> 





<div id="tooplate_footer_wrapper">
	<div id="tooplate_footer">
    	© 2017 Ковальчук В.Ю.  
        
        - Designed by <a href="http://prog.kiev.ua">prog.kiev.ua</a>
    </div> <!-- END of footer -->
</div> <!-- END of footer wrapper -->

</body>
</html>