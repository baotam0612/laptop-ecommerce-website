<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="container-fluid p-0" style="max-width: 650px;">
    <!-- Header -->
    <div class="d-flex align-items-center justify-content-between mb-4">
        <div>
            <h3 class="fw-bold text-dark mb-1">Chỉnh Sửa Quyền Tài Khoản</h3>
            <p class="text-muted mb-0">Cập nhật vai trò truy cập hệ thống cho người dùng.</p>
        </div>
        <div>
            <a href="/admin/users" class="btn btn-outline-secondary d-inline-flex align-items-center gap-1" style="border-radius: var(--radius-md);">
                <i class="fa-solid fa-arrow-left"></i> Quay lại
            </a>
        </div>
    </div>

    <!-- Edit Role Card -->
    <div class="admin-card">
        <form:form method="post" action="/admin/users/update" modelAttribute="user">
            <form:hidden path="id"/>

            <div class="mb-3">
                <label class="form-label fw-semibold text-secondary">Tên đăng nhập:</label>
                <div class="input-group">
                    <span class="input-group-text bg-light border"><i class="fa-solid fa-user text-muted"></i></span>
                    <form:input path="userName" readonly="true" cssClass="form-control bg-light"/>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label fw-semibold text-secondary">Địa chỉ Email:</label>
                <div class="input-group">
                    <span class="input-group-text bg-light border"><i class="fa-solid fa-envelope text-muted"></i></span>
                    <form:input path="email" readonly="true" cssClass="form-control bg-light"/>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label fw-semibold text-secondary d-block">Chọn vai trò hệ thống:</label>
                <div class="p-3 bg-light border rounded-3">
                    <c:forEach var="role" items="${roles}">
                        <div class="form-check mb-2">
                            <form:checkbox path="roles"
                                           value="${role.id}"
                                           cssClass="form-check-input"
                                           id="roleCheckbox__${role.id}" />
                            <label class="form-check-label fw-semibold text-dark" for="roleCheckbox__${role.id}">
                                ${role.code}
                                <small class="text-muted ms-1 font-monospace">
                                    <c:choose>
                                        <c:when test='${role.code == "ADMIN"}'>- Quyền quản trị toàn hệ thống</c:when>
                                        <c:otherwise>- Quyền thành viên mua hàng</c:otherwise>
                                    </c:choose>
                                </small>
                            </label>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="d-flex justify-content-end gap-2 pt-3 border-top">
                <a href="/admin/users" class="btn btn-light border px-4" style="border-radius: var(--radius-md);">Hủy</a>
                <button type="submit" class="btn btn-primary px-4" style="border-radius: var(--radius-md); background: var(--primary-gradient); border: none;">
                    <i class="fa-solid fa-floppy-disk me-1"></i> Lưu thay đổi
                </button>
            </div>
        </form:form>
    </div>
</div>
