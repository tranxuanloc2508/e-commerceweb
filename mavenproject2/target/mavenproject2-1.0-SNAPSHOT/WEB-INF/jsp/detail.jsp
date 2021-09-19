<%-- 
    Document   : detail
    Created on : Sep 9, 2021, 10:21:15 PM
    Author     : LocNe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
                <img src="<spring:url value="${product.image}" />" alt="">
               
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
                        <div class="product__details__price">Giá: ${product.price} VNĐ</div>
                        <p>Thông tin khác: ${product.description}</p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty"><span class="dec qtybtn">-</span>
                                    <input type="text" value="1">
                                <span class="inc qtybtn">+</span></div>
                            </div>
                        </div>
                        <a href="javacript:;"  class="primary-btn" onclick="addToCart(${product.id})">ADD TO CARD</a>
                        
                       
                        <ul>
                            <li><b>Availability</b> <span>Nhà sản xuất: ${product.name}</span></li>
                            <li><b>Shipping</b> <span>Nhà sản xuất: ${product.name} <samp>Free pickup today</samp></span></li>
                            <li><b>Weight</b> <span>Nhà sản xuất: ${product.name}</span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                            
    </div>
</div>
    </section>
