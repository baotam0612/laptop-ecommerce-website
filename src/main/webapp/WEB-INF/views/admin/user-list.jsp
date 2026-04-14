<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Danh sách tài khoản</title>

</head>

<body>
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .main-container1 {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.08);
        padding: 24px;
        margin-top: 20px;
    }

    .main-container1 h5 {
        color: #2c3e50;
        font-weight: 600;
        border-left: 5px solid #0d6efd;
        padding-left: 10px;
        margin-bottom: 20px;
    }

    .table {
        border-radius: 10px;
        overflow: hidden;
        background-color: #fff;
        margin-bottom: 0;
        width: 100%;
        border-collapse: collapse;
    }

    .table thead {
        background-color: #cfe2ff;
    }

    .table thead th {
        font-weight: 600;
        color: #2c3e50;
        vertical-align: middle;
        font-size: 15px;
        padding: 12px 10px;
    }

    .table tbody tr {
        transition: all 0.2s ease-in-out;
    }

    .table tbody tr:hover {
        background-color: #eef5ff;
        transform: scale(1.005);
    }

    .table td {
        padding: 12px 10px;
        color: #34495e;
        vertical-align: middle;
        text-align: center;
    }

    .badge {
        display: inline-block;
        padding: 4px 8px;
        border-radius: 5px;
        font-size: 12px;
        font-weight: 500;
        color: #fff;
        margin: 0 3px;
    }

    .badge-admin {
        background-color: #0d6efd;
    }

    .badge-user {
        background-color: #27ae60;
    }

    .btn {
        padding: 5px 10px;
        border-radius: 6px;
        font-size: 13px;
        font-weight: 500;
        text-decoration: none;
        transition: all 0.2s ease;
        cursor: pointer;
    }

    .btn-edit {
        background-color: #27ae60;
        color: white;
    }

    .btn-edit:hover {
        background-color: #1f8b4d;
        transform: scale(1.05);
    }

    .btn-delete {
        background-color: #e74c3c;
        color: white;
    }

    .btn-delete:hover {
        background-color: #c0392b;
        transform: scale(1.05);
    }

    .text-muted {
        color: #7f8c8d !important;
    }
</style>

<div class="main-container1">
    <h5>Danh sách tài khoản</h5>
    <div class="table-responsive">
        <table class="table table-bordered table-striped align-middle text-center">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên đăng nhập</th>
                <th>Email</th>
                <th>Vai trò</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.userName}</td>
                    <td>${user.email}</td>

                    <td>
                        <c:forEach var="role" items="${user.roles}">
                            <span class="badge <c:choose>
                                <c:when test='${role.code == "ADMIN"}'>badge-admin</c:when>
                                <c:otherwise>badge-user</c:otherwise>
                            </c:choose>">${role.code}</span>
                        </c:forEach>
                    </td>
                    <td>
                        <c:if test='SecurityUtils.getPrincipal().getUserName()=="admin"'>
                        <c:forEach var="role" items="${user.roles}">
                        <c:if test='${user.roles.code == "USER"}'><a href="<c:url value='/admin/users/edit/${user.id}'/>" class="btn btn-edit">Sửa</a>
                        <a href="<c:url value='/admin/users/delete/${user.id}'/>"
                           onclick="return confirm('Bạn có chắc muốn xóa tài khoản này?')"
                           class="btn btn-delete">Xóa</a></c:if>
                            </c:forEach>
</c:if>

                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty users}">
                <tr>
                    <td colspan="5" class="text-muted"><em>Không có tài khoản nào.</em></td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>


