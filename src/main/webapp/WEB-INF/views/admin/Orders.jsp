<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="container-fluid p-0">
    <!-- Header -->
    <div class="d-flex align-items-center justify-content-between mb-4">
        <div>
            <h3 class="fw-bold text-dark mb-1">Quản Lý Đơn Hàng</h3>
            <p class="text-muted mb-0">Xem danh sách, kiểm tra thông tin khách hàng và xét duyệt đơn hàng.</p>
        </div>
    </div>

    <!-- Orders Table Card -->
    <div class="admin-card">
        <div class="admin-card-header">
            <h5><i class="fa-solid fa-receipt text-primary me-2"></i> Danh sách đơn hàng (${orders.size()})</h5>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0 text-center">
                <thead class="table-light">
                    <tr>
                        <th style="width: 70px;">Mã ĐH</th>
                        <th class="text-start">Khách hàng</th>
                        <th class="text-start">Địa chỉ giao hàng</th>
                        <th>Ngày đặt</th>
                        <th>Tổng tiền</th>
                        <th>Trạng thái</th>
                        <th style="width: 160px;">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="o" items="${orders}">
                        <tr>
                            <td class="fw-bold text-muted">#${o.id}</td>
                            <td class="text-start fw-semibold text-dark">
                                <c:choose>
                                    <c:when test="${o.customer != null}">
                                        <i class="fa-solid fa-user me-1 text-primary"></i> ${o.customer.fullName}
                                    </c:when>
                                    <c:otherwise><em class="text-muted">Chưa có thông tin</em></c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-start text-secondary">
                                <c:choose>
                                    <c:when test="${o.customer != null}">
                                        ${o.customer.address}
                                    </c:when>
                                    <c:otherwise>-</c:otherwise>
                                </c:choose>
                            </td>
                            <td><small><fmt:formatDate value="${o.date}" pattern="dd/MM/yyyy HH:mm"/></small></td>
                            <td class="fw-bold text-primary"><fmt:formatNumber value="${o.totalAmount}" pattern="#,###"/> VND</td>
                            <td>
                                <span class="badge 
                                    <c:choose>
                                        <c:when test="${o.status == 'PENDING'}">bg-warning text-dark</c:when>
                                        <c:when test="${o.status == 'APPROVED'}">bg-success text-white</c:when>
                                        <c:when test="${o.status == 'CANCELLED'}">bg-danger text-white</c:when>
                                        <c:otherwise>bg-secondary text-white</c:otherwise>
                                    </c:choose>
                                    px-3 py-2 rounded-pill font-monospace">${o.status}</span>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${o.status == 'PENDING'}">
                                        <a href="<c:url value='/admin/order/approve/${o.id}'/>"
                                           onclick="return confirm('Xác nhận phê duyệt đơn hàng #${o.id}?');"
                                           class="btn btn-sm btn-success me-1" title="Duyệt đơn">
                                            <i class="fa-solid fa-check"></i> Duyệt
                                        </a>

                                        <a href="<c:url value='/admin/order/cancel/${o.id}'/>"
                                           onclick="return confirm('Bạn có chắc muốn hủy đơn hàng #${o.id}?');"
                                           class="btn btn-sm btn-danger" title="Hủy đơn">
                                            <i class="fa-solid fa-xmark"></i> Hủy
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-muted small"><em>Hoàn tất</em></span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty orders}">
                        <tr>
                            <td colspan="7" class="text-center py-5 text-muted">
                                <i class="fa-solid fa-inbox mb-2" style="font-size: 2rem;"></i>
                                <p class="mb-0">Chưa có đơn hàng nào được tạo trong hệ thống.</p>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
