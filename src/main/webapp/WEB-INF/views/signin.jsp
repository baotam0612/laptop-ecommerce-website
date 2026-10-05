<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>

<div class="container py-5 d-flex align-items-center justify-content-center" style="min-height: 100vh;">
    <div class="card auth-card w-100 p-4 p-md-5 auth-form" style="max-width: 620px;">
        <div class="auth-header">
            <div class="logo-badge">
                <i class="fa-solid fa-user-plus"></i>
            </div>
            <h2>Đăng Ký Tài Khoản</h2>
            <p>Trở thành thành viên để tận hưởng trọn vẹn ưu đãi và dịch vụ tại ComputerShop</p>
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

        <form action="/sign-in" method="post">
            <div class="row g-3">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="fullName" class="form-label">Họ và tên <span class="text-danger">*</span></label>
                        <input type="text" id="fullName" name="fullName" class="form-control" placeholder="Nguyễn Văn A" required minlength="3">
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="username" class="form-label">Tên đăng nhập <span class="text-danger">*</span></label>
                        <input type="text" id="username" name="username" class="form-control" placeholder="nguyenvana" required minlength="3">
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="email" class="form-label">Địa chỉ Email <span class="text-danger">*</span></label>
                        <input type="email" id="email" name="email" class="form-control" placeholder="email@gmail.com" required>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="phoneNumber" class="form-label">Số điện thoại <span class="text-danger">*</span></label>
                        <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="0912345678" pattern="[0-9]{9,12}" required>
                    </div>
                </div>

                <div class="col-12">
                    <div class="form-group">
                        <label for="address" class="form-label">Địa chỉ nhận hàng <span class="text-danger">*</span></label>
                        <input type="text" id="address" name="address" class="form-control" placeholder="Số nhà, tên đường, phường/xã, quận/huyện..." required minlength="5">
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="password" class="form-label">Mật khẩu <span class="text-danger">*</span></label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="••••••••" required minlength="4">
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="confirmPassword" class="form-label">Xác nhận mật khẩu <span class="text-danger">*</span></label>
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="••••••••" required minlength="4">
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-auth w-100 py-3 mt-4 mb-3">
                <i class="fa-solid fa-user-check me-2"></i> Hoàn Tất Đăng Ký
            </button>
        </form>

        <div class="text-center mt-2">
            <span class="text-muted small">Đã có tài khoản? </span>
            <a href="/login" class="auth-link fw-semibold small">Đăng nhập ngay</a>
        </div>
    </div>
</div>