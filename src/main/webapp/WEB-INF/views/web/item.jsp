<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<section class="product-detail-section">
    <div class="container">
        <!-- Breadcrumb -->
        <div style="margin-bottom: 1.5rem; font-size: 0.9rem; color: var(--text-muted);">
            <a href="/trang-chu" style="color: var(--primary);"><i class="fa-solid fa-house me-1"></i> Trang chủ</a> 
            <span style="margin: 0 8px;">/</span> 
            <a href="/product" style="color: var(--primary);">Sản phẩm</a> 
            <span style="margin: 0 8px;">/</span> 
            <span>${item.name}</span>
        </div>

        <div class="product-detail-card">
            <!-- Left: Product Image -->
            <div class="detail-img-box">
                <img src="${item.imagespath}" alt="${item.name}" onerror="this.src='https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?auto=format&fit=crop&w=600&q=80'">
            </div>

            <!-- Right: Product Info & Actions -->
            <div class="detail-content">
                <h1>${item.name}</h1>
                <div class="detail-price"><fmt:formatNumber value="${item.price}" pattern="#,###"/> VND</div>

                <ul class="detail-spec-list">
                    <li><i class="fa-solid fa-circle-check"></i> Cam kết 100% hàng chính hãng, nguyên seal</li>
                    <li><i class="fa-solid fa-circle-check"></i> Bảo hành chính hãng 12 - 24 tháng toàn quốc</li>
                    <li><i class="fa-solid fa-circle-check"></i> 1 đổi 1 trong 30 ngày nếu có lỗi do nhà sản xuất</li>
                    <li><i class="fa-solid fa-circle-check"></i> Miễn phí giao hàng & hỗ trợ kỹ thuật tận nơi</li>
                </ul>

                <!-- Add to Cart Form -->
                <form id="cartForm">
                    <input type="hidden" name="productId" value="${item.id}">
                    <div class="quantity-picker">
                        <label for="quantity">Số lượng mua:</label>
                        <input type="number" id="quantity" name="quantity" value="1" min="1" max="10">
                    </div>
                    <div>
                        <button type="button" id="btnAddToCart" class="btn-add-to-cart">
                            <i class="fa-solid fa-cart-plus"></i> Thêm vào giỏ hàng
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<script>
    $('#btnAddToCart').click(function() {
        var data = {};
        var formData = $('#cartForm').serializeArray();
        $.each(formData, function(i, v) {
            if(v.name === 'quantity' && parseInt(v.value) > 10) {
                v.value = 10;
            }
            data[v.name] = v.value;
        });

        $.ajax({
            type: "POST",
            url: "/cart/add",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(response) {
                if (response.status === 'success') {
                    $('#cart-count').text(response.cartCount);
                    alert("🛒 Đã thêm sản phẩm vào giỏ hàng thành công!");
                } else {
                    alert("⚠️ Không thể thêm sản phẩm vào giỏ!");
                }
            },
            error: function(xhr, status, error) {
                alert("Không thể thêm sản phẩm vào giỏ hàng!");
            }
        });
    });
</script>
