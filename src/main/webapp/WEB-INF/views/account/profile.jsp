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
        <jsp:include page="../elements/_sidebar_account.jsp"></jsp:include>
        <div class="span9">
            <div class="well well-small">
                <h3>My Profile </h3>
                <div class="row-fluid">
                    <div class="profile-form">
                        <form novalidate="" method="post" action="">


                            <div class="profile-item profile-greeting-item">
                                <div class="profile-avatar-block">
                                    <img style="width: auto; height: 200px"
                                         alt="User Avatar"
                                         class="settings-avatar-upload-avatar-image"
                                         src="${pageContext.request.contextPath}/image/ph.jpg">
                                </div>

                                <div class="profile-greeting-text-block">
                                    <span class="greetings-view-text profile-greeting-text-item">Hello,
                                        <span class="user-view profile-greeting-text-item">${loggedUser.login}</span>
                                    </span>
                                    <div class="profile-greeting-text-item">
                                        <span class="greetings-view-text">Member since Feb 24, 2019</span>
                                    </div>
                                </div>
                            </div>

                            <div class="profile-item profile-login-item">
                                <label class="profile-form-label">
                                    Username </label>
                                <div>
                                    <span class="loggedUser" > minato7878 </span>
                                </div>
                            </div>

                            <div class="profile-item profile-fname-item">
                                <label class="profile-form-label"
                                       for="profile_firstName">First Name</label>
                                <div class="form-input-wrapper "><input type="text" id="profile_firstName"
                                                                        name="profile[firstName]"
                                                                        maxlength="50"
                                                                        class="form-input-input"
                                                                        data-tinymce="false"
                                                                        placeholder="">
                                </div>
                            </div>

                            <div class="profile-item profile-lname-item">
                                <label class="profile-form-label"
                                       for="profile_lastName">Last Name</label>
                                <div class="form-input-wrapper "><input type="text" id="profile_lastName"
                                                                        name="profile[lastName]"
                                                                        maxlength="50" class="form-input-input"
                                                                        data-tinymce="false" placeholder=""></div>
                            </div>

                            <div class="profile-item profile-email-item">
                                <label class="profile-form-label">
                                    Email Address </label>
                                <div>
                                    <span class="loggedUser" >danylo.matviykiv@gmail.com</span>
                                    <a href="#" title="Change">   Change </a>
                                </div>
                            </div>

                            <div class="profile-item profile-location-item">
                                <label class="profile-form-label"
                                       for="profile_location">Location</label>
                                <div class="form-input-wrapper "><input type="text" id="profile_location"
                                                                        name="profile[location]"
                                                                        maxlength="100" class="form-input-input"
                                                                        data-tinymce="false" placeholder=""
                                                                        value="Львів"></div>
                            </div>


                            <div class="profile-item profile-about-item">
                                <label class="profile-form-label"
                                       for="profile_about">About Me</label>


                                <div class="post-tinymce-editor settings-profile-tinymce-editor">
                                    <div class="tinymce-component">
                                        <textarea id="profile_about" name="profile[about]" required="required"
                                                  class="form-textarea-component form-textarea-full-width"
                                                  data-theme="tinymce" placeholder=""></textarea>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <button type="submit" id="profile_save" name="profile[save]"
                                        class="form-button-primary">
                                    Save
                                </button>
                            </div>

                            <input type="hidden" id="profile__token" name="profile[_token]"
                                   value="jHkE877Se7-ZiSFtXrOzQImsrMxoQGHVE0YndAR1wmo"></form>
                    </div>
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
