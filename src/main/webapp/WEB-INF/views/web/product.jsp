<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Sản phẩm</title>
</head>
<body>
<section class="san-pham">
    <div class="container">
        <h1>Sản phẩm nổi bật</h1>

        <form:form method="get" modelAttribute="filter" action="/product/filter" class="filter-form">
            <form:input path="keyword" placeholder="Tìm kiếm sản phẩm..." />

            <form:select path="category">
                <form:option value="">Tất cả danh mục</form:option>
                <form:option value="laptop">Laptop</form:option>
                <form:option value="pc">PC</form:option>
                <form:option value="phukien">Phụ kiện</form:option>
            </form:select>

            <form:select path="sort">
                <form:option value="">Sắp xếp</form:option>
                <form:option value="priceDesc">Giá giảm dần</form:option>
                <form:option value="priceAsc">Giá tăng dần</form:option>
            </form:select>

            <button type="submit">Lọc</button>
        </form:form>

        <div class="product-list">
            <c:forEach var="p" items="${liProducts}">
                <a href="/product/item-${p.id}">
                    <div class="product-item">
                        <img src="${p.imagespath}" alt="${p.name}">
                        <h3>${p.name}</h3>
                        <span class="price">${p.price}</span>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</section>



<style>
    .filter-form {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 15px;
        margin-bottom: 30px;
    }

    .filter-form input,
    .filter-form select {
        padding: 10px 15px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    .filter-form button {
        padding: 10px 20px;
        background-color: #0077cc;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
    }

    .filter-form button:hover {
        background-color: #005fa3;
    }

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
