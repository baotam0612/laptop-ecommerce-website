<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="admin-header">
    <div class="main-container">
        <div class="brand-title">
            <i class="fa-solid fa-gauge-high" style="color: var(--primary);"></i>
            <span>Computer<span style="color: var(--primary);">Shop</span> Admin</span>
        </div>

        <div style="display: flex; align-items: center; gap: 16px;">
            <a href="/trang-chu" target="_blank" class="btn btn-sm btn-outline-light d-none d-md-inline-flex align-items-center gap-1" style="border-radius: var(--radius-md);">
                <i class="fa-solid fa-arrow-up-right-from-square"></i> Xem cửa hàng
            </a>

            <div class="admin-user-badge">
                <i class="fa-solid fa-circle-user" style="color: var(--primary);"></i>
                <span class="fw-semibold"><%=SecurityUtils.getPrincipal() != null ? SecurityUtils.getPrincipal().getUserName() : "Admin"%></span>
            </div>

            <a href="/logout" class="btn btn-sm btn-danger d-inline-flex align-items-center gap-1" style="border-radius: var(--radius-md);">
                <i class="fa-solid fa-power-off"></i>
            </a>

            <button type="button" class="navigation-toggle" aria-controls="admin-navigation" aria-expanded="false" aria-label="Toggle Menu">
                <i class="fa-solid fa-bars"></i>
            </button>
        </div>
    </div>
</header>
