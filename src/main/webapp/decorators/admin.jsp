<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/web/assets/css/reset.css">
    <link rel="stylesheet" href="/web/assets/css/base.css">
    <link rel="stylesheet" href="/web/assets/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>

        body {
            min-height: 100vh;
        }
        header {
            background-color: var(--color-one);
        }

        header .main-container .content {
            color: var(--color-four);
            padding: 20px 0;
            font-size: 24px;
            font-weight: 600;
            padding-left: 20px;
        }

        .sidebar {
            min-width: 200px;
            max-width: 200px;
            background-color: #fff;
            color: #495057;
            background-color: #e4eef9;
        }

        .sidebar a {
            color: #495057;
            text-decoration: none;
            display: block;
            padding: 10px 15px;
            border-radius: 5px;
            margin-bottom: 5px;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background-color: #fff;
        }

        .form-group .form-control {
            width: 65%;
            height: 40px;
            border: 1px solid #ccc;
            border-radius: 6px;
            padding: 8px 12px;
        }
         .search button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: var(--color-one);
            border-radius: 8px;
        }
         .edit a button {
            margin-top: 20px;
            padding: 10px 15px;
            background-color: var(--color-one);
            border-radius: 8px;
        }

        .form-button .addProduct button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: var(--color-one);
            border-radius: 8px;
        }

        .form-button .deleteProduct button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: var(--color-one);
            border-radius: 8px;
        }
    </style>

    
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">  
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap (nếu bạn dùng UI của Bootstrap như button, table, modal,...) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  
   <%@ include file="/common/admin/header.jsp" %>
   <div class="d-flex">
   
   <%@include file="/common/admin/menu.jsp" %>
   
   <dec:body/>
   
    <%@ include file="/common/admin/footer.jsp" %>

</body>
</html>