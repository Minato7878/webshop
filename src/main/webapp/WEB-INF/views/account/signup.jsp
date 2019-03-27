<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Info</title>
    <!-- Customize styles -->
    <link href="../../../resources/css/registration_style.css" rel="stylesheet"/>
</head>
<body>
<h1>Hello</h1>
<div id="id1" class="model">

    <form class="model-content" method="POST" action="${pageContext.request.contextPath}/registration">
        <div class="container">
            <h1>Sign Up</h1>
            <p>Please fill in this form to create an account.</p>
            <hr>
            <label><b>Login</b></label>
            <input type="text" placeholder="Enter Login" name="login" required value="${user.login}"/>

            <label><b>First Name</b></label>
            <input type="text" placeholder="Enter First Name" name="fname" required  value="${user.fname}"/>

            <label><b>Last Name</b></label>
            <input type="text" placeholder="Enter Last Name" name="lname" required value="${user.lname}"/>

            <label><b>Email</b></label>
            <input type="email" placeholder="Enter Email" name="email" required value="${user.email}"/>

            <label><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="password" required value="${user.password}"/>

            <label><b>Repeat Password</b></label>
            <input type="password" placeholder="Repeat Password" name="password_repeat" required value="${user.password_repeat}"/>

            <label><b>Date of birth</b></label>
            <input type="date" value="2000-06-22" placeholder="Enter BDay" name="date" required value="${user.date}"/>

            <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

            <div class="clearfix">
                <button type="button" onclick="document.getElementById('id1').style.display='none'" class="cancelbtn">Cancel</button>
                <button type="submit" class="signupbtn" value="Submit"> Sign Up
                    <a href="${pageContext.request.contextPath}/"></a>
                </button>
            </div>
        </div>
    </form>
</div>
</body>
</html>