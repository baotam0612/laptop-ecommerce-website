<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<style>
    body {
        background: radial-gradient(circle at top left, #2b2b40, #1e1e2d);
        min-height: 100vh;
        font-family: 'Segoe UI', Roboto, sans-serif;
        color: #e4e8f0;
        margin: 0;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .custom-card {
        background-color: #2f2f47;
        border: 1px solid #3e3e5c;
        transition: all 0.3s ease;
    }

    .custom-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 12px 40px rgba(0, 0, 0, 0.6);
    }

    .card-header-text {
        color: #ffffff;
        font-weight: 700;
        letter-spacing: 0.5px;
    }

    .form-label {
        color: #c8c8db;
        font-weight: 500;
    }

    .form-control {
        background-color: #3c3c5a;
        border: 1px solid #575779;
        color: #ffffff;
        border-radius: 10px;
        padding: 10px 12px;
        transition: all 0.3s ease;
    }

    .form-control::placeholder {
        color: #a5a5c4;
    }

    .form-control:focus {
        background-color: #414164;
        border-color: #6c63ff;
        box-shadow: 0 0 0 0.25rem rgba(108, 99, 255, 0.3);
        color: #fff;
    }

    .btn-primary {
        background: linear-gradient(135deg, #6c63ff, #5146d9);
        border: none;
        border-radius: 10px;
        padding: 10px;
        font-weight: 600;
        letter-spacing: 0.3px;
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        background: linear-gradient(135deg, #7a72ff, #5e52e0);
        transform: scale(1.02);
        box-shadow: 0 0 12px rgba(108, 99, 255, 0.4);
    }

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

    .alert {
        border-radius: 10px;
        font-weight: 500;
        padding: 10px;
        margin-bottom: 15px;
    }
</style>
<div class="container d-flex align-items-center justify-content-center min-vh-100">
    <div class="card p-4 rounded-4 shadow-lg custom-card" style="width:400px;">
        <h4 class="mb-3 text-center card-header-text">🔑 Quên mật khẩu</h4>

        <%-- Thông báo thành công --%>
        <% if (request.getAttribute("message") != null) { %>
        <div class="alert alert-success text-center fw-semibold" role="alert">
            <%= request.getAttribute("message") %>
        </div>
        <% } %>

        <%-- Thông báo lỗi --%>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger text-center fw-semibold" role="alert">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="/forgot-password" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Nhập email của bạn</label>
                <input type="email" id="email" name="email" class="form-control" placeholder="example@gmail.com" required>
            </div>
            <button type="submit" class="btn btn-primary w-100 fw-semibold">Gửi link đặt lại mật khẩu</button>
        </form>

        <div class="mt-3 text-center">
            <a href="/login" class="back-link">← Quay lại Đăng nhập</a>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
