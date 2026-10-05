<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="container-fluid p-0">
    <!-- Header Greeting -->
    <div class="d-flex align-items-center justify-content-between mb-4">
        <div>
            <h3 class="fw-bold text-dark mb-1">Bảng Điều Khiển Tổng Quan</h3>
            <p class="text-muted mb-0">Chào mừng bạn quay trở lại hệ thống quản trị ComputerShop!</p>
        </div>
        <div>
            <a href="/admin/product-edit" class="btn btn-primary d-inline-flex align-items-center gap-2" style="border-radius: var(--radius-md); background: var(--primary-gradient); border: none;">
                <i class="fa-solid fa-plus"></i> Thêm sản phẩm mới
            </a>
        </div>
    </div>

    <!-- 4 KPI Stat Cards -->
    <div class="row g-3 mb-4">
        <div class="col-12 col-sm-6 col-xl-3">
            <div class="stat-card">
                <div class="stat-icon blue">
                    <i class="fa-solid fa-boxes-stacked"></i>
                </div>
                <div class="stat-info">
                    <h3>Sản Phẩm</h3>
                    <p>Quản lý kho hàng</p>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-xl-3">
            <div class="stat-card">
                <div class="stat-icon green">
                    <i class="fa-solid fa-receipt"></i>
                </div>
                <div class="stat-info">
                    <h3>Đơn Hàng</h3>
                    <p>Duyệt & Xử lý đơn</p>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-xl-3">
            <div class="stat-card">
                <div class="stat-icon purple">
                    <i class="fa-solid fa-users"></i>
                </div>
                <div class="stat-info">
                    <h3>Tài Khoản</h3>
                    <p>Khách hàng & Quyền</p>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-xl-3">
            <div class="stat-card">
                <div class="stat-icon orange">
                    <i class="fa-solid fa-shield-halved"></i>
                </div>
                <div class="stat-info">
                    <h3>Hệ Thống</h3>
                    <p>Hoạt động ổn định</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Shortcuts Card -->
    <div class="admin-card">
        <div class="admin-card-header">
            <h5><i class="fa-solid fa-bolt text-warning me-2"></i> Lối tắt thao tác nhanh</h5>
        </div>
        <div class="row g-3">
            <div class="col-md-4">
                <a href="/admin/product-list" class="p-3 border rounded-3 d-block text-decoration-none bg-light text-dark h-100 hover-shadow transition">
                    <div class="d-flex align-items-center gap-3">
                        <div class="stat-icon blue" style="width: 44px; height: 44px; font-size: 1.2rem;">
                            <i class="fa-solid fa-list"></i>
                        </div>
                        <div>
                            <div class="fw-bold">Danh sách sản phẩm</div>
                            <div class="small text-muted">Tìm kiếm, lọc, sửa và xóa sản phẩm</div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/admin/orders" class="p-3 border rounded-3 d-block text-decoration-none bg-light text-dark h-100 hover-shadow transition">
                    <div class="d-flex align-items-center gap-3">
                        <div class="stat-icon green" style="width: 44px; height: 44px; font-size: 1.2rem;">
                            <i class="fa-solid fa-truck-ramp-box"></i>
                        </div>
                        <div>
                            <div class="fw-bold">Duyệt đơn hàng mới</div>
                            <div class="small text-muted">Kiểm tra thông tin giao hàng & cập nhật trạng thái</div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="/admin/users" class="p-3 border rounded-3 d-block text-decoration-none bg-light text-dark h-100 hover-shadow transition">
                    <div class="d-flex align-items-center gap-3">
                        <div class="stat-icon purple" style="width: 44px; height: 44px; font-size: 1.2rem;">
                            <i class="fa-solid fa-user-shield"></i>
                        </div>
                        <div>
                            <div class="fw-bold">Phân quyền tài khoản</div>
                            <div class="small text-muted">Quản lý danh sách thành viên & quản trị viên</div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>