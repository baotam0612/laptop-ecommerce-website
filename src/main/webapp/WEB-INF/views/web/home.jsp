<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!-- 1. Hero Section -->
<div class="container">
    <div class="hero-banner">
        <img src="https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=1600&q=80" alt="Tech Banner">
        <div class="hero-overlay">
            <h1>Công Nghệ Đỉnh Cao Cho Cuộc Sống Hiện Đại</h1>
            <p>Khám phá bộ sưu tập máy tính, laptop và linh kiện chính hãng hiệu năng vượt trội với giá ưu đãi tốt nhất.</p>
            <div>
                <a href="/product" class="btn-primary-custom">
                    <i class="fa-solid fa-bag-shopping"></i> Mua sắm ngay
                </a>
            </div>
        </div>
    </div>
</div>

<!-- 2. Featured Products Grid -->
<section class="section3">
    <div class="container">
        <h2 class="section-title">Sản Phẩm Nổi Bật</h2>
        <div class="product-grid">
            <c:forEach var="p" items="${products}">
                <a href="/product/item-${p.id}" class="product-card">
                    <div class="card-img">
                        <img src="${p.imagespath}" alt="${p.name}" onerror="this.src='https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?auto=format&fit=crop&w=500&q=80'">
                    </div>
                    <div class="card-body">
                        <div class="card-title">${p.name}</div>
                        <div class="card-footer">
                            <div class="card-price"><fmt:formatNumber value="${p.price}" pattern="#,###"/> VND</div>
                            <span class="card-btn">Chi tiết <i class="fa-solid fa-arrow-right ms-1"></i></span>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</section>

<!-- 3. About Us Showcase Banner -->
<section class="section2">
    <div class="container">
        <div class="inner-wrap">
            <div class="inner-infor">
                <h2 class="inner-title">Về Chúng Tôi - ComputerShop</h2>
                <p class="inner-des">Tại ComputerShop, chúng tôi không chỉ cung cấp máy tính và phụ kiện, chúng tôi mang đến giải pháp công nghệ toàn diện giúp bạn nâng cao hiệu suất công việc, đam mê giải trí đỉnh cao và trải nghiệm số không giới hạn.</p>
                <a href="/gioi-thieu" class="btn-primary-custom" style="background: #fff; color: var(--text-main);">
                    Tìm hiểu thêm <i class="fa-solid fa-circle-arrow-right"></i>
                </a>
            </div>
            <div class="inner-img">
                <img src="https://png.pngtree.com/png-clipart/20240627/original/pngtree-beautiful-girl-holding-laptop-and-smiling-png-image_15424328.png" alt="About Us" onerror="this.src='https://images.unsplash.com/photo-1531482615713-2afd69097998?auto=format&fit=crop&w=600&q=80'">
            </div>
        </div>
    </div>
</section>

<!-- 4. Brands Partners -->
<section class="section4">
    <div class="container">
        <h2 class="section-title" style="font-size: 1.5rem; margin-bottom: 1.5rem;">Đối Tác Thương Hiệu Hàng Đầu</h2>
        <div class="brand-showcase">
            <div class="brand-item">
                <img src="https://images.seeklogo.com/logo-png/42/1/apple-logo-png_seeklogo-427436.png" alt="Apple">
            </div>
            <div class="brand-item">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/HP_logo_2012.svg/1200px-HP_logo_2012.svg.png" alt="HP">
            </div>
            <div class="brand-item">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/ASUS_Logo.svg/2560px-ASUS_Logo.svg.png" alt="ASUS">
            </div>
            <div class="brand-item">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Dell_Logo.svg/2048px-Dell_Logo.svg.png" alt="Dell">
            </div>
            <div class="brand-item">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Lenovo_logo_2015.svg/2560px-Lenovo_logo_2015.svg.png" alt="Lenovo">
            </div>
        </div>
    </div>
</section>

<!-- 5. Service Commitments -->
<section class="section5">
    <div class="container">
        <div class="benefits-grid">
            <div class="benefit-card">
                <div class="benefit-icon"><i class="fa-solid fa-truck-fast"></i></div>
                <div class="benefit-title">Giao Hàng Nhanh Chóng</div>
                <div class="benefit-des">Miễn phí giao hàng & lắp đặt tận nơi cho đơn hàng từ 1 triệu đồng.</div>
            </div>
            <div class="benefit-card">
                <div class="benefit-icon"><i class="fa-solid fa-arrow-rotate-left"></i></div>
                <div class="benefit-title">Đổi Trả 1 - 1 Dễ Dàng</div>
                <div class="benefit-des">Hỗ trợ đổi trả miễn phí trong vòng 30 ngày nếu phát sinh lỗi phần cứng.</div>
            </div>
            <div class="benefit-card">
                <div class="benefit-icon"><i class="fa-solid fa-shield-halved"></i></div>
                <div class="benefit-title">Bảo Hành Chính Hãng</div>
                <div class="benefit-des">Cam kết 100% sản phẩm có bảo hành chính hãng từ 12 đến 36 tháng.</div>
            </div>
            <div class="benefit-card">
                <div class="benefit-icon"><i class="fa-solid fa-headset"></i></div>
                <div class="benefit-title">Hỗ Trợ 24/7</div>
                <div class="benefit-des">Đội ngũ kỹ thuật viên giàu kinh nghiệm luôn sẵn sàng tư vấn chu đáo.</div>
            </div>
        </div>
    </div>
</section>