
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="container d-flex align-items-center justify-content-center min-vh-100">
    <div class="card p-4 rounded-4 shadow-lg custom-card" style="width:420px;">
        <h3 class="text-center mb-4 card-header-text">📝 Đăng ký tài khoản</h3>

        <%-- Thông báo --%>
        <% if (request.getAttribute("message") != null) { %>
        <div class="alert alert-success text-center fw-semibold">
            <%= request.getAttribute("message") %>
        </div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger text-center fw-semibold">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="/sign-in" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Tên đăng nhập</label>
                <input type="text" id="username" name="username" class="form-control"
                       placeholder="Nhập tên đăng nhập..." required minlength="3">
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" name="email" class="form-control"
                       placeholder="example@gmail.com" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu</label>
                <input type="password" id="password" name="password" class="form-control"
                       placeholder="Nhập mật khẩu..." required minlength="4">
            </div>

            <div class="mb-4">
                <label for="confirmPassword" class="form-label">Xác nhận mật khẩu</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control"
                       placeholder="Nhập lại mật khẩu..." required minlength="4">
            </div>

            <button type="submit" class="btn btn-primary w-100 fw-semibold">Đăng ký</button>
        </form>

        <div class="mt-3 text-center">
            <a href="/login" class="back-link">← Quay lại Đăng nhập</a>
        </div>
    </div>
</div>

<style>
    body {
        background: radial-gradient(circle at top left, #2b2b40, #1e1e2d);
        color: #e4e8f0;
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
    }

    .custom-card {
        background-color: #2f2f47;
        border: 1px solid #3e3e5c;
        transition: all 0.3s ease;
    }

    .custom-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 35px rgba(0, 0, 0, 0.5);
    }

    .card-header-text {
        color: #fff;
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
        box-shadow: 0 0 0 0.25rem rgba(108, 99, 255, 0.25);
        color: #fff;
    }

    .btn-primary {
        background: linear-gradient(135deg, #6c63ff, #5146d9);
        border: none;
        border-radius: 10px;
        padding: 10px;
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
    }
</style>

</body>
</html>
