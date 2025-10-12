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
                 <div class="form-button">
                    <div class="addProduct" id="btnAddOrUpdateProduct">
                        <button>Thêm sản phẩm</button>
                    </div>
                    <div class="deleteProduct" id="btnDeleteProduct">
                        <button>Xóa sản phẩm</button>
                    </div>
                </div>
                </form:form>
            </div>

        </div>
        </div>
        
        <script >
              $('#btnAddOrUpdateProduct').click(function(){
            	  var data = {};
            	  var formData = $('#editForm').serializeArray();
            	  $.each(formData, function(i,v) {
              		data[""+v.name+""] = v.value;
              	   });
            	  
            	  
            	  $.ajax({
            		  type:"POST",
            		  url: "/api/product",
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
        
        </script>
</body>
</html>