<%-- 
    Document   : orderliststats
    Created on : Oct 18, 2021, 2:23:01 PM
    Author     : LocNe
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="breadcrumb-section set-bg" data-setbg="<c:url value="/img/breadcrumb.jpg"/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>View Purchase History </h2>
                    <div class="breadcrumb__option">
                        <a href="<c:url value="/"/>">Home</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="card">
    <div class="row ">
        <div class="col-md-12 px-3">
            <div >
                <section class="panel">
                    <header class="panel-heading no-border">
                        Lịch sử mua hàng
                    </header>
                    <div class="table-wrapper-scroll-y my-custom-scrollbar">
                        <table class="table table-bordered table-striped mb-0">
                            <thead>
                                <tr>                  
                                    <th>STT</th>
                                    <th></th>
                                    <th>Tên sản phẩm</th>
                                    <th>Mô tả</th>
                                    <th>Giá bán</th>
                                    <th>Loại sản phẩm</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="0"/>
                                <c:forEach items="${orderliststats}" var="c">
                                    <tr>         
                                        <td>
                                            <c:set var="count" value="${count +1}"/>${count}                                         
                                        </td>
                                        <td > <a href="<c:url value="/products/${c[0]}" />"><img src="${c[1]}" class="img-thumbnail"alt="Cinque Terre" style=" width: 100px;
                                                   height: 100px;object-fit: cover;"></a></td>
                                        <td >${c[2]}</td>
                                        <td>${c[3]}</td>
                                        <td>${c[6]} VNĐ</td>
                                        <td>${c[5]}</td>
                                        <td>${c[6]}</td>
                                    </tr>
                                </c:forEach>                            
                            </tbody>
                        </table>
                    </div> 
                </section>
            </div>          
        </div>
        <!-- End of carousel -->
    </div>
</div>