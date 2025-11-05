<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<style>
    /* Toàn bộ nền trang */
    body {
        background: linear-gradient(135deg, #1e1e2d, #2b2b40, #3a3a55);
        background-size: 200% 200%;
        animation: gradientMove 12s ease infinite;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: 'Segoe UI', Roboto, sans-serif;
        color: #e4e8f0;
        margin: 0;
        padding: 0;
    }

    @keyframes gradientMove {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    /* Card chính giữa */
    .custom-card {
        width: 400px;
        background-color: rgba(47, 47, 71, 0.95);
        border: 1px solid rgba(90, 90, 140, 0.3);
        border-radius: 20px;
        box-shadow: 0 15px 50px rgba(0, 0, 0, 0.6);
        backdrop-filter: blur(10px);
        transition: all 0.4s ease;
    }

    .custom-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.7);
    }

    /* Tiêu đề */
    .card-header-text {
        color: #ffffff;
        font-weight: 700;
        font-size: 1.4rem;
        letter-spacing: 0.5px;
        text-shadow: 0 0 8px rgba(108, 99, 255, 0.5);
    }

    /* Label và input */
    .form-label {
        color: #c8c8db;
        font-weight: 500;
    }

    .form-control {
        background-color: #3c3c5a;
        border: 1px solid #5a5a80;
        color: #ffffff;
        border-radius: 10px;
        padding: 12px 14px;
        transition: all 0.3s ease;
        font-size: 0.95rem;
    }

    .form-control::placeholder {
        color: #a5a5c4;
    }

    .form-control:focus {
        background-color: #42426b;
        border-color: #6c63ff;
        box-shadow: 0 0 0 0.25rem rgba(108, 99, 255, 0.35);
        color: #fff;
    }

    /* Nút bấm chính */
    .btn-primary {
        background: linear-gradient(135deg, #6c63ff, #5146d9);
        border: none;
        border-radius: 10px;
        padding: 12px;
        font-weight: 600;
        font-size: 1rem;
        letter-spacing: 0.4px;
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        background: linear-gradient(135deg, #7b72ff, #5c52e0);
        transform: scale(1.04);
        box-shadow: 0 0 15px rgba(108, 99, 255, 0.45);
    }

    /* Link quay lại */
    .back-link {
        color: #9aa0c7;
        text-decoration: none;
        transition: color 0.3s ease;
        font-size: 0.95rem;
    }

    .back-link:hover {
        color: #6c63ff;
        text-decoration: underline;
    }

    /* Thông báo alert */
    .alert {
        border-radius: 10px;
        font-weight: 500;
        padding: 10px;
        margin-bottom: 15px;
        font-size: 0.95rem;
    }

    .alert-success {
        background-color: rgba(72, 187, 120, 0.1);
        border: 1px solid rgba(72, 187, 120, 0.3);
        color: #48bb78;
    }

    .alert-danger {
        background-color: rgba(229, 62, 62, 0.1);
        border: 1px solid rgba(229, 62, 62, 0.3);
        color: #f56565;
    }

    /* Hiệu ứng mượt cho toàn form */
    form {
        animation: fadeIn 0.8s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>

<div class="container d-flex align-items-center justify-content-center min-vh-100">
    <div class="card p-4 rounded-4 custom-card shadow-lg" style="width:400px;">
        <h4 class="text-center card-header-text mb-4">🔒 Đặt lại mật khẩu</h4>


        <% if (request.getAttribute("message") != null) { %>
        <div class="alert alert-success text-center fw-semibold" role="alert">
            <%= request.getAttribute("message") %>
        </div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger text-center fw-semibold" role="alert">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="/reset-password" method="post">
            <input type="hidden" name="token" value="${param.token}">

            <div class="mb-3">
                <label for="newPassword" class="form-label">Mật khẩu mới</label>
                <input type="password" id="newPassword" name="newPassword" class="form-control" placeholder="Nhập mật khẩu mới..." required minlength="4">
            </div>

            <div class="mb-4">
                <label for="confirmPassword" class="form-label">Xác nhận mật khẩu</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Nhập lại mật khẩu..." required minlength="4">
            </div>

            <button type="submit" class="btn btn-primary w-100 fw-semibold">Đổi mật khẩu</button>
        </form>

        <div class="mt-3 text-center">
            <a href="/login" class="back-link">← Quay lại Đăng nhập</a>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
