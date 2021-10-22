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
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>All departments</span>
                    </div>
                    <ul class="header__menu__dropdown">

                        <li><a href="#">Fresh Meat</a></li>
                        <li><a href="#">Vegetables</a></li>
                        <li><a href="#">Fruit &amp; Nut Gifts</a></li>
                        <li><a href="#">Fresh Berries</a></li>
                        <li><a href="#">Ocean Foods</a></li>
                        <li><a href="#">Butter &amp; Eggs</a></li>
                        <li><a href="#">Fastfood</a></li>
                        <li><a href="#">Fresh Onion</a></li>
                        <li><a href="#">Papayaya &amp; Crisps</a></li>
                        <li><a href="#">Oatmeal</a></li>
                        <li><a href="#">Fresh Bananas</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <div class="hero__search__categories">
                                All Categories
                                <span class="arrow_carrot-down"></span>
                            </div>
                            <input type="text" placeholder="What do yo u need?">
                            <button type="submit" class="site-btn">SEARCH</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+65 11.188.888</h5>
                            <span>support 24/7 time</span>
                        </div>
                    </div>
                </div>
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
                    <h2>Vegetable’s Package</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Home</a>
                        <a href="./index.html">Vegetables</a>
                        <span>Vegetable’s Package</span>
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
                    <div class="d-flex flex-row add-comment-section mt-4 mb-4"><img class="img-fluid img-responsive rounded-circle mr-2" src="https://i.imgur.com/qdiP4DB.jpg" width="38">
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

                            <div class="commented-section mt-4"class="d-flex flex-row add-comment-section mt-4 mb-4"><img class="img-fluid img-responsive rounded-circle mr-2" src="https://i.imgur.com/qdiP4DB.jpg" width="38">
                                <div class="d-flex flex-row align-items-center commented-user mt-3">
                                    <span class="dot mb-2">${c.user.username}</span>
                                    <i class=" mb-2 ml-4">${c.createdDate}</i>
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
