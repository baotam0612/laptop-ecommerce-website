<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chu</title>

      

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>
    
    <div class="section1">
        <img src=https://itvn.blog/wp-content/uploads/2020/07/A%CC%89nh-hi%CC%80nh-ne%CC%82%CC%80n-ma%CC%81y-ti%CC%81nh-4k-%C4%91e%CC%A3p-cho-ma%CC%81y-ti%CC%81nh.jpeg alt="">
    </div>
    <div class="section3">
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-box">
                <c:forEach var="p" items="${products}">
                    <a href="#" class="inner-item">
                        <div class="inner-img"><img src="${p.imagespath}" alt=""></div>
                        <div class="inner-des">${p.name}</div>
                        <span>${p.price}</span>
                    </a>
                    </c:forEach>
                    
                </div>        
            </div>
        </div>
    </div>

    <div class="section2">
        <div class="container">
            <div class="inner-wrap">

                <div class="inner-infor">
                    <div class="inner-title">Về chúng tôi</div>
                    <div class="inner-des">Tại ComputerShop, chúng tôi không chỉ bán máy tính. Chúng tôi mang đến cho
                        bạn những công cụ mạnh mẽ để biến ý tưởng thành hiện thực, kết nối bạn với thế giới và nâng tầm
                        trải nghiệm số của bạn.</div>
                </div>
                <div class="inner-img">
                    <img src="https://png.pngtree.com/png-clipart/20240627/original/pngtree-beautiful-girl-holding-laptop-and-smiling-png-image_15424328.png"
                        alt="">
                </div>
            </div>
        </div>
    </div>

    <div class="section4">
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-box1">
                    <div class="inner-img">
                        <img src="https://images.seeklogo.com/logo-png/42/1/apple-logo-png_seeklogo-427436.png" alt="">
                    </div>
                    <div class="inner-img">
                        <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSdBefeGIuaEww29bY6RJ9WVTbw1JmK--RIZhMLvcWnpC4WCmD0" alt="">
                    </div>
                    <div class="inner-img">
                        <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSRGKhL4oa8yhCcHPsv71YO3TuBcQcG4UB4A1xVKBYwVS_FS3sC" alt="">
                    </div>

                </div>
                <div class="inner-box2">
                    <div class="inner-img">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/HP_logo_1979.svg/2560px-HP_logo_1979.svg.png" alt="">
                    </div>
                    <div class="inner-img">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5nnrRcBNoHoqqPL3hvctZVfBGbIHQbdj6s6QxY20B1Rj43-u9" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="section5">
        <div class="container">
            <div class="inner-wrap">
                <div class="inner-box">
                    <div class="inner-logo"><i class="fa-solid fa-cart-shopping"></i></div>
                    <div class="inner-title">Giao hàng & Lắp đặt</div>
                    <div class="inner-des">Miễn phí</div>
                </div>
                <div class="inner-box">
                    <div class="inner-logo"><i class="fa-solid fa-rotate"></i></div>
                    <div class="inner-title">Hoàn hàng</div>
                    <div class="inner-des">Miễn phí</div>
                </div>
                <div class="inner-box">
                    <div class="inner-logo"><i class="fa-solid fa-shield-halved"></i></div>
                    <div class="inner-title">Bảo hành đến 2 năm</div>
                    <div class="inner-des">Miễn phí</div>
                </div>
                <div class="inner-box">
                    <div class="inner-logo"><i class="fa-solid fa-phone"></i></div>
                    <div class="inner-title">Tư vấn</div>
                    <div class="inner-des">Miễn phí</div>
                </div>
            </div>
        </div>
    </div>

    


</body>

</html>