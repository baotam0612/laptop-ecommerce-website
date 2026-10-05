<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="container-fluid p-0">
    <!-- Header -->
    <div class="d-flex align-items-center justify-content-between mb-4">
        <div>
            <h3 class="fw-bold text-dark mb-1">Quản Lý Tài Khoản Người Dùng</h3>
            <p class="text-muted mb-0">Xem danh sách người dùng và phân quyền hệ thống (Admin / User).</p>
        </div>
    </div>

    <!-- User List Table Card -->
    <div class="admin-card">
        <div class="admin-card-header">
            <h5><i class="fa-solid fa-users-gear text-primary me-2"></i> Danh sách tài khoản (${users.size()})</h5>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0 text-center">
                <thead class="table-light">
                    <tr>
                        <th style="width: 70px;">ID</th>
                        <th class="text-start">Tên đăng nhập</th>
                        <th class="text-start">Email liên hệ</th>
                        <th>Vai trò hệ thống</th>
                        <th style="width: 140px;">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td class="fw-bold text-muted">#${user.id}</td>
                            <td class="text-start fw-semibold text-dark">
                                <i class="fa-solid fa-user-circle me-1 text-primary"></i> ${user.userName}
                            </td>
                            <td class="text-start text-secondary">${user.email}</td>
                            <td>
                                <c:forEach var="role" items="${user.roles}">
                                    <span class="badge 
                                        <c:choose>
                                            <c:when test='${role.code == "ADMIN"}'>bg-primary text-white</c:when>
                                            <c:otherwise>bg-success text-white</c:otherwise>
                                        </c:choose>
                                        px-3 py-1 rounded-pill me-1 font-monospace">
                                        ${role.code}
                                    </span>
                                </c:forEach>
                            </td>
                            <td>
                                <a href="<c:url value='/admin/users/edit/${user.id}'/>" class="btn btn-sm btn-outline-primary me-1" title="Phân quyền">
                                    <i class="fa-solid fa-user-pen"></i> Sửa
                                </a>
                                <a href="<c:url value='/admin/users/delete/${user.id}'/>"
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa tài khoản ${user.userName}?');"
                                   class="btn btn-sm btn-outline-danger" title="Xóa">
                                    <i class="fa-solid fa-trash-can"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty users}">
                        <tr>
                            <td colspan="5" class="text-center py-5 text-muted">
                                <i class="fa-solid fa-user-slash mb-2" style="font-size: 2rem;"></i>
                                <p class="mb-0">Không có tài khoản người dùng nào trong hệ thống.</p>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
