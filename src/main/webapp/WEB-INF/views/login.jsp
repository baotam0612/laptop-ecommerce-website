<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="grid-overlay">
        <svg xmlns="http://www.w3.org/2000/svg">
            <defs>
                <pattern id="grid" width="28" height="28" patternUnits="userSpaceOnUse">
                    <path d="M 28 0 L 0 0 0 28" fill="none" stroke="rgba(255,255,255,.12)" stroke-width="0.5"></path>
                </pattern>
            </defs>
            <rect width="100%" height="100%" fill="url(#grid)"></rect>
        </svg>
    </div>

    <div class="container py-5 py-md-0 d-flex align-items-center" style="min-height:100vh;">
        <div class="row g-4 justify-content-center w-100">
            <div class="col-12 col-md-10 col-lg-8 col-xl-6">
                <div class="card login-card rounded-4">
                    <div class="row g-0">
                        <!-- Left brand / message (hidden on small) -->
                        <div class="col-lg-6 d-none d-lg-flex align-items-center justify-content-center p-4">
                            <div class="text-center px-3">
                                <div class="logo-dot mb-3 mx-auto"></div>
                                <h2 class="h4 fw-semibold text-white mb-2">Chào mừng</h2>
                                <p class="mb-0 text-secondary">Đăng nhập để tiếp tục làm việc</p>
                            </div>
                        </div>

                        <!-- Right form -->
                        <div class="col-lg-6">
                            <div class="card-body p-4 p-md-5">
                                <div class="d-flex align-items-center gap-3 mb-4">
                                    <div class="logo-dot"></div>
                                    <div>
                                        <div class="small text-secondary">Tài khoản</div>
                                        <h1 class="h5 text-white mb-0">Đăng nhập</h1>
                                    </div>
                                </div>

                               <form action="j_spring_security_check" id="formLogin" method="post">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="userName" name="j_username"
                                            placeholder="name@example.com" required>
                                        <label for="email">Email</label>
                                        <div class="invalid-feedback">Vui lòng nhập email hợp lệ.</div>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control" id="password" name="j_password"  placeholder="••••••"
                                            minlength="4" required>
                                        <label for="password">Mật khẩu</label>
                                        <div class="invalid-feedback">Mật khẩu tối thiểu 4 ký tự.</div>
                                    </div>

                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" id="remember" checked>
                                            <label class="form-check-label" for="remember">Ghi nhớ đăng nhập</label>
                                        </div>
                                        <a class="link-offset-2 link-underline link-underline-opacity-0 link-muted"
                                            href="#">Quên mật khẩu?</a>
                                    </div>

                                    <button class="btn btn-brand w-100 py-2 rounded-3" type="submit">Đăng nhập</button>
                                    </form>

                                    <div class="text-center text-secondary small mt-3">hoặc</div>

                                    <div class="d-grid gap-2 mt-2">
                                        <button class="btn btn-outline-light rounded-3" type="button">Tiếp tục với
                                            Google</button>
                                        <button class="btn btn-outline-light rounded-3" type="button">Tiếp tục với
                                            Facebook</button>
                                    </div>

                                    <p class="text-center text-secondary small mt-3 mb-0">Chưa có tài khoản? <a
                                            class="link-muted" href="#">Đăng ký ngay</a></p>
                                </form>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (optional, used here for form validation helper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>