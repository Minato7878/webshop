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
        <jsp:include page="../elements/_sidebar_account.jsp"></jsp:include>
        <div class="span9">
            <div class="well well-small">
                <div class="row-fluid">
                    <form class="add-product-form" action="${pageContext.request.contextPath}/add_product" method="post">
                        <div class="span5">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <img id='img-upload' alt="anime-girl"
                                         src="${pageContext.request.contextPath}/resources/assets/img/default_picture.jpg"/>
                                    <input type="file" name="product_image" id="imgInp">
                                </div>
                            </div>
                        </div>

                        <div class="span7">
                            <div class="add-product-item product-name">
                                <label class="product-form-label">Product Name</label>
                                <div class="form-input-wrapper">
                                    <input type="text" id="product_name"
                                           name="product_name" maxlength="50"
                                           class="form-input-input"
                                           placeholder="">
                                </div>
                            </div>

                            <div class="add-product-item product-price">
                                <label class="product-form-label">Product Price</label>
                                <div class="form-input-wrapper">
                                    <input type="number" id="product_price"
                                           style="width: 70px" step="0.01"
                                           name="product_price" maxlength="20"
                                           class="form-input-input"
                                           placeholder="">
                                    <span style="color: orange; font-size: 20px; margin-left: 5px"> $</span>
                                </div>
                            </div>

                            <div class="add-product-item product-quantity">
                                <label class="product-form-label"><span>Quantity</span></label>
                                <input type="number" class="span6" name="product_quantity"
                                       style="width: 55px" min="1" max="999" value="1">
                            </div>

                            <div class="control-group">
                                <label class="product-form-label"><span>Category</span></label>
                                <div class="controls">
                                    <label>
                                        <select multiple size="3" id="categorySelect" class="span11"
                                                style="width: 200px" name="product_categories"
                                                onchange="myFunction()">
                                            <c:forEach items="${category_list}" var="category">
                                                <option>${category}</option>
                                            </c:forEach>
                                            <option>Add new category</option>
                                        </select>
                                    </label>
                                </div>
                            </div>

                            <script>
                                function myFunction() {
                                    var values = $('#categorySelect').val();
                                    for (var i = 0; i < values.length; i++) {
                                        if (values[i] === "Add new category") {
                                            document.getElementById("product-new-category").style.display = "block";
                                            break;
                                        } else {
                                            document.getElementById("product-new-category").style.display = "none";
                                        }
                                    }
                                }
                            </script>

                            <div class="add-product-item product-new-category"
                                 id="product-new-category" style="display: none">
                                <label class="product-form-label">Category Name</label>
                                <div class="form-input-wrapper">
                                    <input type="text" id="newCategory"
                                           name="product_newCategory" maxlength="50"
                                           class="form-input-input"
                                           placeholder="">
                                </div>
                            </div>

                            <div class="add-product-item product-description">
                                <label class="product-form-label">Product Description</label>
                                <div class="tinymce-component">
                                            <textarea id="product_about" name="product_about" required="required"
                                                      data-theme="tinymce" placeholder=""></textarea>
                                </div>
                            </div>

                            <button type="submit" class="shopBtn">
                                <span class=" icon-shopping-cart"></span> Save
                            </button>
                        </div>
                    </form>
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
<script src="../../../resources/assets/js/upload-img.js"></script>
</body>
</html>