<%@page import="com.javaweb.security.utils.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<header class="store-header">
    <div class="container">
        <div class="inner-wrap">
            <div class="inner-logo">
                <a href="/trang-chu">
                    <img src="/web/assets/images/ChatGPT Image 22_03_58 21 thg 8, 2025.png" alt="Computer Shop Logo" onerror="this.style.display='none'">
                    <span>Computer<span style="color: var(--primary);">Shop</span></span>
                </a>
            </div>

            <button type="button" class="navigation-toggle" aria-expanded="false" aria-controls="store-navigation" aria-label="Menu">
                <i class="fa-solid fa-bars"></i>
            </button>

            <nav class="inner-item" id="store-navigation" aria-label="Điều hướng chính">
                <ul>
                    <li><a href="/trang-chu"><i class="fa-solid fa-house me-1"></i> Trang chủ</a></li>
                    <li><a href="/product"><i class="fa-solid fa-laptop me-1"></i> Sản phẩm</a></li>
                    <li><a href="/khuyen-mai"><i class="fa-solid fa-tags me-1"></i> Khuyến mãi</a></li>
                    <li><a href="/tin-tuc"><i class="fa-solid fa-newspaper me-1"></i> Tin tức</a></li>
                    <li><a href="/gioi-thieu"><i class="fa-solid fa-circle-info me-1"></i> Giới thiệu</a></li>
                </ul>
            </nav>

            <div class="header-actions">
                <div class="inner-cart">
                    <a href="/cart" class="cart-link" aria-label="Giỏ hàng">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span>Giỏ hàng</span>
                        <span id="cart-count" class="cart-count">${not empty cartCount ? cartCount : 0}</span>
                    </a>
                </div>

                <div class="inner-login">
                    <security:authorize access="isAnonymous()">
                        <a class="account-link btn-login" href="/login">
                            <i class="fa-solid fa-right-to-bracket"></i> Đăng nhập
                        </a>
                        <a class="account-link btn-signup" href="/sign-in">
                            <i class="fa-solid fa-user-plus"></i> Đăng ký
                        </a>
                    </security:authorize>

                    <security:authorize access="isAuthenticated()">
                        <a class="account-link btn-user" href="/login">
                            <i class="fa-solid fa-user-circle"></i> <%=SecurityUtils.getPrincipal().getUserName()%>
                        </a>
                        <a class="account-link btn-logout" href="/logout">
                            <i class="fa-solid fa-arrow-right-from-bracket"></i> Thoát
                        </a>
                    </security:authorize>
                </div>
            </div>
        </div>
    </div>
</header>
