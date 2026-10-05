<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<section class="cart-page-section">
    <div class="container">
        <h1 class="section-title">Giỏ Hàng Của Bạn</h1>

        <c:if test="${empty cartItems}">
            <div class="cart-table-card" style="text-align: center; padding: 4rem 2rem;">
                <i class="fa-solid fa-cart-shopping" style="font-size: 3.5rem; color: #cbd5e1; margin-bottom: 1.5rem;"></i>
                <h3 style="color: var(--text-main); margin-bottom: 0.75rem;">Giỏ hàng của bạn đang trống</h3>
                <p style="color: var(--text-muted); margin-bottom: 2rem;">Hãy khám phá các sản phẩm công nghệ tuyệt vời và chọn cho mình sản phẩm ưng ý nhất!</p>
                <a href="/product" class="btn-primary-custom">
                    <i class="fa-solid fa-arrow-left me-1"></i> Tiếp tục mua sắm
                </a>
            </div>
        </c:if>

        <c:if test="${not empty cartItems}">
            <div class="cart-table-card">
                <div class="table-scroll" style="overflow-x: auto;">
                    <table class="custom-table">
                        <thead>
                            <tr>
                                <th>Hình ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Đơn giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${cartItems}">
                                <tr>
                                    <td>
                                        <img src="${item.image}" alt="${item.name}" class="product-thumb" onerror="this.src='https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?auto=format&fit=crop&w=150&q=80'">
                                    </td>
                                    <td style="font-weight: 600; text-align: left; max-width: 300px;">${item.name}</td>
                                    <td><fmt:formatNumber value="${item.price}" pattern="#,###"/> VND</td>
                                    <td>
                                        <span style="font-weight: 700; background: var(--bg-surface-subtle); padding: 4px 12px; border-radius: var(--radius-sm); border: 1px solid var(--border-color);">${item.quantity}</span>
                                    </td>
                                    <td style="font-weight: 700; color: var(--primary);"><fmt:formatNumber value="${item.total}" pattern="#,###"/> VND</td>
                                    <td>
                                        <button class="btn-remove remove-btn" data-id="${item.id}" title="Xóa khỏi giỏ">
                                            <i class="fa-solid fa-trash-can me-1"></i> Xóa
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="cart-summary-box">
                    <a href="/product" style="color: var(--primary); font-weight: 600; display: inline-flex; align-items: center; gap: 6px;">
                        <i class="fa-solid fa-arrow-left"></i> Tiếp tục chọn thêm sản phẩm
                    </a>

                    <div style="display: flex; align-items: center; gap: 24px; flex-wrap: wrap;">
                        <div class="cart-total-text">
                            Tổng thanh toán: <span><fmt:formatNumber value="${total}" pattern="#,###"/> VND</span>
                        </div>

                        <!-- If logged in -->
                        <security:authorize access="isAuthenticated()">
                            <button id="checkout-btn" class="btn-primary-custom" style="padding: 12px 32px; font-size: 1.05rem;">
                                <i class="fa-solid fa-credit-card me-1"></i> Đặt hàng ngay
                            </button>
                        </security:authorize>

                        <!-- If not logged in -->
                        <security:authorize access="isAnonymous()">
                            <a href="/login" class="btn-primary-custom" style="background: var(--accent); padding: 12px 32px; font-size: 1.05rem;">
                                <i class="fa-solid fa-right-to-bracket me-1"></i> Đăng nhập để đặt hàng
                            </a>
                        </security:authorize>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</section>

<script>
    $(".remove-btn").click(function() {
        var productId = $(this).data("id");
        if (!confirm("Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?")) return;

        $.ajax({
            type: "POST",
            url: "/cart/remove",
            data: JSON.stringify({ productId: productId }),
            contentType: "application/json",
            dataType: "JSON",
            success: function(res) {
                if (res.status === "success") {
                    location.reload();
                }
            }
        });
    });

    $("#checkout-btn").click(function(){
        if(!confirm("Xác nhận tiến hành đặt hàng ngay bây giờ?")) return;

        $.ajax({
            type: "POST",
            url: "order/checkout",
            contentType: "application/json",
            data: JSON.stringify({}),
            success: function(response){
                if (response.status === "empty_cart") {
                    alert("Giỏ hàng của bạn đang trống!");
                } else if (response.status === "success") {
                    alert("🎉 Đặt hàng thành công! Mã đơn hàng của bạn là: #" + response.orderId);
                    window.location.href = "/trang-chu"; 
                }
            },
            error: function(xhr){
                alert("Có lỗi khi đặt hàng: " + xhr.responseText);
            }
        });
    });
</script>
