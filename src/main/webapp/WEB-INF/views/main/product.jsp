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
<body> <!-- bootstrap-overrides id -->
<!-- Upper Header Section -->
<jsp:include page="../elements/_header.jsp"></jsp:include>
<!-- Lower Header Section -->
<div class="container">
    <!-- Navigation Bar Section -->
    <jsp:include page="../elements/_navbar.jsp"></jsp:include>
    <!--
    Body Section
    -->
    <div class="row">
        <jsp:include page="../elements/_sidebar_main.jsp"></jsp:include>
        <div class="span9">
            <c:set var="product" scope="session" value="${product}"/>
            <div class="well well-small">
                <div class="row-fluid">
                    <div class="span5">
                        <div id="myCarousel" class="carousel slide cntr">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <a href="#"> <img style="height: 365px" src="${pageContext.request.contextPath}/image/${product.imgUrl}"
                                                      alt="" style="width:100%">
                                    </a>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                            <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
                        </div>
                    </div>
                    <div class="span7">
                        <h3>${product.name} [$${product.price}]</h3>
                        <hr class="soft"/>

                        <form class="form-horizontal qtyFrm">
                            <div class="control-group">
                                <label class="control-label "><span>$${product.price}</span></label>
                                <div class="controls">
                                    <input type="number" class="span6" placeholder="Qty.">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label"><span>Color</span></label>
                                <div class="controls">
                                    <select class="span11">
                                        <option>Red</option>
                                        <option>Purple</option>
                                        <option>Pink</option>
                                        <option>Red</option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label"><span>Materials</span></label>
                                <div class="controls">
                                    <select class="span11">
                                        <option>Material 1</option>
                                        <option>Material 2</option>
                                        <option>Material 3</option>
                                        <option>Material 4</option>
                                    </select>
                                </div>
                            </div>
                            <h4>100 items in stock</h4>
                            <p>
                                Nowadays the lingerie industry is one of the most successful business spheres.
                                Nowadays the lingerie industry is one of ...
                            <p>
                                <a type="submit" class="shopBtn" href="${pageContext.request.contextPath}/order?id=${product.id}">
                                    <span class=" icon-shopping-cart"></span> Add to cart
                                </a>
                        </form>
                    </div>
                </div>
                <hr class="softn clr"/>


                <ul id="productDetail" class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">Product Details</a></li>
                </ul>
                <div id="myTabContent" class="tab-content tabWrapper">
                    <div class="tab-pane fade active in" id="home">
                        <h4>Product Information</h4>
                        <table class="table table-striped">
                            <tbody>
                            <tr class="techSpecRow">
                                <td class="techSpecTD1">Color:</td>
                                <td class="techSpecTD2">Black</td>
                            </tr>
                            <tr class="techSpecRow">
                                <td class="techSpecTD1 white-text">Style:</td>
                                <td class="techSpecTD2 white-text">Apparel,Sports</td>
                            </tr>
                            <tr class="techSpecRow">
                                <td class="techSpecTD1">Season:</td>
                                <td class="techSpecTD2">spring/summer</td>
                            </tr>
                            <tr class="techSpecRow">
                                <td class="techSpecTD1 white-text">Usage:</td>
                                <td class="techSpecTD2 white-text">fitness</td>
                            </tr>
                            <tr class="techSpecRow">
                                <td class="techSpecTD1">Sport:</td>
                                <td class="techSpecTD2">122855031</td>
                            </tr>
                            <tr class="techSpecRow">
                                <td class="techSpecTD1 white-text">Brand:</td>
                                <td class="techSpecTD2 white-text">Shock Absorber</td>
                            </tr>
                            </tbody>
                        </table>
                        <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown
                            aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan
                            helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh
                            mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan
                            aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
                    </div>
                </div>

            </div>
        </div>
    </div> <!-- Body wrapper -->

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