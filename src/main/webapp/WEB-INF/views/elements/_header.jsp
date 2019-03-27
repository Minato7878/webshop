<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<div class="navbar-fixed-top">
    <div class="container">
        <div class="alignR">
            <a href="home"><span class="icon-home"></span> Home</a>
            <a href="${pageContext.request.contextPath}/contact">
                <span class="icon-envelope"></span> Contact us
            </a>
        <a href="${pageContext.request.contextPath}/cart"><span class="icon-shopping-cart"></span> ${storedCart.itemsCount} Item(s) - <span class="badge badge-warning" id = "header-cart-price"> ${storedCart.totalPrice}$</span></a>
        </div>
    </div>
</div>
