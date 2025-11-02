
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>San pham</title>
</head>
<body>
<section class="san-pham">
    <div class="container">
        <h1>Sản phẩm nổi bật</h1>
        <div class="product-list">

            <c:forEach var = "p" items = "${liProducts}">
                <a href="/product/item-${p.id}">
                <div class="product-item">
                <img src="${p.imagespath}" alt="Laptop gaming">
                <h3>${p.name}</h3>
                <span class="price">${p.price}</span>

            </div>
                </a>
            </c:forEach>
        </div>
    </div>
</section>

<!-- TIN TỨC -->
<section class="tin-tuc">
    <div class="container">
        <h1>Tin tức công nghệ</h1>
        <div class="news-list">
            <div class="news-item">
                <img src="https://images.unsplash.com/photo-1527443154391-507e9dc6c5cc?auto=format&fit=crop&w=500&q=80" alt="Tin tức 1">
                <h3>Top 5 laptop đáng mua nhất 2025</h3>
                <p>Tổng hợp những dòng laptop tốt nhất năm 2025 về hiệu năng, giá cả và độ bền.</p>
                <a href="#">Xem chi tiết</a>
            </div>
            <div class="news-item">
                <img src="https://images.unsplash.com/photo-1518779578993-ec3579fee39f?auto=format&fit=crop&w=500&q=80" alt="Tin tức 2">
                <h3>Card đồ họa RTX 5090 ra mắt</h3>
                <p>Hiệu năng tăng gấp đôi, tiêu thụ điện thấp hơn – NVIDIA lại tạo cú hích lớn.</p>
                <a href="#">Xem chi tiết</a>
            </div>
            <div class="news-item">
                <img src="https://images.unsplash.com/photo-1555617117-08a0b56d7b5b?auto=format&fit=crop&w=500&q=80" alt="Tin tức 3">
                <h3>Xu hướng làm việc hybrid 2025</h3>
                <p>Công nghệ giúp người dùng làm việc linh hoạt hơn với thiết bị di động và cloud.</p>
                <a href="#">Xem chi tiết</a>
            </div>
        </div>
    </div>
</section>

<style>
    .product-list {
        display: flex;
        flex-wrap: wrap;
        gap: 30px;
        justify-content: center;
    }
    .product-item {
        width: 300px;
        border: 1px solid #ddd;
        border-radius: 10px;
        padding: 15px;
        text-align: center;
        transition: 0.3s;
    }
    .product-item:hover {
        box-shadow: 0 0 15px rgba(0, 119, 204, 0.3);
        transform: translateY(-5px);
    }
    .product-item img {
        width: 100%;
        border-radius: 10px;
    }
    .price {
        color: #0077cc;
        font-weight: bold;
    }
</style>



</body>
</html>
