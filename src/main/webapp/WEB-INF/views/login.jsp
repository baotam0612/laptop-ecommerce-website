<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<div class="container py-4 d-flex align-items-center justify-content-center" style="min-height: 100vh;">
    <div class="card auth-card w-100" style="max-width: 960px;">
        <div class="row g-0">
            <!-- Left Branding Banner (Desktop) -->
            <div class="col-lg-6 d-none d-lg-flex flex-column justify-content-between p-5" style="background: linear-gradient(135deg, rgba(2, 132, 199, 0.25) 0%, rgba(37, 99, 235, 0.15) 100%); border-right: 1px solid rgba(255,255,255,0.08);">
                <div>
                    <a href="/trang-chu" class="d-inline-flex align-items-center gap-2 text-white fw-bold fs-4 text-decoration-none">
                        <i class="fa-solid fa-desktop text-primary"></i>
                        <span>Computer<span class="text-primary">Shop</span></span>
                    </a>
                </div>

                <div class="my-auto py-4">
                    <h2 class="display-6 fw-bold text-white mb-3">Chào Mừng Quay Trở Lại!</h2>
                    <p class="text-secondary mb-4" style="color: #94a3b8 !important;">Đăng nhập để quản lý đơn hàng, theo dõi các sản phẩm yêu thích và nhận ngập tràn ưu đãi công nghệ hấp dẫn.</p>
                    
                    <div class="d-flex flex-column gap-3">
                        <div class="d-flex align-items-center gap-3 text-white-50">
                            <i class="fa-solid fa-circle-check text-primary fs-5"></i>
                            <span>Bảo mật tài khoản tuyệt đối với chuẩn mã hóa</span>
                        </div>
                        <div class="d-flex align-items-center gap-3 text-white-50">
                            <i class="fa-solid fa-circle-check text-primary fs-5"></i>
                            <span>Theo dõi trạng thái giao hàng tức thì</span>
                        </div>
                    </div>
                </div>

                <div class="text-muted small">
                    &copy; 2026 ComputerShop. All rights reserved.
                </div>
            </div>

            <!-- Right Login Form -->
            <div class="col-lg-6 p-4 p-md-5 auth-form">
                <div class="auth-header text-start mb-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <span class="badge bg-primary px-3 py-2 rounded-pill font-monospace">HỆ THỐNG</span>
                        <a href="/trang-chu" class="auth-link small"><i class="fa-solid fa-arrow-left me-1"></i> Về trang chủ</a>
                    </div>
                    <h2>Đăng Nhập</h2>
                    <p>Nhập thông tin tài khoản của bạn để tiếp tục</p>
                </div>

                <% if (request.getParameter("error") != null) { %>
                    <div class="alert alert-danger py-2 text-center small mb-4" role="alert" style="background: rgba(239, 68, 68, 0.15); border-color: rgba(239, 68, 68, 0.3); color: #fca5a5;">
                        <i class="fa-solid fa-triangle-exclamation me-1"></i> Tên đăng nhập hoặc mật khẩu không chính xác!
                    </div>
                <% } %>

                <% if (request.getParameter("logout") != null) { %>
                    <div class="alert alert-success py-2 text-center small mb-4" role="alert" style="background: rgba(16, 185, 129, 0.15); border-color: rgba(16, 185, 129, 0.3); color: #86efac;">
                        <i class="fa-solid fa-circle-check me-1"></i> Đã đăng xuất thành công!
                    </div>
                <% } %>

                <form action="j_spring_security_check" id="formLogin" method="post">
                    <div class="mb-3">
                        <label for="userName" class="form-label">Tên đăng nhập</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="userName" name="j_username" placeholder="Nhập tên đăng nhập..." required autofocus>
                        </div>
                    </div>

                    <div class="mb-3">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                            <label for="password" class="form-label mb-0">Mật khẩu</label>
                            <a class="auth-link small" href="/forgot-password">Quên mật khẩu?</a>
                        </div>
                        <div class="input-group">
                            <input type="password" class="form-control" id="password" name="j_password" placeholder="••••••••" minlength="4" required>
                        </div>
                    </div>

                    <div class="form-check mb-4">
                        <input class="form-check-input" type="checkbox" id="remember" checked style="accent-color: var(--primary);">
                        <label class="form-check-label text-secondary small" for="remember" style="color: #cbd5e1 !important;">
                            Ghi nhớ phiên đăng nhập
                        </label>
                    </div>

                    <button class="btn btn-auth w-100 py-3 mb-3" type="submit">
                        <i class="fa-solid fa-right-to-bracket me-2"></i> Đăng Nhập
                    </button>

                    <p class="text-center text-muted small mb-0">
                        Chưa có tài khoản? <a class="auth-link fw-semibold" href="/sign-in">Đăng ký ngay</a>
                    </p>
                </form>
            </div>
        </div>
    </div>
</div>
