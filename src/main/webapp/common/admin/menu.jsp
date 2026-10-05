<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Sidebar Navigation -->
<nav id="admin-navigation" class="sidebar" aria-label="Điều hướng quản trị">
    <div class="sidebar-heading">Menu Chính</div>
    
    <a href="/admin/home" id="nav-home">
        <i class="fa-solid fa-chart-pie"></i>
        <span>Tổng quan</span>
    </a>

    <a href="/admin/product-list" id="nav-products">
        <i class="fa-solid fa-boxes-stacked"></i>
        <span>Quản lý sản phẩm</span>
    </a>

    <a href="/admin/orders" id="nav-orders">
        <i class="fa-solid fa-receipt"></i>
        <span>Quản lý đơn hàng</span>
    </a>

    <a href="/admin/users" id="nav-users">
        <i class="fa-solid fa-users-gear"></i>
        <span>Quản lý tài khoản</span>
    </a>

    <div class="sidebar-heading" style="margin-top: 24px;">Hệ Thống</div>

    <a href="/trang-chu" target="_blank">
        <i class="fa-solid fa-globe"></i>
        <span>Trang bán hàng</span>
    </a>

    <a href="/logout" style="color: #f87171;">
        <i class="fa-solid fa-arrow-right-from-bracket"></i>
        <span>Đăng xuất</span>
    </a>
</nav>
