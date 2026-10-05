<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng Quản Trị - Computer Shop</title>
    
    <!-- Google Fonts & Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom Styles -->
    <link rel="stylesheet" href="/web/assets/css/base.css">
    <link rel="stylesheet" href="/web/assets/css/style.css">
    <link rel="stylesheet" href="/web/assets/css/responsive.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="admin-page">
    <%@ include file="/common/admin/header.jsp" %>

    <div class="admin-shell">
        <%@ include file="/common/admin/menu.jsp" %>
        <main class="admin-content d-flex flex-column">
            <div class="flex-grow-1">
                <dec:body/>
            </div>
            <%@ include file="/common/admin/footer.jsp" %>
        </main>
    </div>

    <!-- Bootstrap Bundle JS & Responsive script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/web/assets/js/responsive.js"></script>
</body>
</html>