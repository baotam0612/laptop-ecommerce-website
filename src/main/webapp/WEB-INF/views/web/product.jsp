<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<section class="san-pham">
    <div class="container">
        <h1 class="section-title">Danh Sách Sản Phẩm</h1>

        <!-- Filter Bar -->
        <div class="filter-bar">
            <form:form method="get" modelAttribute="filter" action="/product/filter" class="filter-form">
                <div style="flex: 2; min-width: 240px; position: relative;">
                    <form:input path="keyword" placeholder="Nhập tên sản phẩm cần tìm..." style="width: 100%;" />
                </div>

                <div style="flex: 1; min-width: 160px;">
                    <form:select path="category">
                        <form:option value="">Tất cả danh mục</form:option>
                        <form:option value="laptop">Laptop</form:option>
                        <form:option value="pc">PC / Máy bàn</form:option>
                        <form:option value="phukien">Phụ kiện công nghệ</form:option>
                    </form:select>
                </div>

                <div style="flex: 1; min-width: 160px;">
                    <form:select path="sort">
                        <form:option value="">Sắp xếp giá</form:option>
                        <form:option value="priceDesc">Giá: Cao đến thấp</form:option>
                        <form:option value="priceAsc">Giá: Thấp đến cao</form:option>
                    </form:select>
                </div>

                <button type="submit">
                    <i class="fa-solid fa-filter me-1"></i> Lọc sản phẩm
                </button>
            </form:form>
        </div>

        <!-- Product Grid -->
        <div class="product-grid">
            <c:forEach var="p" items="${liProducts}">
                <a href="/product/item-${p.id}" class="product-card">
                    <div class="card-img">
                        <img src="${p.imagespath}" alt="${p.name}" onerror="this.src='https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?auto=format&fit=crop&w=500&q=80'">
                    </div>
                    <div class="card-body">
                        <div class="card-title">${p.name}</div>
                        <div class="card-footer">
                            <div class="card-price"><fmt:formatNumber value="${p.price}" pattern="#,###"/> VND</div>
                            <span class="card-btn">Xem chi tiết <i class="fa-solid fa-arrow-right ms-1"></i></span>
                        </div>
                    </div>
                </a>
            </c:forEach>

            <c:if test="${empty liProducts}">
                <div style="grid-column: 1 / -1; text-align: center; padding: 3rem 0; color: var(--text-muted);">
                    <i class="fa-solid fa-box-open" style="font-size: 3rem; margin-bottom: 1rem; color: #cbd5e1;"></i>
                    <h3>Không tìm thấy sản phẩm phù hợp</h3>
                    <p>Vui lòng thử tìm kiếm với từ khóa khác hoặc điều chỉnh bộ lọc.</p>
                </div>
            </c:if>
        </div>
    </div>
</section>
