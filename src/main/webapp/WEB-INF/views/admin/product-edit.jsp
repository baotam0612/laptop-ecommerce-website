<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
    .deleteProduct button{
    margin-top: 20px;
    padding: 10px 26px;
    background-color: var(--color-one);
    border-radius: 8px;
    }
</style>
<div class="flex-fill p-3">
            <div class="main-container">
            <form:form modelAttribute="modelEdit" id="editForm"  method="GET">
                <div class="form-group">
                    <label>Tên sản phẩm</label>
                    <form:input class="form-control" path="name"/>
                </div>
                <div class="form-group">
                    <label>Loại</label>
                    <form:input class="form-control" path="category"/>
                </div>
                <div class="form-group">
                    <label>Hãng</label>
                    <form:input class="form-control" path="brand"/>
                </div>
                <div class="form-group">
                    <label>cpu</label>
                    <form:input class="form-control" path="cpu"/>
                </div>
                <div class="form-group">
                    <label>gpu</label>
                    <form:input class="form-control" path="gpu"/>
                </div>
                <div class="form-group">
                    <label>bộ nhớ trong(rom)</label>
                    <form:input class="form-control" path="rom"/>
                </div>
                <div class="form-group">
                    <label>bộ nhớ tạm(ram)</label>
                    <form:input class="form-control" path="ram"/>
                </div>
                <div class="form-group">
                <label>Ảnh sản phẩm</label>
                <input type="file" id="imageFile" name="imageFile" accept="image/*" />
                <img id="previewImage" src="#" alt="Preview" style="max-width: 200px; display:none; margin-top:10px;" />
                </div>
                <c:if test="${not empty modelEdit.id}">
                 <div class="form-button">
                    <div class="addProduct" id="btnAddOrUpdateProduct">
                        <button>Sửa sản phẩm</button>
                    </div>


                </div>
</c:if>
                 <c:if test="${ empty modelEdit.id}">
                 <div class="form-button">
                    <div class="addProduct" id="btnAddOrUpdateProduct">
                        <button>Thêm sản phẩm</button>
                    </div>

                    </div>

                </div>
</c:if>
                 <form:hidden path="id"/>

                </form:form>
            </div>



<script >
    $('#btnAddOrUpdateProduct').click(function () {
        event.preventDefault();
        const file = $('#imageFile')[0].files[0];
        if (file) {
            // upload len cloud
            const formData = new FormData();
            formData.append("imageFile", file);

            $.ajax({
                url: "/api/product/upload-image",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function (res) {
                    if (res.status === "success") {
                        sendProductData(res.imageUrl);
                    }
                },
                error: function (err) {
                    console.log("Upload lỗi", err);
                }
            });
        } else {
            sendProductData(null);
        }
    });

    function sendProductData(imageUrl) {
        const product = {
            id: $('input[name="id"]').val(),
            name: $('input[name="name"]').val(),
            category: $('input[name="category"]').val(),
            brand: $('input[name="brand"]').val(),
            cpu: $('input[name="cpu"]').val(),
            gpu: $('input[name="gpu"]').val(),
            rom: $('input[name="rom"]').val(),
            ram: $('input[name="ram"]').val(),
            price: $('input[name="price"]').val(),
            imagespath: imageUrl
        };

        $.ajax({
            url: "/api/product",
            type: "POST",
            data: JSON.stringify(product),
            contentType: "application/json",
            success: function (res) {
                console.log("Lưu thành công:", res);
                window.alert("Thanh Cong");
            },
            error: function (err) {
                console.log("Lưu thất bại:", err);
            }
        });
    }


</script>
</body>
</html>