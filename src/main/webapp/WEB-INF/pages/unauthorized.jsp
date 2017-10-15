<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <title>Доступ заборонено</title>
    <link rel="stylesheet" href="/resources/css/access_denied.css">
</head>

<body class="page_bg">
<div class="wrapper">
    <div class="pagebody">
        <div class="dbottom">
            <div class="dtop">
                <div class="dcont">
                    <div class="header"></div>
                    <div class="message"><div class="blockicon">
                        <span><img src="resources/jpg/auth1.png" style="margin:-110px auto;"/></span></div>
                        <div class="inner">
                            <div class="msg_text">Ви були перенаправлені на цю сторінку, так як у вас немає прав перегляду даної сторінки.</div>
                        </div>
                    </div>
                    <div class="content">
                        <p class="morelink"><h1>Можливі дії:</h1>Для перегляду даної сторінки Вам необхідно <a href="/login" target="_blank">увійти</a> в систему як
                        адміндміністратор.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="inner"></div>
    </div>
</div>
</body>
</html>
</html>