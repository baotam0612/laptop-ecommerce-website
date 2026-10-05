<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<div class="container py-5 d-flex align-items-center justify-content-center" style="min-height: 100vh;">
    <div class="card auth-card w-100 p-4 p-md-5 auth-form" style="max-width: 480px;">
        <div class="auth-header">
            <div class="logo-badge">
                <i class="fa-solid fa-lock"></i>
            </div>
            <h2>Đặt Lại Mật Khẩu</h2>
            <p>Vui lòng tạo mật khẩu mới an toàn cho tài khoản của bạn</p>
        </div>

        <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-success text-center fw-semibold small mb-4" style="background: rgba(16, 185, 129, 0.15); border-color: rgba(16, 185, 129, 0.3); color: #86efac;">
                <i class="fa-solid fa-circle-check me-1"></i> <%= request.getAttribute("message") %>
            </div>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger text-center fw-semibold small mb-4" style="background: rgba(239, 68, 68, 0.15); border-color: rgba(239, 68, 68, 0.3); color: #fca5a5;">
                <i class="fa-solid fa-triangle-exclamation me-1"></i> <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="/reset-password" method="post">
            <input type="hidden" name="token" value="${param.token}">

            <div class="mb-3">
                <label for="newPassword" class="form-label">Mật khẩu mới</label>
                <div class="input-group">
                    <input type="password" id="newPassword" name="newPassword" class="form-control" placeholder="••••••••" required minlength="4" autofocus>
                </div>
            </div>

            <div class="mb-4">
                <label for="confirmPassword" class="form-label">Xác nhận mật khẩu mới</label>
                <div class="input-group">
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="••••••••" required minlength="4">
                </div>
            </div>

            <button type="submit" class="btn btn-auth w-100 py-3 mb-3">
                <i class="fa-solid fa-shield-check me-2"></i> Lưu Mật Khẩu Mới
            </button>
        </form>

        <div class="text-center mt-3">
            <a href="/login" class="auth-link small"><i class="fa-solid fa-arrow-left me-1"></i> Quay lại Đăng nhập</a>
        </div>
    </div>
</div>
