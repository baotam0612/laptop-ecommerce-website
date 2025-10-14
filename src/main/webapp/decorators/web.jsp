<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/web/assets/css/reset.css">
      <link rel="stylesheet" href="/web/assets/css/base.css">
      <link rel="stylesheet" href="/web/assets/css/style.css">
</head>
<style>
.main-content .container .inner-wrap {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.main-content .container .inner-wrap .inner-logo a img {
    width: 100%;
    height: auto;
}

.main-content .container .inner-wrap .inner-logo  {
    width: 50%;
}

.main-content .container .inner-wrap .inner-content .inner-title {
    font-size: 18px;
    font-weight: 600;
}


.main-content .container .inner-wrap .inner-content .inner-price {
    color: red;
    font-size: 18px;
    font-weight: 500;
}


.main-content .container .inner-wrap .inner-content ul li {
    font-size: 16px;
    font-weight: 500;
    color: var(--color-seven);
    margin-bottom: 10px;

}
.main-content .container .inner-wrap .inner-content ul {
    padding-left: 0px;

}
.main-content {
    background-color: #fafafa;
}
.main-content .container .inner-wrap {
    background-color: #FFFFFF;
}


.main-content .container .inner-wrap .inner-content button {
    background-color: #ff7516;
    width: 50%;
    padding: 15px 30px;
    border-radius: 10px;
    font-size: 20px;
    font-weight: 600;
    cursor: pointer;
}
 table { width: 80%; margin: 20px auto; border-collapse: collapse; margin-bottom:100px;}
        table th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        table img { width:120px; }
        table .total { text-align: right; margin-right: 10%; font-size: 18px; font-weight: bold; }
       table button { background: crimson; color: white; border: none; padding: 5px 10px; cursor: pointer; border-radius: 6px; }


.main-content { padding: 40px; }
 .inner-wrap { display: flex; gap: 40px; align-items: flex-start; }
  .inner-logo img { width: 300px; border-radius: 10px; }
   .inner-content { max-width: 600px; } .inner-title { font-size: 1.8rem; font-weight: bold; margin-bottom: 10px; } .inner-price { font-size: 1.5rem; color: #e63946; margin-bottom: 15px; } button.order { padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 6px; cursor: pointer; transition: 0.2s; } button.order:hover { background-color: #0056b3; } .cart-count { font-weight: bold; color: red; }


</style>



<body>

<%@ include file="/common/web/header.jsp" %>


<dec:body/>

<%@ include file="/common/web/footer.jsp" %>

</body>
</html>