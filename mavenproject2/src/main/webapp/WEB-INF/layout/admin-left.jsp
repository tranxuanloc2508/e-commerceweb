<%-- 
    Document   : admin-left
    Created on : Oct 4, 2021, 10:24:34 PM
    Author     : LocNe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar bg-light">

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/category-stats"/>">Thong ke san pham theo danh muc</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/product-stats"/>">Thong ke doanh thu theo tung san pham</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/user-stats"/>">Thong ke doanh thu theo thoi gian</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="<c:url value="/admin/listproduct"/>">Thong ke doanh thu theo thoi gian</a>
    </li>
  </ul>

</nav>