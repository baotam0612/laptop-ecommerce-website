<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="container-fluid p-0" style="max-width: 900px;">
    <!-- Header -->
    <div class="d-flex align-items-center justify-content-between mb-4">
        <div>
            <h3 class="fw-bold text-dark mb-1">
                <c:choose>
                    <c:when test="${not empty modelEdit.id}">Chỉnh Sửa Sản Phẩm #${modelEdit.id}</c:when>
                    <c:otherwise>Thêm Sản Phẩm Mới</c:otherwise>
                </c:choose>
            </h3>
            <p class="text-muted mb-0">Nhập đầy đủ thông tin cấu hình và tải lên hình ảnh sản phẩm.</p>
        </div>
        <div>
            <a href="/admin/product-list" class="btn btn-outline-secondary d-inline-flex align-items-center gap-1" style="border-radius: var(--radius-md);">
                <i class="fa-solid fa-arrow-left"></i> Quay lại
            </a>
        </div>
    </div>

    <!-- Form Card -->
    <div class="admin-card">
        <form:form modelAttribute="modelEdit" id="editForm" method="GET">
            <form:hidden path="id"/>

            <div class="row g-3">
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Tên sản phẩm <span class="text-danger">*</span></label>
                        <form:input class="form-control" path="name" placeholder="VD: Laptop Asus ROG Strix G16..." required="true"/>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Loại sản phẩm</label>
                        <form:input class="form-control" path="category" placeholder="Laptop, PC, Linh kiện..."/>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Hãng sản xuất</label>
                        <form:input class="form-control" path="brand" placeholder="Asus, Dell, HP, Apple, Lenovo..."/>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>CPU (Bộ vi xử lý)</label>
                        <form:input class="form-control" path="cpu" placeholder="VD: Intel Core i7 13650HX"/>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>GPU (Card đồ họa)</label>
                        <form:input class="form-control" path="gpu" placeholder="VD: NVIDIA GeForce RTX 4060 8GB"/>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Bộ nhớ trong (ROM / Ổ cứng)</label>
                        <form:input class="form-control" path="rom" placeholder="VD: 512GB NVMe PCIe 4.0 SSD"/>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Bộ nhớ tạm (RAM)</label>
                        <form:input class="form-control" path="ram" placeholder="VD: 16GB DDR5 4800MHz"/>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="form-group">
                        <label>Giá bán (VND) <span class="text-danger">*</span></label>
                        <form:input class="form-control" path="price" placeholder="VD: 25000000" type="number"/>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="form-group">
                        <label>Hình ảnh sản phẩm</label>
                        <input type="file" id="imageFile" name="imageFile" accept="image/*" class="form-control"/>
                        <div class="mt-3">
                            <img id="previewImage" src="${modelEdit.imagespath}" alt="Preview" style="max-height: 180px; border-radius: var(--radius-md); border: 1px solid var(--border-color); ${empty modelEdit.imagespath ? 'display:none;' : ''}" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-end gap-2 mt-4 pt-3 border-top">
                <a href="/admin/product-list" class="btn btn-light border px-4" style="border-radius: var(--radius-md);">Hủy bỏ</a>
                <button type="button" id="btnAddOrUpdateProduct" class="btn btn-primary px-4" style="border-radius: var(--radius-md); background: var(--primary-gradient); border: none;">
                    <i class="fa-solid fa-floppy-disk me-1"></i>
                    <c:choose>
                        <c:when test="${not empty modelEdit.id}">Cập nhật sản phẩm</c:when>
                        <c:otherwise>Lưu sản phẩm mới</c:otherwise>
                    </c:choose>
                </button>
            </div>
        </form:form>
    </div>
</div>

<script>
    $('#imageFile').change(function(e) {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#previewImage').attr('src', e.target.result).show();
            };
            reader.readAsDataURL(this.files[0]);
        }
    });

    $('#btnAddOrUpdateProduct').click(function (event) {
        event.preventDefault();
        const file = $('#imageFile')[0].files[0];
        if (file) {
            const formData = new FormData();
            formData.append("imageFile", file);

            $.ajax({
                url: "/api/product/upload-image",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function (res) {
                    if (res.status === "success") {
                        sendProductData(res.imageUrl);
                    }
                },
                error: function (err) {
                    console.log("Upload lỗi", err);
                    sendProductData(null);
                }
            });
        } else {
            sendProductData(null);
        }
    });

    function sendProductData(imageUrl) {
        const product = {
            id: $('input[name="id"]').val(),
            name: $('input[name="name"]').val(),
            category: $('input[name="category"]').val(),
            brand: $('input[name="brand"]').val(),
            cpu: $('input[name="cpu"]').val(),
            gpu: $('input[name="gpu"]').val(),
            rom: $('input[name="rom"]').val(),
            ram: $('input[name="ram"]').val(),
            price: $('input[name="price"]').val(),
            imagespath: imageUrl
        };

        $.ajax({
            url: "/api/product",
            type: "POST",
            data: JSON.stringify(product),
            contentType: "application/json",
            success: function (res) {
                alert("🎉 Lưu thông tin sản phẩm thành công!");
                window.location.href = "/admin/product-list";
            },
            error: function (err) {
                alert("❌ Có lỗi xảy ra khi lưu sản phẩm!");
            }
        });
    }
</script>