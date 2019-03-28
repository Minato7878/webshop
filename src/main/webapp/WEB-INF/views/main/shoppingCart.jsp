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
        <div class="span12">
            <div class="well well-small">
                <h1>Shopping Cart
                    <small class="pull-right">${storedCart.itemsCount} Items are in the cart</small>
                </h1>
                <hr class="soften"/>

                <table class="table table-bordered table-condensed">
                    <thead>
                    <tr>
                        <th>Product</th>
                        <th>Description</th>
                        <th>Avail.</th>
                        <th>Unit price</th>
                        <th>Qty</th>
                        <th>Remove</th>
                        <th>Total</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${storedCart.cart}" var="order">
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
                            <td>
                                <c:when test="${order.product.quantity>0}">
                                <span class="shopBtn"><span class="icon-ok"></span></span>
                                </c:when>
                                <c:otherwise>
                                    <span class="shopBtn"><span class="icon-remove"></span></span>
                                </c:otherwise>
                            </td>
                            <td>${order.product.price}$</td>
                            <td>
                                <input class="span1" style="max-width:34px" placeholder="1" size="16" type="number"
                                       value="${order.quantity}" min="1" max="${order.product.quantity}"
                                       id="${order.product.id}-quantity"
                                       onclick="countPrice(<c:out value="${order.product.id}"/>,
                                           <c:out value="${order.product.price}"/>,
                                           <c:out value="${product_id_list}"/>)">
                            </td>
                            <td>
                                <form action="${pageContext.request.contextPath}/cart" method="get">
                                <input type="hidden" name="remove" value="${order.product.id}">
                                <button class="btn btn-danger" type="submit">
                                    <span class="icon-remove"></span>
                                </button>
                                </form>
                            </td>
                            <td id="${order.product.id}-price">${order.product.price*order.quantity}$</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="6" class="alignR">Total products:</td>
                        <td id="cart-price"> ${storedCart.totalPrice}$</td>
                    </tr>
                    </tbody>
                </table>
                <br/>


                <a href="${pageContext.request.contextPath}/shop" class="shopBtn btn-large"><span
                        class="icon-arrow-left"></span> Continue Shopping </a>
                <a href="${pageContext.request.contextPath}/payment" class="shopBtn btn-large pull-right">Next <span
                        class="icon-arrow-right"></span></a>

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