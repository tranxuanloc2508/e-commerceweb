<%-- 
    Document   : detail
    Created on : Sep 9, 2021, 10:21:15 PM
    Author     : LocNe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="hero hero-normal">
    <div class="container">
        <div class="row">          
            <div class="col-lg-7">
               <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>

                            <li>
                                <a  href="<c:url value="/cart"/>"><i class="fa fa-shopping-bag"></i><span  id="cart-counter">${cartCounter}</span></a>
                            </li>
                        </ul>                   
                    </div>               
        </div>
    </div>
</section>
<!-- Breadcrumb Section Begin -->

<section class="breadcrumb-section set-bg" data-setbg="<c:url value="/img/breadcrumb.jpg"/>" >
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>CHI TIẾT SẢN PHẨM</h2>
                    <div class="breadcrumb__option">
                        <a href="<c:url value="/"/>">Home</a>
                       
                        <span>Food Sale</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="product-f-image">
                    <img  class="img-thumbnail" src="<spring:url value="${product.image}" />" alt=""  style="width: 500px; height: 500px">

                </div>
            </div>


            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3>${product.name}</h3>
                    <div class="product__details__rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <span>(18 reviews)</span>
                    </div>
                    <div class="product__details__price">
                        Giá: <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${product.price}" /> đ</div>                        

                    <a href="javacript:;"  class="primary-btn" onclick="addToCart(${product.id})">ADD TO CARD</a>


                    <ul>
                        <li><b>Tên sản phẩm</b> <span> ${product.name}</span></li>
                        <li><b>Loại sản phẩm</b> <span> ${product.category.getName()}</span></li>
                        <li><b>Được bán bởi</b> <span> ${product.user.getUsername()}</span></li>
                        <li><b>Mô tả</b> <span> ${product.description}</span></li>
                         <li><b>Xuất xứ</b> <span> ${product.factory}</span></li>
                        <li><b>Dung tích</b> <span> ${product.milliliter}</span></li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <div class=" mt-5 mb-5">
        <div class="d-flex justify-content-center row">
            <div class="d-flex flex-column col-md-11">

                <div class="coment-bottom bg-white p-2 px-4 mt-3">
                    <div class="d-flex flex-row add-comment-section mt-4 mb-4"><img class="img-fluid img-responsive rounded-circle mr-2" src="" width="38">
                        <input type="text" class="form-control mr-3" id ="contentId" placeholder="Thêm bình luận">
                        <c:if test="${pageContext.request.userPrincipal.name == null}">
                            <div ><a href="<c:url value="/login"/>"></a></div>
                            <button class="btn btn-success" onclick="show_alert()" 
                                type="button">Thêm</button>
                        </c:if>
                              <c:if test="${pageContext.request.userPrincipal.name != null}">
                             <button class="btn btn-success" onclick="addComment(${product.id},${currentUser.id})" 
                                type="button">Thêm</button>
                        </c:if>
                       
                    </div>
                    <br>

                    <h4> Tất cả bình luận đánh giá</h4>               
                    <div id ="commentArea">
                        <c:forEach items="${comments}" var="c">

                            <div class="commented-section mt-4"class="d-flex flex-row add-comment-section mt-4 mb-4"><img class=" avatar img-fluid img-responsive rounded-circle mr-2" src="${c.user.image}" width="45">
                                <div class="d-flex flex-row align-items-center commented-user mt-3">
                                    <span class="dot mb-3">${c.user.username}</span>
                                    <i class=" mb-3 ml-4">${c.createdDate}</i>
                                </div>
                                <div class="comment-text-sm"><span>${c.content}</span></div>                  
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>                 
    <script>
        window.onload = function () {
            let dates = document.querySelectorAll(".commented-user > i")
            for (let i = 0; i < dates.length; i++) {
                let d = dates[i]
                d.innerText = moment(d.innerText).fromNow();
                
            }
            
        }
        
    </script>
</section>
