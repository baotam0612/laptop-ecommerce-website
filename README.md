# OOPN5 — Website bán máy tính và phụ kiện

OOPN5 là ứng dụng web Java phục vụ giới thiệu, tìm kiếm và đặt mua sản phẩm công nghệ, đồng thời cung cấp trang quản trị sản phẩm, đơn hàng và tài khoản. Dự án sử dụng Spring Boot, Spring MVC, Spring Security, JPA/Hibernate và giao diện JSP được ghép bố cục bằng SiteMesh.

README mô tả mã nguồn và cấu hình hiện có. Phần thiết lập database có bước bổ sung bảng `roles` vì SQL hiện tại chưa đầy đủ so với entity Java.

# Mục lục

- [1. Chức năng](#1-chức-năng)
- [2. Công nghệ](#2-công-nghệ)
- [3. Kiến trúc và cấu trúc thư mục](#3-kiến-trúc-và-cấu-trúc-thư-mục)
- [4. Cơ sở dữ liệu](#4-cơ-sở-dữ-liệu)
- [5. Cài đặt và chạy local](#5-cài-đặt-và-chạy-local)
- [6. Email và Cloudinary](#6-email-và-cloudinary)
- [7. Các đường dẫn chính](#7-các-đường-dẫn-chính)
- [8. API và định dạng dữ liệu](#8-api-và-định-dạng-dữ-liệu)
- [9. Luồng sử dụng và kiểm tra thủ công](#9-luồng-sử-dụng-và-kiểm-tra-thủ-công)
- [10. Đóng gói và triển khai](#10-đóng-gói-và-triển-khai)
- [11. Lỗi thường gặp và giới hạn hiện tại](#11-lỗi-thường-gặp-và-giới-hạn-hiện-tại)

# 1. Chức năng

# Khách truy cập và khách hàng

- Xem trang chủ, giới thiệu, tin tức và khuyến mãi.
- Xem danh sách và chi tiết sản phẩm: thương hiệu, CPU, GPU, RAM, bộ nhớ, giá và ảnh.
- Tìm sản phẩm theo tên, lọc danh mục, sắp xếp giá tăng hoặc giảm.
- Đăng ký tài khoản kèm họ tên, email, số điện thoại và địa chỉ khách hàng.
- Đăng nhập, đăng xuất; mật khẩu được mã hóa BCrypt.
- Khôi phục mật khẩu qua email, dùng token có thời hạn 15 phút.
- Thêm/xóa sản phẩm trong giỏ, xem tổng số lượng và tổng tiền.
- Đặt hàng bằng tài khoản có hồ sơ khách hàng; xóa giỏ sau khi lưu đơn thành công.

Giỏ hàng lưu trong `HttpSession`, không có bảng giỏ hàng riêng. Giao diện hướng dẫn người chưa đăng nhập đăng nhập trước khi đặt hàng. Chức năng đặt hàng hiện tạo đơn trong database; chưa tích hợp cổng thanh toán trực tuyến.

# Quản trị viên

- Xem trang quản trị tại `/admin/home`.
- Tìm sản phẩm theo tên, danh mục, thương hiệu, CPU, GPU, RAM và ROM.
- Thêm, sửa, xóa sản phẩm; tải ảnh lên Cloudinary.
- Xem đơn hàng, duyệt và hủy đơn.
- Xem tài khoản, cập nhật vai trò và xóa tài khoản.

Trang tin tức và khuyến mãi được dựng bằng JSP; chưa có module quản trị bài viết riêng.

# 2. Công nghệ

Các phiên bản lấy từ [pom.xml](pom.xml) và decorator JSP.

| Thành phần                  | Phiên bản/cách sử dụng                              |
| --------------------------- | --------------------------------------------------- |
| Java                        | `java.version=1.8` trong Maven                      |
| Spring Boot                 | `2.0.9.RELEASE`                                     |
| Spring MVC                  | Controller trả JSP và endpoint JSON                 |
| Spring Security             | Xác thực theo session, BCrypt, quyền `ADMIN`/`USER` |
| Spring Data JPA / Hibernate | Repository, entity, SQL tùy chỉnh                   |
| MySQL Connector/J           | `8.0.13`                                            |
| JSP / JSTL                  | Giao diện phía server, JSTL `1.2`                   |
| SiteMesh                    | `2.4.2`, ghép bố cục JSP                            |
| ModelMapper                 | `0.7.4`, ánh xạ entity và DTO                       |
| Cloudinary Java SDK         | `1.33.0`, upload ảnh vào thư mục `products`         |
| Spring Mail                 | Gửi email khôi phục qua SMTP                        |
| Bootstrap                   | `5.3.3` trong decorator quản trị/xác thực           |
| jQuery                      | `3.6.0`, gửi yêu cầu AJAX                           |
| Font Awesome                | `6.5.1`, biểu tượng giao diện                       |
| Maven                       | Quản lý thư viện, chạy và đóng gói                  |
| Đóng gói                    | WAR; artifact `spring-boot`, version `1.0`          |

CSS/JS riêng nằm trong `src/main/resources/static/web/assets`. Font, biểu tượng và một số thư viện tải từ CDN, cần mạng để hiển thị đầy đủ.

# 3. Kiến trúc và cấu trúc thư mục

```text
Trình duyệt (JSP, form, AJAX)
    → Spring Security (xác thực và kiểm tra quyền)
    → Controller / API
    → Service (nghiệp vụ)
    → Repository (Spring Data JPA hoặc EntityManager)
    → MySQL

Controller → Model / ModelAndView → JSP + SiteMesh → HTML
ProductAPI → Cloudinary
UserService → SMTP
```

```text
OOPN5/
├── pom.xml                         # Cấu hình Maven và thư viện
├── computer.sql                    # Tạo lại các bảng và nạp dữ liệu
├── Dockerfile                      # Chạy WAR bằng Java 17, tùy chọn
├── README.md
├── docs/                           # Tài liệu và ảnh minh họa, tùy chọn
├── src/
│   ├── main/
│   │   ├── java/com/javaweb/
│   │   │   ├── SpringBootWebApplication.java
│   │   │   ├── api/                # API sản phẩm và upload ảnh
│   │   │   ├── builder/            # Builder điều kiện tìm sản phẩm
│   │   │   ├── config/             # Security, Cloudinary, ModelMapper, auditing
│   │   │   ├── constant/           # Vai trò và hằng số
│   │   │   ├── controller/
│   │   │   │   ├── admin/          # Quản trị và controller đặt hàng
│   │   │   │   └── web/            # Trang khách hàng, giỏ, xác thực
│   │   │   ├── converter/          # Chuyển đổi entity/DTO/builder
│   │   │   ├── entity/             # Ánh xạ bảng MySQL
│   │   │   ├── model/              # DTO, request và response
│   │   │   ├── repository/         # Repository và truy vấn tùy chỉnh
│   │   │   ├── security/           # Điều hướng sau đăng nhập, tiện ích quyền
│   │   │   ├── service/            # Interface và triển khai nghiệp vụ
│   │   │   └── utils/
│   │   ├── resources/
│   │   │   ├── application.properties
│   │   │   ├── display.properties
│   │   │   └── static/web/assets/  # CSS, JS và ảnh tĩnh
│   │   └── webapp/
│   │       ├── index.jsp           # Chuyển đến /trang-chu
│   │       ├── common/             # Header, footer, menu, taglib
│   │       ├── decorators/         # Bố cục SiteMesh
│   │       └── WEB-INF/
│   │           ├── web.xml
│   │           ├── decorators.xml
│   │           └── views/         # JSP khách hàng, quản trị, xác thực
│   └── test/java/application.properties
└── target/                         # Kết quả build
```

`OrderController` nằm trong package `controller.admin` nhưng endpoint là `/order/checkout`. Quyền truy cập phụ thuộc URL và Security, không phụ thuộc tên package.

`docs` chỉ chứa tài liệu/ảnh minh họa, không được ứng dụng dùng khi build hoặc chạy. `docs`, `Dockerfile` và `target` đang nằm trong `.gitignore`; bản clone khác có thể không có các file tùy chọn này.

# 4. Cơ sở dữ liệu

# Bảng và quan hệ

Database trong SQL và cấu hình chạy chính hiện có tên **`computer_ver3`**.

| Bảng                   | Vai trò                                                 | Quan hệ chính                                   |
| ---------------------- | ------------------------------------------------------- | ----------------------------------------------- |
| `users`                | Tài khoản, mật khẩu BCrypt, email, trạng thái hoạt động | Liên kết `customer`, `userroles`, token         |
| `roles`                | Vai trò                                                 | Nhiều tài khoản qua `userroles`                 |
| `userroles`            | Trung gian tài khoản–vai trò                            | `user_id` → `users`, `role_id` → `roles`        |
| `customer`             | Hồ sơ và thông tin liên hệ khách hàng                   | `user_id` → `users`                             |
| `product`              | Thông tin, cấu hình, giá và ảnh sản phẩm                | Được tham chiếu bởi `orderdetail`               |
| `orders`               | Ngày đặt, khách hàng, tổng tiền, trạng thái             | `customer_id` → `customer`                      |
| `orderdetail`          | Sản phẩm, số lượng, đơn giá của từng dòng đơn           | `order_id` → `orders`, `product_id` → `product` |
| `password_reset_token` | Token và thời điểm hết hạn                              | `user_id` → `users`                             |

Trong Java, tài khoản–khách hàng được ánh xạ một–một. Một khách hàng có nhiều đơn; mỗi đơn có nhiều dòng chi tiết; một sản phẩm có thể xuất hiện trong nhiều đơn. Đơn giá được lưu lại tại thời điểm đặt hàng.

`BaseEntity` dùng chung `id`, `createddate`, `modifieddate`, `createdby`, `modifiedby`. `JpaAuditingConfig` hỗ trợ ghi thông tin tạo/cập nhật cho entity kế thừa lớp này.

# Dữ liệu trong SQL hiện tại

| Bảng                   | Số bản ghi trong script |
| ---------------------- | ----------------------: |
| `users`                |                       4 |
| `roles`                |                       2 |
| `userroles`            |                       2 |
| `customer`             |                       3 |
| `product`              |                       6 |
| `orders`               |                      13 |
| `orderdetail`          |                      13 |
| `password_reset_token` |                       6 |

SQL chỉ giữ sản phẩm ID `1`–`5` và `16`; dữ liệu nguồn của các sản phẩm còn lại bị thiếu. Sản phẩm `16` chưa có giá hợp lệ và ảnh chỉ là tên file, cần hoàn thiện trước khi thử giỏ hàng.

Các tài khoản có sẵn: `nguyenvana`, `admin`, `nphuonglinh`, `Elder06`. Script chỉ gán vai trò cho `nguyenvana` và `admin`; chỉ `nguyenvana` có hồ sơ khách hàng liên kết. Mật khẩu là chuỗi BCrypt; không có thông tin xác nhận mật khẩu gốc trong script. Không có mật khẩu demo chung được xác nhận cho các tài khoản này.

# 5. Cài đặt và chạy local

# Bước 1 — Chuẩn bị môi trường

- JDK phù hợp với cấu hình Java 8 trong `pom.xml`.
- Maven có thể gọi bằng `mvn`; repository chưa có Maven Wrapper (`mvnw`).
- MySQL và MySQL Workbench hoặc MySQL CLI.
- IDE Java nếu muốn chạy/debug bằng IntelliJ IDEA, Eclipse hoặc công cụ tương tự.

Kiểm tra:

```powershell
java -version
javac -version
mvn -version
```

Đảm bảo Maven và IDE dùng cùng JDK. Dockerfile dùng JDK 17 trong khi Maven khai báo Java 8; cần kiểm tra tương thích khi chuyển môi trường.

Mở terminal tại thư mục có `pom.xml`, ví dụ:

```powershell
Set-Location D:\PROJJAVA\OOPN5
```

# Bước 2 — Import SQL

**Lưu ý về dữ liệu:** [computer.sql](computer.sql) có `DROP TABLE IF EXISTS`, sau đó tạo lại 8 bảng và nạp dữ liệu. Chạy script sẽ xóa dữ liệu hiện có của các bảng này. Dùng database riêng hoặc sao lưu trước khi import. Nếu dùng database khác, sửa cả `CREATE DATABASE`, `USE` trong SQL và JDBC URL.

Với MySQL Workbench: mở `computer.sql`, kết nối MySQL và thực thi toàn bộ script.

Với CLI, mở terminal:

```powershell
mysql -u root -p --default-character-set=utf8mb4
```

Nếu `mysql` chưa có trong `PATH`, dùng đường dẫn thực tế, ví dụ:

```powershell
& 'C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe' -u root -p --default-character-set=utf8mb4
```

Sau đó nhập trong MySQL CLI, thay đường dẫn nếu cần:

```sql
SOURCE D:/PROJJAVA/OOPN5/computer.sql;
```

# Bước 3 — Bổ sung bảng `roles` cho mã nguồn hiện tại

`RoleEntity` dùng `code` và kế thừa các cột auditing, nhưng SQL chỉ tạo `roles.id`, `roles.name`. Chạy đoạn dưới **một lần sau khi import nguyên bản SQL**, trước khi đăng nhập/đăng ký:

```sql
USE computer_ver3;

ALTER TABLE roles
  ADD COLUMN code VARCHAR(50) NULL,
  ADD COLUMN createddate DATETIME NULL,
  ADD COLUMN modifieddate DATETIME NULL,
  ADD COLUMN createdby VARCHAR(45) NULL,
  ADD COLUMN modifiedby VARCHAR(45) NULL;

UPDATE roles SET code = 'ADMIN' WHERE id = 1;
UPDATE roles SET code = 'USER'  WHERE id = 2;

ALTER TABLE roles
  MODIFY COLUMN code VARCHAR(50) NOT NULL,
  ADD UNIQUE KEY uk_roles_code (code);

SELECT id, name, code FROM roles;
```

Kết quả mong đợi:

|  id | name         | code    |
| --: | ------------ | ------- |
|   1 | `ROLE_ADMIN` | `ADMIN` |
|   2 | `ROLE_USER`  | `USER`  |

`code` phải là `ADMIN`/`USER`: `CustomUserDetailsService` tự thêm tiền tố `ROLE_`. Lưu `ROLE_ADMIN` trong `code` sẽ tạo quyền `ROLE_ROLE_ADMIN`, không khớp Security. Đăng ký tìm vai trò bằng `findOneByCode("USER")`.

Nếu database đã có các cột này, kiểm tra `SHOW COLUMNS FROM roles;` và chỉ bổ sung phần thiếu. Import lại SQL sẽ xóa bảng đã bổ sung, cần làm lại bước này.

# Bước 4 — Cấu hình kết nối

Sửa [application.properties](src/main/resources/application.properties) theo MySQL trên máy. Ví dụ dùng giá trị thay thế:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/computer_ver3
spring.datasource.username=YOUR_MYSQL_USER
spring.datasource.password=YOUR_MYSQL_PASSWORD

spring.jpa.hibernate.ddl-auto=none
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL5Dialect
spring.jpa.properties.hibernate.enable_lazy_load_no_trans=true
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true

spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
```

Giữ `ddl-auto=none` khi dùng schema đã import và bổ sung. Không dùng `create`/`create-drop` cho database có dữ liệu cần giữ. ID Java dùng `Long`, SQL có cả `INT`/`BIGINT`; khi đổi kiểu ID phải đồng bộ các khóa ngoại.

`src/test/java/application.properties` trỏ database khác (`estatebasic`), không phải cấu hình chạy chính. Hiện chưa có lớp test tự động trong `src/test`.

Có thể ghi đè kết nối bằng biến môi trường trong terminal chạy ứng dụng:

```powershell
$env:SPRING_DATASOURCE_URL = 'jdbc:mysql://localhost:3306/computer_ver3'
$env:SPRING_DATASOURCE_USERNAME = 'YOUR_MYSQL_USER'
$env:SPRING_DATASOURCE_PASSWORD = 'YOUR_MYSQL_PASSWORD'
```

# Bước 5 — Khởi động

```powershell
mvn spring-boot:run
```

Hoặc import dự án Maven vào IDE, đợi tải thư viện rồi chạy `main` trong `com.javaweb.SpringBootWebApplication`.

Khi ứng dụng khởi động thành công, mở:

```text
http://localhost:8080/trang-chu
http://localhost:8080/login
```

Chưa có `server.port` trong cấu hình; có thể thêm `server.port=8081` để đổi cổng. Liên kết email khôi phục đang cố định cổng `8080`, cần sửa riêng khi đổi cổng.

# Bước 6 — Tạo tài khoản thử

1. Mở `/sign-in`, đăng ký bằng username, email và số điện thoại chưa dùng.
2. Đăng nhập bằng mật khẩu vừa tạo; tài khoản mới có vai trò `USER` và hồ sơ `customer`.
3. Dùng tài khoản này thử giỏ hàng và đặt hàng.

Nếu chưa biết mật khẩu admin có sẵn, đăng ký tài khoản riêng, ví dụ `demo_admin`, rồi chuyển sang vai trò quản trị trong database local:

```sql
USE computer_ver3;

DELETE ur FROM userroles ur
JOIN users u ON u.id = ur.user_id
WHERE u.username = 'demo_admin';

INSERT INTO userroles (user_id, role_id)
SELECT u.id, r.id
FROM users u
CROSS JOIN roles r
WHERE u.username = 'demo_admin' AND r.code = 'ADMIN';
```

Thay username bằng tài khoản đã đăng ký. Đăng xuất và đăng nhập lại để nạp quyền mới. Tài khoản chỉ có `ADMIN` được chuyển đến `/admin/home`; `USER` được chuyển đến `/trang-chu`.

# 6. Email và Cloudinary

# Email khôi phục mật khẩu

Cấu hình trong `application.properties`:

```properties
spring.mail.host=smtp.gmail.com
spring.mail.port=587
spring.mail.username=YOUR_SENDER_EMAIL
spring.mail.password=YOUR_SMTP_APP_PASSWORD
spring.mail.properties.mail.smtp.auth=true
spring.mail.properties.mail.smtp.starttls.enable=true
```

Điền thông tin SMTP hợp lệ của tài khoản gửi. Có thể ghi đè bằng biến môi trường `SPRING_MAIL_USERNAME`, `SPRING_MAIL_PASSWORD`.

`UserService.sendPasswordResetLink()` tạo UUID, lưu token có hạn 15 phút và gửi email. `AuthController` kiểm tra token, mã hóa mật khẩu mới và xóa token sau khi đổi thành công. Liên kết được tạo trực tiếp trong `UserService.java`:

```text
http://localhost:8080/reset-password?token=...
```

Khi dùng domain, cổng hoặc context path khác, sửa địa chỉ này cho đúng. Token trong SQL là dữ liệu cũ, không dùng làm liên kết còn hiệu lực.

# Cloudinary

[CloudinaryConfig.java](src/main/java/com/javaweb/config/CloudinaryConfig.java) khởi tạo SDK bằng `cloud_name`, `api_key`, `api_secret` đặt trực tiếp trong Java. Để dùng tài khoản của mình, cập nhật ba giá trị này; mã hiện chưa tự đọc chúng từ biến môi trường.

Upload nhận multipart trường `imageFile`, lưu ảnh vào thư mục `products`, trả `secure_url`. Form quản trị dùng URL đó làm `imagespath` của sản phẩm. Các ảnh đã có đường dẫn hợp lệ trong database vẫn có thể hiển thị mà không cần upload lại.

Các file cấu hình hiện chứa thông tin truy cập dịch vụ đặt trực tiếp trong nguồn. Khi chia sẻ repository, thay bằng cấu hình riêng của môi trường và không sao chép các giá trị đó vào tài liệu công khai.

# 7. Các đường dẫn chính

Đường dẫn tính từ gốc ứng dụng, mặc định `http://localhost:8080`.

# Khách hàng và xác thực

| Phương thức | Đường dẫn                  | Chức năng                                |
| ----------- | -------------------------- | ---------------------------------------- |
| GET         | `/trang-chu`               | Trang chủ và sản phẩm                    |
| GET         | `/gioi-thieu`              | Giới thiệu                               |
| GET         | `/product`                 | Danh sách sản phẩm                       |
| GET         | `/product/filter`          | Lọc với `keyword`, `category`, `sort`    |
| GET         | `/product/item-{id}`       | Chi tiết sản phẩm                        |
| GET         | `/tin-tuc`                 | Tin tức                                  |
| GET         | `/khuyen-mai`              | Khuyến mãi                               |
| GET         | `/login`                   | Form đăng nhập                           |
| POST        | `/j_spring_security_check` | Đăng nhập với `j_username`, `j_password` |
| GET/POST    | `/sign-in`                 | Form và xử lý đăng ký                    |
| GET         | `/logout`                  | Đăng xuất                                |
| GET/POST    | `/forgot-password`         | Form và gửi email khôi phục              |
| GET/POST    | `/reset-password`          | Kiểm tra token, đặt mật khẩu mới         |
| GET         | `/cart`                    | Xem giỏ session                          |
| POST        | `/cart/add`                | Thêm sản phẩm vào giỏ                    |
| POST        | `/cart/remove`             | Xóa sản phẩm khỏi giỏ                    |
| POST        | `/order/checkout`          | Tạo đơn từ giỏ và tài khoản hiện tại     |

Ví dụ: `/product/filter?keyword=Lenovo&category=laptop&sort=priceAsc`. Danh mục gồm `laptop`, `pc`, `phukien`; sắp xếp dùng `priceAsc` hoặc `priceDesc`.

# Quản trị

| Phương thức | Đường dẫn                   | Chức năng                               |
| ----------- | --------------------------- | --------------------------------------- |
| GET         | `/admin/home`               | Trang chủ quản trị                      |
| GET         | `/admin/product-list`       | Danh sách và tìm sản phẩm               |
| GET         | `/admin/product-edit`       | Form thêm sản phẩm                      |
| GET         | `/admin/product-edit-{id}`  | Form sửa sản phẩm                       |
| GET         | `/admin/orders`             | Danh sách đơn                           |
| GET         | `/admin/order/approve/{id}` | Chuyển thành `APPROVED`                 |
| GET         | `/admin/order/cancel/{id}`  | Chuyển thành `CANCELED`                 |
| GET         | `/admin/users`              | Danh sách tài khoản                     |
| GET         | `/admin/users/edit/{id}`    | Form chỉnh vai trò                      |
| POST        | `/admin/users/update`       | Lưu vai trò với `id`, danh sách `roles` |
| GET         | `/admin/users/delete/{id}`  | Xóa tài khoản                           |

`SecurityConfig` yêu cầu `ROLE_ADMIN` cho `/admin/**`. Hiện `/api/**` được truy cập công khai, bao gồm API ghi dữ liệu sản phẩm, và CSRF bị tắt. Nút đặt hàng yêu cầu đăng nhập trên giao diện, nhưng `/order/checkout` chưa có quy tắc riêng bắt buộc xác thực trong cấu hình. Cần bổ sung bảo vệ endpoint ghi dữ liệu khi triển khai cho người dùng thực tế.

# 8. API và định dạng dữ liệu

ID trong ví dụ cần thay bằng ID thực tế. Giỏ hàng/checkout cần giữ cookie session của trình duyệt.

# Tạo hoặc cập nhật sản phẩm

`POST /api/product`, `Content-Type: application/json`:

```json
{
  "name": "Laptop demo",
  "category": "laptop",
  "brand": "LENOVO",
  "cpu": "Intel Core i5",
  "gpu": "RTX 3050",
  "ram": "16GB",
  "rom": "512GB SSD",
  "price": "15990000",
  "imagespath": "https://example.com/laptop.jpg"
}
```

Thêm trường `id` để cập nhật sản phẩm. Response là `ProductDTO`; service hiện chưa gán ID sinh từ entity vào DTO khi tạo mới, nên cần kiểm tra lại danh sách thay vì chỉ dựa vào `id` trong response.

# Upload ảnh

`POST /api/product/upload-image`, `multipart/form-data`, trường `imageFile`.

Response thành công:

```json
{
  "status": "success",
  "imageUrl": "https://res.cloudinary.com/.../products/..."
}
```

Thất bại trả HTTP `500`, `status: "error"` và `message`.

# Xóa sản phẩm

`POST /api/product/remove`, JSON:

```json
{ "productId": 1 }
```

Response thành công hiện là `{}`. Sản phẩm đã được tham chiếu trong chi tiết đơn có thể bị khóa ngoại từ chối xóa.

# Thêm vào giỏ

`POST /cart/add`, JSON:

```json
{ "productId": 1, "quantity": 2 }
```

Response ví dụ:

```json
{ "status": "success", "cartCount": 2 }
```

Thêm lại cùng sản phẩm sẽ cộng số lượng. `cartCount` là tổng số lượng, không phải số loại sản phẩm.

# Xóa khỏi giỏ

`POST /cart/remove`, JSON:

```json
{ "productId": 1 }
```

Response gồm `status`, `cartCount`, `total`; `total` là chuỗi với hai chữ số thập phân, ví dụ `"0.00"`. Thao tác xóa toàn bộ dòng sản phẩm.

# Đặt hàng

`POST /order/checkout`. Controller lấy username từ Security Context, giỏ từ session; không nhận địa chỉ hay danh sách sản phẩm từ request body.

```json
{ "status": "success", "orderId": 14 }
```

Giỏ trống:

```json
{ "status": "empty_cart" }
```

Mã đơn là minh họa. Dùng tài khoản có `customer` liên kết; nếu thiếu hồ sơ, service có thể tạo đơn thiếu khách hàng/trạng thái. Trạng thái trong mã là `PENDING`, `APPROVED`, `CANCELED`.

# Giá và ảnh

- `product.price` là chuỗi. SQL dùng dạng `15.990.000`; form quản trị nhập số như `15990000`.
- Giỏ/checkout bỏ dấu chấm, đổi dấu phẩy thành dấu chấm rồi chuyển sang `BigDecimal`. Không lưu kèm `VND`, `đ` hoặc ký hiệu tiền tệ.
- `orderdetail.price` là đơn giá nguyên VND, `orders.total_amount` là tổng tiền nguyên VND.
- JSP danh sách dùng `fmt:formatNumber`; nên nhập chữ số thuần để giảm lỗi hiển thị. Giá có dấu phân cách từ SQL cần kiểm tra trên giao diện.
- `imagespath` được dùng trực tiếp trong `src` của ảnh. Dùng URL đầy đủ hoặc đường dẫn tĩnh hợp lệ như `/web/assets/images/may1.jpg`.

# 9. Luồng sử dụng và kiểm tra thủ công

# Khách hàng

1. Đăng ký/đăng nhập tài khoản mới có hồ sơ khách hàng.
2. Thử tìm tên, lọc danh mục và sắp xếp giá ở `/product`.
3. Mở sản phẩm có giá hợp lệ, thêm vào giỏ với số lượng dương.
4. Kiểm tra tên, ảnh, đơn giá, số lượng, tổng tiền ở `/cart`.
5. Xóa một sản phẩm để kiểm tra cập nhật giỏ; thêm lại nếu cần.
6. Đặt hàng, ghi nhận mã đơn; kiểm tra giỏ đã xóa và dữ liệu `orders`, `orderdetail` đã lưu.

# Quản trị

1. Đăng nhập bằng tài khoản chỉ có `ADMIN`.
2. Thử tìm sản phẩm theo các trường quản trị.
3. Thêm sản phẩm thử với giá chữ số thuần, tải ảnh nếu Cloudinary đã cấu hình.
4. Sửa thông tin, kiểm tra ở trang quản trị và khách hàng.
5. Duyệt/hủy đơn vừa tạo, kiểm tra trạng thái.
6. Cập nhật vai trò một tài khoản thử khác, đăng nhập lại tài khoản đó để kiểm tra.

# Xác thực và bố cục

- Thử đăng nhập sai, email đã dùng, mật khẩu xác nhận không khớp.
- Thử email khôi phục, token hợp lệ, token sai và token hết hạn.
- Thử tài khoản khách hàng truy cập `/admin/home`. Security đặt đích lỗi `/access-denied`, nhưng chưa thấy controller/view riêng cho URL này.
- Kiểm tra màn hình `320`, `390`, `768`, `1024`, `1440` px: menu, bộ lọc, thẻ sản phẩm, giỏ, bảng quản trị và form.
- Xem Console/Network khi AJAX lỗi hoặc không tải được ảnh/CDN.

Repository chưa có lớp test tự động. Các lệnh và kịch bản ở đây là hướng dẫn kiểm tra; README không khẳng định đã kiểm thử đầy đủ với database, SMTP và Cloudinary.

# 10. Đóng gói và triển khai

# WAR thực thi

Đóng gói và gọi rõ bước repackage:

```powershell
mvn clean package spring-boot:repackage
java -jar target/spring-boot-1.0.war
```

`SpringBootWebApplication` có `main` và kế thừa `SpringBootServletInitializer`. Khi chạy WAR, tiếp tục cung cấp cấu hình database/dịch vụ phù hợp.

# Tomcat ngoài

Dự án dùng API `javax.servlet` và JSP. Khi deploy lên Tomcat ngoài, kiểm tra dependency `spring-boot-starter-tomcat`: `scope=provided` hiện bị comment trong POM. `web.xml` cấu hình SiteMesh và servlet `/repository/*`.

Nhiều JSP dùng URL bắt đầu bằng `/`, liên kết email dùng URL local cố định. Deploy dưới context `/spring-boot-1.0` cần sửa URL; chạy ở context gốc khớp các đường dẫn hiện có. `web.xml` còn tham chiếu `ReadFileUtils` không có trong source, cần xử lý trước khi triển khai.

# 10. Lỗi thường gặp và giới hạn hiện tại

| Hiện tượng                                                | Điểm cần kiểm tra                                                                                     |
| --------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `mvn` không được nhận diện                                | Maven, `PATH`, JDK; hoặc Maven trong IDE                                                              |
| Không kết nối database                                    | MySQL đã chạy, host/cổng, database `computer_ver3`, quyền và thông tin đăng nhập                      |
| `Unknown column` ở `roles`                                | Bổ sung `code`/auditing theo bước 3; `ddl-auto=none` không tự tạo                                     |
| Không vào được quản trị                                   | `roles.code='ADMIN'`, `userroles`, `enabled=1`; đăng nhập lại                                         |
| Đăng ký lỗi                                               | Phải có `code='USER'`; kiểm tra trùng username/email/phone và log                                     |
| Lỗi view ở nhánh đăng ký không hợp lệ                     | Controller trả `SignIn` nhưng file là `signin.jsp`; thống nhất tên trên hệ thống phân biệt hoa/thường |
| Lỗi parse giá/tổng tiền                                   | Giá không null/rỗng hay kèm đơn vị; hoàn thiện sản phẩm `16` trước khi dùng                           |
| Không gửi email                                           | SMTP, thông tin gửi, mạng, log; controller hiện có thể báo email không tồn tại cả khi lỗi gửi thư     |
| Upload thất bại                                           | Cloudinary, mạng, kích thước file, response HTTP `500`                                                |
| Ảnh không hiển thị                                        | Kiểm tra URL; tên file chưa chắc trỏ đến ảnh có thật                                                  |
| `ClassNotFoundException: com.javaweb.utils.ReadFileUtils` | Lớp có trong `web.xml` nhưng thiếu source; bổ sung hoặc cập nhật mapping `/repository/*`              |
| Lỗi khóa ngoại khi xóa                                    | Dữ liệu có thể đang được đơn hàng/token tham chiếu                                                    |
| Lỗi khóa ngoại sau khi đổi ID                             | Kiểu ID và khóa ngoại phải khớp; tắt kiểm tra khóa ngoại không sửa sai kiểu                           |

Các điểm cần hoàn thiện khi phát triển tiếp:

- Bảo vệ API sản phẩm/checkout, xem lại CSRF và các thao tác thay đổi dữ liệu dùng GET.
- Kiểm tra ID, số lượng dương, giá và hồ sơ khách hàng; service giỏ hiện chỉ cộng số lượng, chưa xác thực đầy đủ.
- Xử lý sản phẩm không tồn tại thay vì gọi `Optional.get()` trực tiếp.
- Rà soát cập nhật vai trò: controller xử lý đặc biệt ID `1`, chưa xử lý danh sách `roles` bị thiếu.
- Dùng truy vấn có tham số cho tìm kiếm quản trị; repository đang nối đầu vào vào SQL.
- Đồng bộ schema, kiểu ID, giá; tách thông tin dịch vụ khỏi mã nguồn.
- Bổ sung kiểm thử xác thực, giỏ/checkout, phân quyền và khôi phục mật khẩu.

Chưa có module tồn kho, giao vận, thanh toán trực tuyến hay lịch sử đơn riêng cho khách hàng. Khi mở rộng, cập nhật đồng thời entity, schema, service, controller và giao diện.
