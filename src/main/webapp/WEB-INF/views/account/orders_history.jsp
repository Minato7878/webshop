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
<!-- Header Section -->
<jsp:include page="../elements/_header.jsp"></jsp:include>

<div class="container">
    <!-- Navigation Bar Section -->
    <jsp:include page="../elements/_navbar.jsp"></jsp:include>
    <!-- Body Section -->
    <div class="row">
        <jsp:include page="../elements/_sidebar_account.jsp"></jsp:include>
        <div class="span9">
            <div class="well well-small">
                <h1>My Orders History</h1>
                <hr class="soften"/>

                <table class="table table-bordered table-condensed">
                    <thead>
                    <tr>
                        <th>Product</th>
                        <th>Description</th>
                        <th>Unit price</th>
                        <th>Qty</th>
                        <th>Total</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${order_list}" var="order">
                        <tr>
                            <td><img style="width: 200px; height: 200px;"
                                     src="${pageContext.request.contextPath}/image/${order.product.imgUrl}"
                                     alt="${order.product.name}">
                            </td>
                            <td>${order.product.name}
                                <br>Carate : 22
                                <br>Model : n/a
                                <br>${order.product.description}
                            </td>
                            <td>${order.product.price}$</td>
                            <td>${order.quantity}</td>
                            <td id="${order.product.id}-price">${order.product.price*order.quantity}$</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="4" class="alignR">Total products:</td>
                        <td id="cart-price"> ${totalPrice}$</td>
                    </tr>
                    </tbody>
                </table>
                <br/>

            </div>
        </div>
    </div>
</div><!-- /container -->

<!-- Placed at the end of the document so the pages load faster -->
<script src="../../../resources/assets/js/jquery.js"></script>
<script src="../../../resources/assets/js/bootstrap.min.js"></script>
<script src="../../../resources/assets/js/count-price.js"></script>
</body>
</html>