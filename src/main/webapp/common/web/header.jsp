<%@page import="com.javaweb.security.utils.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-logo">
                    <a href=""><img src="/spring-boot/web/assets/images/ChatGPT Image 22_03_58 21 thg 8, 2025.png" alt="Computer Shop">
</a>
                </div>
                <div class="inner-item">
                    <ul>
                        <li><a href="#">Giới thiệu</a></li>
                        <li><a href="#">Sản phẩm</a></li>
                        <li><a href="#">Tin tức</a></li>
                        <li><a href="#">Khuyến mãi</a></li>
                    </ul>
                </div>
                <div class="inner-login">
                <security:authorize access = "isAnonymous()">
                    <button><a href="/spring-boot/login">Đăng nhập</a></button>
                    <button><a href="">Đăng ký</a></button>
                    </security:authorize>
                    <security:authorize access = "isAuthenticated()">
                    <button><a href="/spring-boot/login"> Xin chào <%=SecurityUtils.getPrincipal().getUserName() %></a></button>
                    <button><a href="<c:url value='/logout'/>">Thoát</a></button>
                    </security:authorize>
                    
                </div>
            </div>
        </div>
    </header>
</body>
</html>