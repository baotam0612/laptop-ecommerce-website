<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="productListURL" value="/admin/product-list" />

<div class="container-fluid p-0">
    <!-- Header & Action Button -->
    <div class="d-flex align-items-center justify-content-between mb-4">
        <div>
            <h3 class="fw-bold text-dark mb-1">Quản Lý Sản Phẩm</h3>
            <p class="text-muted mb-0">Tìm kiếm, lọc và quản lý thông tin cấu hình sản phẩm trong kho.</p>
        </div>
        <div>
            <a href="/admin/product-edit" class="btn btn-primary d-inline-flex align-items-center gap-2" style="border-radius: var(--radius-md); background: var(--primary-gradient); border: none;">
                <i class="fa-solid fa-plus"></i> Thêm sản phẩm mới
            </a>
        </div>
    </div>

    <!-- Search / Filter Card -->
    <div class="admin-card">
        <div class="admin-card-header">
            <h5><i class="fa-solid fa-filter text-primary me-2"></i> Bộ lọc tìm kiếm</h5>
        </div>

        <form:form modelAttribute="modelSearch" id="listForm" method="GET">
            <div class="row g-3">
                <div class="col-md-4 col-sm-6">
                    <div class="form-group mb-0">
                        <label>Tên sản phẩm</label>
                        <form:input class="form-control" path="name" placeholder="Nhập tên sản phẩm..."/>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6">
                    <div class="form-group mb-0">
                        <label>Loại sản phẩm</label>
                        <form:input class="form-control" path="category" placeholder="Laptop, PC, Phụ kiện..."/>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6">
                    <div class="form-group mb-0">
                        <label>Hãng sản xuất</label>
                        <form:input class="form-control" path="brand" placeholder="Asus, Dell, HP, Apple..."/>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="form-group mb-0">
                        <label>CPU</label>
                        <form:input class="form-control" path="cpu" placeholder="Intel i7, Ryzen 7..."/>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="form-group mb-0">
                        <label>GPU</label>
                        <form:input class="form-control" path="gpu" placeholder="RTX 4060, Iris Xe..."/>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="form-group mb-0">
                        <label>Bộ nhớ trong (ROM)</label>
                        <form:input class="form-control" path="rom" placeholder="512GB, 1TB SSD..."/>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6">
                    <div class="form-group mb-0">
                        <label>Bộ nhớ tạm (RAM)</label>
                        <form:input class="form-control" path="ram" placeholder="16GB, 32GB DDR5..."/>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4">
                <a href="/admin/product-list" class="btn btn-light border px-4" style="border-radius: var(--radius-md);">
                    <i class="fa-solid fa-rotate-left me-1"></i> Đặt lại
                </a>
                <button type="submit" class="btn btn-primary px-4" style="border-radius: var(--radius-md); background: var(--primary-gradient); border: none;">
                    <i class="fa-solid fa-magnifying-glass me-1"></i> Tìm kiếm
                </button>
            </div>
        </form:form>
    </div>

    <!-- Product List Table Card -->
    <div class="admin-card">
        <div class="admin-card-header">
            <h5><i class="fa-solid fa-table-list text-primary me-2"></i> Danh sách sản phẩm (${productList.listResult.size()})</h5>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-light">
                    <tr>
                        <th style="width: 60px;" class="text-center">ID</th>
                        <th>Tên sản phẩm</th>
                        <th>Loại</th>
                        <th>Hãng</th>
                        <th>CPU</th>
                        <th>GPU</th>
                        <th>ROM</th>
                        <th>RAM</th>
                        <th style="width: 140px;" class="text-center">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${productList.listResult}">
                        <tr>
                            <td class="text-center fw-bold text-muted">${item.id}</td>
                            <td class="fw-semibold text-dark">${item.name}</td>
                            <td><span class="badge bg-light text-primary border">${item.category}</span></td>
                            <td><span class="badge bg-light text-dark border">${item.brand}</span></td>
                            <td><small>${item.cpu}</small></td>
                            <td><small>${item.gpu}</small></td>
                            <td><small>${item.rom}</small></td>
                            <td><small>${item.ram}</small></td>
                            <td class="text-center">
                                <a href="/admin/product-edit-${item.id}" class="btn btn-sm btn-outline-primary me-1" title="Sửa">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </a>
                                <button class="btn btn-sm btn-outline-danger btnDelete" data-id="${item.id}" title="Xóa">
                                    <i class="fa-solid fa-trash-can"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty productList.listResult}">
                        <tr>
                            <td colspan="9" class="text-center py-5 text-muted">
                                <i class="fa-solid fa-folder-open mb-2" style="font-size: 2rem;"></i>
                                <p class="mb-0">Không tìm thấy sản phẩm nào trong hệ thống.</p>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    $(document).on('click', '.btnDelete', function(){
        var proId = $(this).data("id");
        if(!confirm("Bạn có chắc chắn muốn xóa sản phẩm #" + proId + " khỏi hệ thống?")) return;

        $.ajax({
            type: "POST",
            url: "/api/product/remove",
            data: JSON.stringify({ productId: proId }),
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond) {
                alert("✅ Đã xóa sản phẩm thành công!");
                location.reload();
            },
            error: function (respond) {
                alert("❌ Không thể xóa sản phẩm. Vui lòng thử lại!");
            }
        });
    });
</script>