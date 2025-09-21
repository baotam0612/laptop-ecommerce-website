<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
   

    <style>
        :root {
            --brand-gradient: linear-gradient(135deg, #0ea5e9 0%, #6366f1 60%, #8b5cf6 100%);
        }

        body {
            min-height: 100vh;
            background: radial-gradient(1200px 600px at 10% 10%, rgba(99, 102, 241, .18), transparent),
                radial-gradient(800px 400px at 90% 90%, rgba(14, 165, 233, .18), transparent),
                #0b1220;
            color: #e5e7eb;
        }

        .logo-dot {
            width: 44px;
            height: 44px;
            border-radius: 14px;
            background: var(--brand-gradient);
            box-shadow: 0 10px 30px rgba(99, 102, 241, .35);
        }

        .login-card {
            background: rgba(17, 24, 39, .6);
            border: 1px solid rgba(255, 255, 255, .08);
            box-shadow: 0 20px 80px rgba(0, 0, 0, .35);
            backdrop-filter: blur(10px);
        }

        .btn-brand {
            background: var(--brand-gradient);
            border: none;
            color: #fff;
        }

        .btn-brand:hover {
            filter: brightness(1.05);
        }

        .form-floating>label {
            color: #94a3b8;
        }

        .form-control,
        .form-check-input {
            background-color: rgba(15, 23, 42, .6);
            color: #e5e7eb;
            border-color: rgba(255, 255, 255, .15);
        }

        .form-control:focus {
            background-color: rgba(15, 23, 42, .85);
            color: #fff;
            border-color: #6366f1;
            box-shadow: 0 0 0 .2rem rgba(99, 102, 241, .25);
        }

        .link-muted {
            color: #a3aed0;
        }

        .link-muted:hover {
            color: #d0d6f0;
        }

        /* subtle grid */
        .grid-overlay {
            position: fixed;
            inset: 0;
            pointer-events: none;
            opacity: .22;
            mask-image: radial-gradient(ellipse at center, black, transparent 70%);
        }

        .grid-overlay svg {
            width: 100%;
            height: 100%;
        }

        @media (max-width: 576px) {
            .card-body {
                padding: 1.25rem !important;
            }
        }
    </style>

</head>
<body>
   <dec:body/>
   
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>