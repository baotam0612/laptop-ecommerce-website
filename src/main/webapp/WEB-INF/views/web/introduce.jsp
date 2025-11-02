<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Gioi thieu</title>
</head>
<body>
<section class="gioi-thieu">
    <div class="container">
        <h1>Giới thiệu về Computer Shop</h1>
        <p>
            Computer Shop là cửa hàng chuyên cung cấp các sản phẩm máy tính, linh kiện và thiết bị công nghệ chất lượng cao.
            Với nhiều năm kinh nghiệm trong lĩnh vực công nghệ thông tin, chúng tôi cam kết mang đến cho khách hàng những sản phẩm chính hãng,
            giá cả hợp lý và dịch vụ hậu mãi chu đáo nhất.
        </p>

        <div class="about-content">
            <div class="about-image">
                <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=900&q=80" alt="Computer setup">
            </div>
            <div class="about-text">
                <h2>Tầm nhìn & Sứ mệnh</h2>
                <p>
                    - <strong>Tầm nhìn:</strong> Trở thành thương hiệu hàng đầu trong lĩnh vực phân phối thiết bị công nghệ tại Việt Nam.<br>
                    - <strong>Sứ mệnh:</strong> Mang đến cho người dùng trải nghiệm mua sắm công nghệ tiện lợi, hiện đại và đáng tin cậy.
                </p>

                <h2>Giá trị cốt lõi</h2>
                <ul>
                    <li>Chất lượng – Uy tín – Tận tâm</li>
                    <li>Không ngừng đổi mới, sáng tạo</li>
                    <li>Luôn đặt khách hàng làm trung tâm</li>
                </ul>
            </div>
        </div>
    </div>
</section>

<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #ffffff; /* 💡 nền trắng */
        color: #333333; /* chữ tối dễ đọc */
        margin: 0;
        padding: 0;
    }

    .gioi-thieu {
        padding: 60px 10%;
        background-color: #ffffff;
    }

    .gioi-thieu h1 {
        text-align: center;
        color: #0077cc;
        font-size: 2.5rem;
        margin-bottom: 30px;
    }

    .gioi-thieu p {
        line-height: 1.8;
        font-size: 1.1rem;
        color: #555555;
    }

    .about-content {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 40px;
        margin-top: 50px;
        flex-wrap: wrap;
    }

    .about-image img {
        width: 100%;
        max-width: 450px;
        border-radius: 12px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

    .about-text {
        flex: 1;
    }

    .about-text h2 {
        color: #0077cc;
        margin-bottom: 10px;
    }

    .about-text ul {
        list-style: none;
        padding: 0;
    }

    .about-text ul li::before {
        content: "✔ ";
        color: #0077cc;
    }

    .about-text ul li {
        margin: 8px 0;
    }
</style>

</body>
</html>
