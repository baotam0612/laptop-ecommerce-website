<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng của bạn</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2 style="text-align:center; height: 100px;">🛒 Giỏ hàng của bạn</h2>

<c:if test="${empty cartItems}">
    <p style="text-align:center; height: 200px;">Giỏ hàng trống!</p>
</c:if>

<c:if test="${not empty cartItems}">
    <table border="1" style="margin:auto; text-align:center;">
        <thead>
        <tr>
            <th>Ảnh</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Tổng</th>
            <th>Xóa</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${cartItems}">
            <tr>
                <td><img src="${item.image}" alt="" width="80"></td>
                <td>${item.name}</td>
                <td>${item.price} VND</td>
                <td>${item.quantity}</td>
                <td>${item.total} VND</td>
                <td><button class="remove-btn" data-id="${item.id}">Xóa</button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="total" style="margin-top:20px; text-align:center;">
        <h3>Tổng cộng: <span id="cart-total">${total}</span> VND</h3>
        <br>

        <!-- neu co tai khoan -->
        <security:authorize access="isAuthenticated()">
            <button id="checkout-btn" class="order-cart">🛍️ Đặt hàng</button>
        </security:authorize>

        <!-- neu khong co tai khoan -->
        <security:authorize access="isAnonymous()">
            <button onclick="window.location.href='/login'" class="order-cart">Đăng nhập để đặt hàng</button>
        </security:authorize>
    </div>
</c:if>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>




    $(".remove-btn").click(function() {
        var productId = $(this).data("id");

        $.ajax({
            type: "POST",
            url: "/cart/remove",
            data: JSON.stringify({ productId: productId }),
            contentType: "application/json",
            dataType: "JSON",
            success: function(res) {
                if (res.status === "success") {
                    alert("✅ Đã xóa sản phẩm khỏi giỏ!");
                    location.reload();
                }
            }
        });
    });


    $("#checkout-btn").click(function(){
        if(!confirm("Bạn có muốn đặt hàng không? :)))!")) return;

        $.ajax({
            type: "POST",
            url: "order/checkout",
            contentType: "application/json",
            data: JSON.stringify({}),
            success: function(response){
                if (response.status === "empty_cart") {
                    alert("Giỏ hàng của bạn đang trống!");
                } else if (response.status === "success") {
                    alert("Đặt hàng thành công! Mã đơn hàng: " + response.orderId);
                    window.location.href = "/trang-chu"; 
                }
            },
            error: function(xhr){
                alert("Có lỗi khi đặt hàng: " + xhr.responseText);
            }
        })
    })
</script>
</body>
</html>
