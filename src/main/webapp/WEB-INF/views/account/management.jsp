<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<body>
<!-- Upper Header Section -->
<jsp:include page="../elements/_header.jsp"></jsp:include>

<!-- Lower Header Section -->
<div class="container">
    <!-- Navigation Bar Section -->
    <jsp:include page="../elements/_navbar.jsp"></jsp:include>
    <div class="row">
        <jsp:include page="../elements/_sidebar_account.jsp"></jsp:include>
        <div class="span9">
            <div class="well well-small">
                <table>
                    <a class="btn btn-warning pull-right" href="${pageContext.request.contextPath}/add_product">
                        <span class="icon-plus"> Add New Product</span>
                    </a>
                    <h1>My Products</h1>
                    <hr class="soften"/>
                    <ul style="list-style: none;">
                        <c:forEach items="${product_list}" var="product">
                            <li>
                                <div class="row-fluid">
                                    <div class="span2">
                                        <img style="height: 100px"
                                             src="${pageContext.request.contextPath}/image/${product.imgUrl}"
                                             alt="${product.name}">
                                    </div>
                                    <div class="span6 text">
                                        <h5>${product.name}</h5>
                                        <p class="text">
                                                ${product.description}
                                        </p>
                                    </div>
                                    <div class="span4 alignR">
                                        <form class="form-horizontal qtyFrm">
                                            <h3> ${product.price}$</h3>
                                            <div class="btn-group">
                                                <a href="${pageContext.request.contextPath}/edit_product?productId=${product.id}"
                                                   class="btn btn-light">
                                                    <span class="icon-edit"></span>Edit</a>
                                                <a href="${pageContext.request.contextPath}/remove_product?productId=${product.id}"
                                                   class="btn btn-danger">
                                                    <span class="icon-remove"></span>Remove</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <hr class="soften">
                            </li>
                        </c:forEach>
                    </ul
                </table>
            </div>
        </div>
    </div>
</div>


</div><!-- /container -->

<!-- Placed at the end of the document so the pages load faster -->
<script src="../../../resources/assets/js/jquery.js"></script>
<script src="../../../resources/assets/js/bootstrap.min.js"></script>
<script src="../../../resources/assets/js/jquery.easing-1.3.min.js"></script>
<script src="../../../resources/assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
<script src="../../../resources/assets/js/shop.js"></script>
</body>
</html>