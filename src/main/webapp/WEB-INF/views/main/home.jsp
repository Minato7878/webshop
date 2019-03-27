<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
<body>
<!-- Header Section -->
<jsp:include page="../elements/_header.jsp"></jsp:include>

<div class="container">
    <!-- Navigation Bar Section -->
    <jsp:include page="../elements/_navbar.jsp"></jsp:include>
    <!-- Body Section -->
    <div class="row">
        <!-- Side Bar Section -->
        <jsp:include page="../elements/_sidebar_main.jsp"></jsp:include>
        <div class="span9">
            <div class="well np">
                <div id="myCarousel" class="carousel slide homCar">
                    <div class="carousel-inner">
                        <div class="item active">
                            <img style="width:100%" src="${pageContext.request.contextPath}/image/bag.jpg" alt="bag photo">
                            <div class="carousel-caption">
                                <h4>New Collection</h4>
                            </div>
                        </div>
                        <c:forEach items="${big_carousel}" var="product">
                        <div class="item">
                            <img style="width:100%" src="${pageContext.request.contextPath}/image/${product.imgUrl}"
                                 alt="${product.name}">
                            <div class="carousel-caption">
                                <h4>New Collection</h4>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
                </div>
            </div>
            <!-- New Products -->
            <div class="well well-small">
                <h3>New Products </h3>
                <hr class="soften"/>
                <div class="row-fluid">
                    <div id="newProductCar" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="item active">
                                <ul class="thumbnails">
                                    <c:forEach items="${small_carousel_1}" var="product">
                                    <li class="span3">
                                        <div class="thumbnail">
                                            <a href="${pageContext.request.contextPath}/product?id=${product.id}">
                                                <img style="height:150px;" src="${pageContext.request.contextPath}/image/${product.imgUrl}"
                                                     alt="${product.name}">
                                            </a>
                                        </div>
                                    </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="item">
                                <ul class="thumbnails">
                                    <c:forEach items="${small_carousel_2}" var="product">
                                    <li class="span3">
                                        <div class="thumbnail">
                                            <a href="${pageContext.request.contextPath}/product?id=${product.id}">
                                                <img style="height:150px;" src="${pageContext.request.contextPath}/image/${product.imgUrl}"
                                                     alt="${product.name}">
                                            </a>
                                        </div>
                                    </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#newProductCar" data-slide="prev">&lsaquo;</a>
                        <a class="right carousel-control" href="#newProductCar" data-slide="next">&rsaquo;</a>
                    </div>
                </div>
                <div class="row-fluid">
                    <ul class="thumbnails">
                        <c:forEach items="${xxx}" var="product">
                        <li class="span4">
                            <div class="thumbnail">
                                <a href="${pageContext.request.contextPath}/product?id=${product.id}">
                                    <img src="${pageContext.request.contextPath}/image/${product.imgUrl}"
                                         alt="${product.name}">
                                </a>
                                <div class="caption cntr">
                                    <p>${product.description}</p>
                                    <p><strong> $${product.price}</strong></p>
                                    <h4><a class="shopBtn" href="${pageContext.request.contextPath}/order?id=${product.id}" title="add to cart"> Add to cart </a></h4>
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