<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
<div class="main-content">
    <div class="container">
        <div class="inner-wrap">
            <div class="inner-logo">
                <img src="${item.imagespath}" alt="">
            </div>
            <div class="inner-content">
                <h2>${item.name}</h2>
                <p>${item.price} VND</p>

                <!-- 🧾 Form gửi dữ liệu AJAX -->
                <form id="cartForm">
                    <input type="hidden" name="productId" value="${item.id}">
                    <label for="quantity">Số lượng:</label>
                    <input type="number" id="quantity" name="quantity" value="1" min="1" max="10">
                    <button type="button" id="btnAddToCart">🛒 Thêm vào giỏ</button>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $('#btnAddToCart').click(function() {
        // 1️⃣ Lấy dữ liệu form
        var data = {};
        var formData = $('#cartForm').serializeArray();
        $.each(formData, function(i, v) {
            if(v.value > 10) {
                v.value = 10;
            }
            data[v.name] = v.value;

        });

        console.log("📦 Dữ liệu gửi:", data);

        //Gửi AJAX POST dạng JSON
        $.ajax({
            type: "POST",
            url: "/cart/add",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(response) {
                console.log("ok");

                if (response.status === 'success') {
                    $('#cart-count').text(response.cartCount);
                    alert("🛒 Đã thêm sản phẩm vào giỏ hàng!");
                } else {
                    alert("⚠️ Không thể thêm sản phẩm!");
                }
            },
            error: function(xhr, status, error) {
                console.error("🚨 Lỗi AJAX:", error);
                alert("Không thể thêm sản phẩm vào giỏ hàng!");
            }
        });
    });
</script>
</body>
</html>
