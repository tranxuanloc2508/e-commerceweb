<%-- 
    Document   : left
    Created on : Oct 7, 2021, 4:24:05 AM
    Author     : QUYENNGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <div class="sidenav " >
  <button class="dropdown-btn"> <i class="fa fa-list"></i> Quản lý đơn hàng 
    <i class="fa fa-caret-down"></i>
  </button>
   <div class="dropdown-container">
    <a href="<c:url value="/user/sale-stats"/>">Tất cả đơn hàng</a>
    <a href="#">Tìm kiếm</a>
     <form class="form-group" action="">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search" name="search">
            <div class="input-group-btn">
                <button class="btn btn-default" type="submit">
                    <i class="glyphicon glyphicon-search"></i>
                </button>

            </div>     
        </div>
        <div class="form-group">
            <label>Từ </label>
            <input type="date" name="begin" class="form-control"/>
        </div>
        <div class="form-group">
            <label>Đến </label>
            <input type="date" name="end" class="form-control"/>
        </div>
    </form>
    <a href="#">Tất cả đơn hàng</a>
  </div>
    <button class="dropdown-btn"><i class="fa fa-briefcase"></i> Quản lý sản phẩm
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="<c:url value="/user/product-stats"/>">Tất cả sản phẩm</a>
    <a href="<c:url value="/user/add-products"/>">Thêm sản phẩm</a>
    <a href="#">Thống kê</a>
  </div>
    <button class="dropdown-btn"><i class="fa fa-line-chart"></i>
        Phân tích dữ liệu
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="<c:url value="/user/product-stats"/>">Phân tích dữ liệu</a>
   
  </div>
  
</div>

 