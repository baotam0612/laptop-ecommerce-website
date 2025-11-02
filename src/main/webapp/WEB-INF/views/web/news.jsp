<%--
  Created by IntelliJ IDEA.
  User: USPro
  Date: 10/28/2025
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tin tuc</title>
</head>
<body>

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
    .news-list {
        display: flex;
        flex-wrap: wrap;
        gap: 30px;
        justify-content: center;
    }
    .news-item {
        width: 300px;
        background: #f8f9fa;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        transition: 0.3s;
    }
    .news-item:hover {
        transform: translateY(-5px);
    }
    .news-item img {
        width: 100%;
    }
    .news-item h3 {
        color: #0077cc;
        margin: 10px;
    }
    .news-item p {
        margin: 0 10px 10px;
        color: #555;
    }
    .news-item a {
        display: block;
        text-align: right;
        padding: 10px;
        color: #0077cc;
        text-decoration: none;
    }
</style>

</body>
</html>
