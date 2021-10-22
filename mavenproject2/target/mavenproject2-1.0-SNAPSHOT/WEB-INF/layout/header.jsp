<%-- 
    Document   : header
    Created on : Aug 29, 2021, 12:36:21 PM
    Author     : LocNe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="loader"></div>
<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="<c:url value="/"/>"><img class="img-fluid" src="<c:url value="img/logo.png"/>" alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li><a href="#"><i class="fa fa-heart"></i> <span>0</span></a></li>
            <li>
                <a href="<c:url value="/cart"/>"><i class="fa fa-shopping-bag"></i></i><span id="cart-counter">${cartCounter}</span></a>
            </li>
        </ul>

    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__language">
            <a href="#"><i class="fa fa-user"></i> Login</a>                 
        </div>
        <div class="header__top__right__auth">
            <a href="#"><i class="fa fa-user"></i> Login</a>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="active"><a href="./index.html">Home</a></li>
            <li><a href="<c:url value="/category"/>">Shop</a></li>
            <li><a href="#">Pages</a>
                <ul class="header__menu__dropdown">
                    <li><a href="./shop-details.html">Shop Details</a></li>
                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                    <li><a href="./checkout.html">Check Out</a></li>
                    <li><a href="./blog-details.html">Blog Details</a></li>
                </ul>
            </li>
            <li><a href="./blog.html">Blog</a></li>
            <li><a href="./contact.html">Contact</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> shopFreshABC@gmail.com</li>          
        </ul>
    </div>
</div>
<!-- Humberger End -->


<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> shopFreshABC@gmail.com</li>                          
                        </ul>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                        </div>
                        
                        <div class="header__top__right__language">   

                            <c:if test="${pageContext.request.userPrincipal.name == null}"> 
                                <div ><a href="<c:url value="/login"/>">Login</a></div>
                            </c:if>
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <div class="nav-item">   
                                        <a href="<c:url value="/"/>" >
                                            <c:if test="${currentUser.image != null}">
                                                <img src="${currentUser.image}" class="avatar"/>
                                            </c:if>
                                            <c:if test="${currentUser.image == null}">                        
                                                <i class="fa fa-user" aria-hidden="true"></i>
                                            </c:if>
                                                ${pageContext.request.userPrincipal.name}
                                        </a>
                                    </div>
                                        
                                            

                                    <span class=""></span>
                                    <ul style="background: white">                             


                                        <li><a  href="<c:url value="/user"/>"><i class="fa fa-user"></i>Saler</a>  </li>

                                        <li>
                                            <a href="<c:url value="/user/${pageContext.request.userPrincipal.name}"/>"><i class="fa fa-cog"></i> Setting</a>
                                        </li>       
                                        <li><a href="<c:url value="user/orderliststats"/>"><span  class="fa fa-sign-out"></span>Hóa đơn</a></li>  
                                        <li><a href="<c:url value="/logout"/>"><span  class="fa fa-sign-out"></span> Logout</a></li> 

                                    </ul>
                                </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="<c:url value="/"/>"><img src="<c:url value="img/logo.png"/>" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="<c:url value="/"/>">Home</a></li>
                            <li><a href="<c:url value="/category"/>">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
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
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
</header>
<!-- Header Section End -->

