<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/common/taglib.jsp"%>
    <c:url var="productListURL" value="/admin/product-list" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="flex-fill p-3">
            <div class="main-container">
            <form:form modelAttribute="modelSearch" id="listForm" action="${productListURL}" method="GET">
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
                <div class="search" id="btnSearchProduct">
                      <button>Tìm kiếm</button>
                </div>
                </form:form>
            </div>

        </div>
        </div>
        <div class="main-container mt-4">
        <h5>Danh sách sản phẩm</h5>
        <div class="table-responsive">
            <table class="table table-bordered table-striped align-middle">
                <thead class="table-primary">
                    <tr>
                        <th>id</th>
                        <th>Tên sản phẩm</th>
                        <th>Loại</th>
                        <th>Hãng</th>
                        <th>CPU</th>
                        <th>GPU</th>
                        <th>ROM</th>
                        <th>RAM</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${productList.listResult}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.name}</td>
                        <td>${item.category}</td>
                        <td>${item.brand}</td>
                        <td>${item.cpu}</td>
                        <td>${item.gpu}</td>
                        <td>${item.rom}</td>
                        <td>${item.ram}</td>
                        <td>
                            <button class="btn btn-sm btn-warning">Sửa</button>
                            <button class="btn btn-sm btn-danger">Xóa</button>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <script >
    
    $('#btnSearchProduct').click(function() {
    	var data = {};
    	var formData = $('listForm').serializeArray();
    	$.each(formData, function(i,v) {
    		data[""+v.name+""] = v.value;
    	});
    	console.log("ok");
    	
    	$.ajax({
			type: "POST",
			url: "http://localhost:8081/admin/product",
			data: JSON.stringify(data),
			contentType: "application/json",
			dataType: "JSON",
			success: function (respond) {
				console.log("OK");
			},
			error: function (respond) {
				console.log("failed");
			}
		});
    });
    
    
    $('#btnSearchProduct').click(funtion(e) {
    	e.preventDefault();
    	$('#listForm').submit();
    })
                 		
    
    
    
    </script>
        
        

</body>
</html>