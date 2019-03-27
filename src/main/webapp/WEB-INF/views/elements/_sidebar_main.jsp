<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sidebar" class="span3">
    <div class="well well-small">
        <ul class="nav nav-list">
            <li><a href=""><span class="categories">Categories</span></a></li>
            <li>
                <a href="${pageContext.request.contextPath}/category?category=accessories">
                    <span class="icon-chevron-right"></span> Accessories</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/category?category=figures">
                    <span class="icon-chevron-right"></span> Action Figure</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/category?category=bags">
                    <span class="icon-chevron-right"></span> Bags</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/category?category=clothing">
                    <span class="icon-chevron-right"></span> Clothing</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/category?category=cosplay">
                    <span class="icon-chevron-right"></span> Cosplay</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/category?category=manga">
                    <span class="icon-chevron-right"></span> Manga & Novels</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/category?category=plushies">
                    <span class="icon-chevron-right"></span> Plushies</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/category?category=posters">
                    <span class="icon-chevron-right"></span> Posters</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/category?category=sweets">
                    <span class="icon-chevron-right"></span> Sweets</a>
            </li>
        </ul>
    </div>
</div>
