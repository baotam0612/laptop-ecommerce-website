<%--
  Created by IntelliJ IDEA.
  User: USPro
  Date: 10/28/2025
  Time: 9:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Khuyen mai</title>
</head>
<body>
<section class="khuyen-mai">
    <div class="container">
        <h1>Khuyến mãi hấp dẫn</h1>
        <div class="promo-list">
            <div class="promo-item">
                <h3>Giảm 15% cho Laptop Asus ROG</h3>
                <p>Áp dụng đến hết 31/12/2025</p>
            </div>
            <div class="promo-item">
                <h3>Tặng chuột Logitech khi mua PC Gaming</h3>
                <p>Chương trình đặc biệt dành riêng cho khách hàng online.</p>
            </div>
            <div class="promo-item">
                <h3>Miễn phí giao hàng toàn quốc</h3>
                <p>Cho tất cả đơn hàng trên 1.000.000đ.</p>
            </div>
        </div>
    </div>
</section>

<style>
    .promo-list {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
    }
    .promo-item {
        background: #e3f2fd;
        border-left: 5px solid #0077cc;
        padding: 20px;
        border-radius: 8px;
        width: 300px;
    }
    .promo-item h3 {
        color: #0077cc;
        margin-top: 0;
    }
</style>

</body>
</html>
