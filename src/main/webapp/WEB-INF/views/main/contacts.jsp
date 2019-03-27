<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!-- Upper Header Section -->
<jsp:include page="../elements/_header.jsp"></jsp:include>

<!-- Lower Header Section -->
<div class="container">
    <!-- Navigation Bar Section -->
    <jsp:include page="../elements/_navbar.jsp"></jsp:include>
    <!--  Body Section  -->
    <div class="well well-small">
        <h1>Visit us</h1>
        <hr class="soften"/>
        <div class="row-fluid">
            <div class="span8 relative">
                <iframe style="width:100%; height:350px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                        src = "https://maps.google.com/maps?q=49.8321448,23.9987968&hl=es;z=14&amp;output=embed">
                </iframe>
                <div class="absoluteBlk">
                    <div class="well wellsmall">
                        <h5>Contact Details</h5>
                        <h6>
                            72 Heroiv Upa St.<br/>
                            Lviv, UA 79000<br/><br/>

                            webshop@anime.com<br/>
                            ﻿Tel 123-456-6780<br/>
                            Fax 123-456-5679<br/>
                            web:www.myanimeshop.com
                        </h6>
                    </div>
                </div>
            </div>

            <div class="span4" style="margin-left: 10px;">
                <h3>Email Us</h3>
                <form class="form-horizontal">
                    <fieldset>
                        <div class="control-group">

                            <input type="text" placeholder="name" class="input-xlarge"/>

                        </div>
                        <div class="control-group">

                            <input type="text" placeholder="email" class="input-xlarge"/>

                        </div>
                        <div class="control-group">

                            <input type="text" placeholder="subject" class="input-xlarge"/>

                        </div>
                        <div class="control-group">
                            <textarea rows="3" id="textarea" class="input-xlarge"></textarea>

                        </div>

                        <button class="shopBtn" type="submit">Send email</button>

                    </fieldset>
                </form>
            </div>
        </div>
    </div>

    <a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../../../resources/assets/js/jquery.js"></script>
    <script src="../../../resources/assets/js/bootstrap.min.js"></script>
    <script src="../../../resources/assets/js/jquery.easing-1.3.min.js"></script>
    <script src="../../../resources/assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
    <script src="../../../resources/assets/js/shop.js"></script>
</body>
</html>
