<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sidebar" class="span3">
    <div class="well well-small">
        <ul class="nav nav-list account-menu-list">
            <li>
                <a href="${pageContext.request.contextPath}/profile">
                    <span class="icon-chevron-right"></span> My Profile</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/orders_history">
                    <span class="icon-chevron-right"></span> My Orders</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/management">
                    <span class="icon-chevron-right"></span> Management</a>
            </li>
        </ul>
    </div>
</div>

