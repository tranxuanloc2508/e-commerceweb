<%-- 
    Document   : left-admin
    Created on : Oct 23, 2021, 9:44:14 PM
    Author     : QUYENNGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidenav " >
    <button class="dropdown-btn"> <i class="fa fa-line-chart"></i>Thống kê dữ liệu
        <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container  ">
        <a href="<c:url value="/admin/category-stats"/>" class="mt-4">Thống kê loại sản phẩm</a>  
        <a href="<c:url value="/admin/product-stats"/>" class="mt-4">Thống kê sản phẩm</a>  
        <a href="<c:url value="/admin/product-month-stats"/>" class="mt-4">Doanh thu theo tháng </a>
        <a href="<c:url value="/admin/product-best-stats"/>" class="mt-3">Top sản phẩm bán chạy</a>
        <a href="<c:url value="/admin/user-stats"/>" class="mt-3">Dữ liệu người dùng</a>  

    </div>
</div>

