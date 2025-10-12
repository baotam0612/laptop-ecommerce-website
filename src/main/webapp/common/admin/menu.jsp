<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
</head>

<body>
    
        <!-- Sidebar Menu -->
        <div class="sidebar d-flex flex-column p-3">
            <h4 class="text-center mb-4">Dashboard</h4>
            <a href="/admin/product-list" class="active">Quản lý sản phẩm</a>
            <a href="/admin/product-oder">Quản lý đơn hàng</a>
        </div>

        <!-- Content -->
        
 

    <script>
        // Chuyển active khi click
        const links = document.querySelectorAll('.sidebar a');
        links.forEach(link => {
            link.addEventListener('click', function () {
                links.forEach(l => l.classList.remove('active'));
                this.classList.add('active');
            });
        });
    </script>
</body>

</html>