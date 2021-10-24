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
            <a href="#"><img src="img/logo3.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li>
                    <a  href="<c:url value="/cart"/>"><i class="fa fa-shopping-bag"></i><span  id="cart-counter">${cartCounter}</span></a>
                </li>
            </ul>          
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">              
                <c:if test="${pageContext.request.userPrincipal.name == null}"> 
                    <div ><a href="<c:url value="/login"/>">Đăng nhập</a></div>
                </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">

                        <i >
                            <c:if test="${currentUser.image != null}">
                                <img src="${currentUser.image}" class="avatar"/>
                            </c:if>
                            <c:if test="${currentUser.image == null}">                        
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </c:if>                                        
                        </i>
                        <span class="dropdown-toggle"></span>
                        <ul style="background: white">                                                         
                            <c:if test="${currentUser.userRole != 'ROLE_ADMIN'}">
                                <li><a  href="<c:url value="/user/product-stats"/>"><i class="fa fa-user mr-2"></i>Bán hàng</a>  </li>
                                <li><a  href="<c:url value="/user/orderliststats"/>"><i class="fa fa-user mr-2"></i>Đơn hàng</a>  </li>
                                <li> <a href="<c:url value="/user/${pageContext.request.userPrincipal.name}"/>"><i class="fa fa-cog mr-2"></i>Thiết lập</a>
                                </li> 
                            </c:if>
                            <c:if test="${currentUser.userRole == 'ROLE_ADMIN'}">
                                <li><a  href="<c:url value="/admin/category-stats"/>"><i class="fa fa-user mr-2"></i>Quản trị</a>  </li>
                                </c:if>                                   
                            <li><a href="<c:url value="/logout"/>"><span  class="fa fa-sign-out mr-2"></span> Thoát</a></li>    
                        </ul>

                    </c:if>                                                       
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <div class="username">${pageContext.request.userPrincipal.name}</div>
                </c:if>                    
            </div>
            <c:if test="${pageContext.request.userPrincipal.name == null}"> 
                <div class="header__top__right__auth ml-3">               
                    <a href="<c:url value="/register"/>">Đăng kí</a>
                </div>
            </c:if>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <div id="mask">
    
</div>
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
                <li><i class="fa fa-envelope"></i> fcs@ou.edu.vn</li>
                <li>Free Shipping cho tất cả Đơn hàng 200.000 VNĐ</li>
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
                             <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <li><i class="fa fa-envelope"></i> fcs@ou.edu.vn</li>                          
                        </ul>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                         <div class="header__top__right__language">
                             <c:if test="${pageContext.request.userPrincipal.name == null}"> 
                                 <div ><a href="<c:url value="/login"/>">Đăng nhập</a></div>
                             </c:if>
                                 <c:if test="${pageContext.request.userPrincipal.name != null}">

                                     <a href="<c:url value="/"/>" >
                                         <c:if test="${currentUser.image != null}">
                                             <img src="${currentUser.image}" class="avatar"/>
                                         </c:if>
                                         <c:if test="${currentUser.image == null}">                        
                                             <i class="fa fa-user" aria-hidden="true"></i>
                                         </c:if>                                        
                                     </a>
                                     <ul style="background: white">                                                         
                                         <c:if test="${currentUser.userRole != 'ROLE_ADMIN'}">
                                             <li><a  href="<c:url value="/user/product-stats"/>"><i class="fa fa-user mr-2"></i>Bán hàng</a>  </li>
                                             <li><a  href="<c:url value="/user/orderliststats"/>"><i class="fa fa-user mr-2"></i>Đơn hàng</a>  </li>
                                             <li> <a href="<c:url value="/user/${pageContext.request.userPrincipal.name}"/>"><i class="fa fa-cog mr-2"></i>Thiết lập</a>
                                             </li>
                                         </c:if>
                                        
                                         <c:if test="${currentUser.userRole == 'ROLE_ADMIN'}">
                                             <li><a  href="<c:url value="/admin/category-stats"/>"><i class="fa fa-user mr-2"></i>Quản trị</a>  </li>
                                             </c:if>                                   
                                         <li><a href="<c:url value="/logout"/>"><span  class="fa fa-sign-out mr-2"></span> Thoát</a></li>    

                                     </ul>

                                 </c:if>                                                       
                             <c:if test="${pageContext.request.userPrincipal.name != null}">
                                 <div class="username">${pageContext.request.userPrincipal.name}</div>
                             </c:if>                                                       
                        </div>
                        <div class="header__top__right__auth mr-3">
                            <c:if test="${pageContext.request.userPrincipal.name == null}"> 
                                <a href="<c:url value="/register"/>">Đăng kí</a>
                            </c:if>
                            

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="container">
            <div class="row">
<!--                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="<c:url value="/"/>"><img src="<c:url value="img/logo3.png"/>" alt=""></a>
                    </div>
                </div>-->
<!--                <div class="col-lg-12">
                   <a href="<c:url value="/"/>"><img src="<c:url value="img/2.png"/>" alt=""></a>
                </div>-->
<!--                <div class="col-lg-1">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>

                            <li>
                                <a  href="<c:url value="/cart"/>"><i class="fa fa-shopping-bag"></i><span  id="cart-counter">${cartCounter}</span></a>
                            </li>
                        </ul>                   
                    </div>
                </div>-->
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
</header>
<!-- Header Section End -->
