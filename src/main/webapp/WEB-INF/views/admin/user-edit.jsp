<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa quyền</title>


</head>
<style>
    /* Body */
    body {
        background-color: #f4f6f9;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    /* Card container */
    .card {
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.08);
    }

    /* Card header */
    .card-header {
        font-weight: 600;
        font-size: 18px;
        border-left: 5px solid #0d6efd;
        padding-left: 15px;
    }

    /* Form labels */
    .form-label {
        font-weight: 500;
        color: #2c3e50;
    }

    /* Bold text inside form */
    .fw-bold {
        font-weight: 600;
        color: #34495e;
    }

    /* Checkbox styling */
    .form-check-input {
        transform: scale(1.2);
        margin-right: 8px;
        accent-color: #0d6efd;
    }

    .form-check-label {
        font-weight: 500;
        color: #2c3e50;
        cursor: pointer;
    }

    /* Buttons */
    .btn-success, .btn-danger {
        border-radius: 6px;
        font-weight: 500;
        padding: 10px 20px;
        transition: all 0.2s ease;
    }

    .btn-success:hover {
        background-color: #1f8b4d;
        transform: scale(1.05);
    }

    .btn-danger:hover {
        background-color: #c0392b;
        transform: scale(1.05);
    }

    /* Link back */
    .text-primary {
        font-weight: 500;
    }

    .text-primary:hover {
        text-decoration: underline;
    }

    /* Spacing for form and links */
    .mt-3 {
        margin-top: 15px !important;
    }

    .mt-4 {
        margin-top: 20px !important;
    }
</style>

<body class="bg-light">
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Chỉnh sửa tài khoản</h4>
                </div>
                <div class="card-body">

                    <form:form method="post" action="/admin/users/update" modelAttribute="user">
                        <form:hidden path="id"/>

                        <div class="mb-3">
                            <label class="form-label">Tên đăng nhập:</label>
                            <p class="fw-bold"><form:input path="userName" readonly="true"/></p>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email:</label>
                            <p class="fw-bold"><form:input path="email" readonly="true"/></p>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Chọn quyền:</label>
                            <c:forEach var="role" items="${roles}">
                                <div class="form-check">
                                    <form:checkbox path="roles"
                                                   value="${role.id}"
                                                   cssClass="form-check-input"
                                                   id="roleCheckbox__${role.id}" />
                                    <label class="form-check-label" for="roleCheckbox__${role.id}">
                                        ${role.code}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="d-flex justify-content-start mt-4">
                            <button type="submit" class="btn btn-success me-2">💾 Lưu thay đổi</button>
                            <a href="/admin/users" class="btn btn-danger">Hủy</a>
                        </div>

                    </form:form>

                </div>
            </div>

            <div class="mt-3">
                <a href="/admin/users" class="text-decoration-none text-primary">← Quay lại danh sách</a>
            </div>

        </div>
    </div>
</div>

</body>
</html>
