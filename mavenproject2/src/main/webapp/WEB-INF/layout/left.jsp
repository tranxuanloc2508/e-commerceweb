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
    <br>
     <form action="">                    
    <div class="form-group">
        <label>Từ thời gian</label>
        <input type="date" name="fromDate" class="form-control"/>
    </div>
         <br>
    <div class="form-group">
        <label>Đến thời gian</label>
        <input type="date" name="toDate" class="form-control"/>
    </div>
    <input type="submit" value="THỐNG KÊ" class="btn btn-success"/>
</form> 
    
  </div>
    <button class="dropdown-btn"><i class="fa fa-briefcase"></i> Quản lý sản phẩm
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="<c:url value="/user/product-stats"/>">Tất cả sản phẩm</a>
    <a href="<c:url value="/user/add-products"/>">Thêm sản phẩm</a>
  </div>
    <button class="dropdown-btn"><i class="fa fa-line-chart"></i>
        Phân tích dữ liệu
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="<c:url value="/user/product-best-user"/>">Top sản phẩm bán chạy</a>
   
  </div>
  
</div>

 