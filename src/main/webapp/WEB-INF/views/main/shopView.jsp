<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Anime online-shop</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap styles -->
    <link href="../../../resources/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- Customize styles -->
    <link href="../../../resources/css/style.css" rel="stylesheet"/>
    <!-- font awesome styles -->
    <link href="../../../resources/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
</head>
<
<body> <!-- bootstrap-overrides id -->
<!-- Upper Header Section -->
<jsp:include page="../elements/_header.jsp"></jsp:include>

<!-- Lower Header Section -->
<div class="container">
    <!-- Navigation Bar Section -->
    <jsp:include page="../elements/_navbar.jsp"></jsp:include>
    <!-- Body Section -->
    <div class="row">
        <jsp:include page="../elements/_sidebar_main.jsp"></jsp:include>
        <div class="span9">
            <div class="well well-small">
                <h3>Our Products </h3>
                <div class="row-fluid">
                    <ul class="thumbnails">
                        <c:forEach items="${product_list}" var="product">
                            <li class="span4">
                                <div class="thumbnail">
                                    <a href="${pageContext.request.contextPath}/product?id=${product.id}">
                                        <img style="height: 200px; width: 200px;"
                                                src="${pageContext.request.contextPath}/image/${product.imgUrl}" alt="image">
                                    </a>
                                    <div class="caption cntr">
                                        <p>${product.name}</p>
                                        <p><strong> ${product.price}$</strong></p>
                                        <h4><a class="shopBtn" href="${pageContext.request.contextPath}/order?id=${product.id}"
                                               title="add to cart"> Add to cart </a></h4>
                                        <br class="clr">
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div><!-- /container -->

<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
<!-- Placed at the end of the document so the pages load faster -->
<script src="../../../resources/assets/js/jquery.js"></script>
<script src="../../../resources/assets/js/bootstrap.min.js"></script>
<script src="../../../resources/assets/js/jquery.easing-1.3.min.js"></script>
<script src="../../../resources/assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
<script src="../../../resources/assets/js/shop.js"></script>

</body>
</html>
