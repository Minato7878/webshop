<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="navbar">
    <div class="navbar-inner">
        <div class="container">

            <ul class="nav">
                <li class="active"><a href="${pageContext.request.contextPath}/home"> HOME</a></li>
                <li><a href="${pageContext.request.contextPath}/under_construction">BLOG</a></li>
                <li><a href="${pageContext.request.contextPath}/shop">SHOP</a></li>
                <li><a href="${pageContext.request.contextPath}/under_construction">DELIVERY</a></li>
                <li><a href="${pageContext.request.contextPath}/under_construction">ABOUT US</a></li>
            </ul>
            <form action="#" class="navbar-search pull-left">
                <input type="text" placeholder="Search" class="search-query span2">
            </form>
            <c:choose>
                <c:when test="${not empty loggedUser}">
                    <ul class="nav pull-right">
                        <li class="dropdown accountForm">
                            <a data-toggle="dropdown" class="dropdown-toggle"><span
                                    class="icon-user"></span> ${loggedUser.login} <b class="icon-caret-down"></b></a>
                            <div class="dropdown-menu">
                                <div class="control-group loggedUser">
                                    <a href="${pageContext.request.contextPath}/profile">
                                        <span class="icon-user"></span>
                                        <span class="text">My Account</span>
                                    </a>
                                </div>
                                <div class="control-group loggedUser">
                                    <a href="${pageContext.request.contextPath}/settings">
                                        <span class="icon-cog"></span>
                                        <span class="text">Settings</span>
                                    </a>
                                </div>
                                <div class="control-group loggedUser">
                                    <a href="${pageContext.request.contextPath}/logout">
                                        <span class="icon-signout"></span>
                                        <span class="text"> Sign out </span>
                                    </a>
                                </div>
                            </div>
                        </li>
                    </ul>

                </c:when>
                <c:otherwise>
                    <ul class="nav pull-right">
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle"><span class="icon-lock"></span> Login <b
                                    class="caret"></b></a>
                            <div class="dropdown-menu">
                                <form class="form-horizontal loginFrm" method="POST"
                                      action="${pageContext.request.contextPath}/login">
                                    <div class="control-group">
                                        <input type="text" name="login" class="span2" id="inputEmail"
                                               placeholder="Email" value="${user.login}"/>
                                    </div>
                                    <div class="control-group">
                                        <input type="password" name="password" class="span2" id="inputPassword"
                                               placeholder="Password" value="${user.password}"/>
                                    </div>
                                    <div class="control-group">
                                        <label class="checkbox">
                                            <input type="checkbox" name="rememberMe" value="Y"> Remember me
                                        </label>
                                        <button type="submit" class="shopBtn btn-block" value="Submit"> Sign in
                                            <a href="${pageContext.request.contextPath}/"></a>
                                        </button>
                                    </div>
                                </form>
                                <form class="form-horizontal loginFrm" method="GET"
                                      action="${pageContext.request.contextPath}/signup">
                                    <div class="control-group">
                                        <button type="submit" class="shopBtn btn-block" value="Submit"> Sign up
                                            <a href="${pageContext.request.contextPath}/"></a>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<script src="../../../resources/assets/js/active-link.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
