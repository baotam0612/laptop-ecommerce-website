<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>Đơn hàng</title>
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    /* Khung tổng thể */
    .main-container {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.08);
        padding: 24px;
        margin-top: 20px;
    }

    /* Tiêu đề */
    .main-container h5 {
        color: #2c3e50;
        font-weight: 600;
        border-left: 5px solid #0d6efd;
        padding-left: 10px;
        margin-bottom: 20px;
    }

    /* Bảng */
    .table {
        border-radius: 10px;
        overflow: hidden;
        background-color: #fff;
        margin-bottom: 0;
    }

    .table thead {
        background-color: #cfe2ff;
    }

    .table thead th {
        font-weight: 600;
        color: #2c3e50;
        vertical-align: middle;
        font-size: 15px;
    }

    .table tbody tr {
        transition: all 0.2s ease-in-out;
    }

    .table tbody tr:hover {
        background-color: #eef5ff;
        transform: scale(1.005);
    }

    /* Cột nội dung */
    .table td {
        padding: 12px 10px;
        color: #34495e;
        vertical-align: middle;
    }

    /* Nút thao tác */
    .btn {
        padding: 5px 10px;
        border-radius: 6px;
        font-size: 13px;
        font-weight: 500;
        transition: all 0.2s ease;
    }

    .btn-success {
        background-color: #27ae60;
        border: none;
    }
    .btn-success:hover {
        background-color: #1f8b4d;
        transform: scale(1.05);
    }

    .btn-danger {
        background-color: #e74c3c;
        border: none;
    }
    .btn-danger:hover {
        background-color: #c0392b;
        transform: scale(1.05);
    }

    /* Trạng thái */
    .text-warning {
        color: #f39c12 !important;
    }

    .text-success {
        color: #27ae60 !important;
    }

    .text-danger {
        color: #e74c3c !important;
    }

    .text-uppercase {
        text-transform: uppercase;
    }

    .text-muted {
        color: #7f8c8d !important;
    }
</style>
</head>

<body>

<div class="main-container mt-4 bg-white p-4 shadow-sm rounded-3">
    <h5 class="mb-3">Danh sách đơn hàng</h5>
    <div class="table-responsive">
        <table class="table table-bordered table-striped align-middle text-center">
            <thead class="table-primary">
            <tr>
                <th>ID</th>
                <th>Khách hàng</th>
                <th>Địa chỉ</th>
                <th>Ngày đặt</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="o" items="${orders}">
                <tr>
                    <td>${o.id}</td>
                    <td>
                        <c:choose>
                            <c:when test="${o.customer != null}">
                                ${o.customer.fullName}
                            </c:when>
                            <c:otherwise><em>Chưa có</em></c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${o.customer != null}">
                                ${o.customer.address}
                            </c:when>
                            <c:otherwise>-</c:otherwise>
                        </c:choose>
                    </td>
                    <td><fmt:formatDate value="${o.date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td><fmt:formatNumber value="${o.totalAmount}" type="number"/> VND</td>
                    <td>
                            <span class="
                                <c:choose>
                                    <c:when test="${o.status == 'PENDING'}">text-warning</c:when>
                                    <c:when test="${o.status == 'APPROVED'}">text-success</c:when>
                                    <c:when test="${o.status == 'CANCELLED'}">text-danger</c:when>
                                </c:choose>
                            fw-bold text-uppercase">${o.status}</span>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${o.status == 'PENDING'}">
                                <a href="<c:url value='/admin/order/approve/${o.id}'/>"
                                   onclick="return confirm('Xác nhận duyệt đơn hàng #${o.id}?');"
                                   class="btn btn-sm btn-success">Duyệt</a>

                                <a href="<c:url value='/admin/order/cancel/${o.id}'/>"
                                   onclick="return confirm('Bạn có chắc muốn hủy đơn hàng #${o.id}?');"
                                   class="btn btn-sm btn-danger">Hủy</a>
                            </c:when>
                            <c:otherwise>
                                <em class="text-muted">Không khả dụng</em>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty orders}">
                <tr>
                    <td colspan="7">Không có đơn hàng nào.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
</div>
</body>
</html>
