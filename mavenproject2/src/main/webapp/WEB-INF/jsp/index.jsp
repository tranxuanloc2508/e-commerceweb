<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="hero">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>All departments</span>
                    </div>
                    <ul>
                        <c:forEach var="cat" items="${categories}">
                            <li class="nav-item">
                                <c:url value="/" var="catPath">
                                    <c:param name="CateId" value="${cat.id}"></c:param>
                                </c:url>
                                <a class="nav-link" href="${catPath}"">${cat.name}</a>

                            </li>
                        </c:forEach>

                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <div class="hero__search__categories" >
                                All Categories

                                <span class="angle-down">
                                    <i class="fa fa-caret-down"></i>
                                </span>
                            </div>
                            <input type="text" name="kw" placeholder="What do yo u need?">
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
                <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg" style="background-image: url(&quot;img/hero/banner.jpg&quot;);">
                    <div class="hero__text">
                        <span>FRUIT FRESH</span>
                        <h2>Vegetable <br>100% Organic</h2>
                        <p>Free Pickup and Delivery Available</p>
                        <a href="<c:url value="/category"/>" class="primary-btn">SHOP NOW</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="categories">
    <div class="container">
        <div class="row">

            <div class="categories__slider owl-carousel owl-loaded owl-drag">
                <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-2340px, 0px, 0px); transition: all 1.2s ease 0s; width: 3803px;">
                        <div class="owl-item cloned" style="width: 292.5px;"><div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-2.jpg" style="background-image: url(&quot;img/categories/cat-2.jpg&quot;);">
                                    <h5><a href="#">Dried Fruit</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="owl-item cloned" style="width: 292.5px;">
                            <div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-3.jpg" style="background-image: url(&quot;img/categories/cat-3.jpg&quot;);">
                                    <h5><a href="#">Vegetables</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="owl-item cloned" style="width: 292.5px;">
                            <div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-4.jpg" style="background-image: url(&quot;img/categories/cat-4.jpg&quot;);">
                                    <h5><a href="#">drink fruits</a></h5>
                                </div>
                            </div></div><div class="owl-item cloned" style="width: 292.5px;"><div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-5.jpg" style="background-image: url(&quot;img/categories/cat-5.jpg&quot;);">
                                    <h5><a href="#">drink fruits</a></h5>
                                </div>
                            </div></div><div class="owl-item" style="width: 292.5px;"><div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-1.jpg" style="background-image: url(&quot;img/categories/cat-1.jpg&quot;);">
                                    <h5><a href="#">Fresh Fruit</a></h5>
                                </div>
                            </div></div><div class="owl-item" style="width: 292.5px;"><div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-2.jpg" style="background-image: url(&quot;img/categories/cat-2.jpg&quot;);">
                                    <h5><a href="#">Dried Fruit</a></h5>
                                </div>
                            </div></div><div class="owl-item" style="width: 292.5px;"><div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-3.jpg" style="background-image: url(&quot;img/categories/cat-3.jpg&quot;);">
                                    <h5><a href="#">Vegetables</a></h5>
                                </div>
                            </div></div><div class="owl-item" style="width: 292.5px;"><div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-4.jpg" style="background-image: url(&quot;img/categories/cat-4.jpg&quot;);">
                                    <h5><a href="#">drink fruits</a></h5>
                                </div>
                            </div></div><div class="owl-item active" style="width: 292.5px;"><div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-5.jpg" style="background-image: url(&quot;img/categories/cat-5.jpg&quot;);">
                                    <h5><a href="#">drink fruits</a></h5>
                                </div>
                            </div></div><div class="owl-item cloned active" style="width: 292.5px;"><div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-1.jpg" style="background-image: url(&quot;img/categories/cat-1.jpg&quot;);">
                                    <h5><a href="#">Fresh Fruit</a></h5>
                                </div>
                            </div></div><div class="owl-item cloned active" style="width: 292.5px;"><div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-2.jpg" style="background-image: url(&quot;img/categories/cat-2.jpg&quot;);">
                                    <h5><a href="#">Dried Fruit</a></h5>
                                </div>
                            </div></div><div class="owl-item cloned active" style="width: 292.5px;"><div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-3.jpg" style="background-image: url(&quot;img/categories/cat-3.jpg&quot;);">
                                    <h5><a href="#">Vegetables</a></h5>
                                </div>
                            </div></div><div class="owl-item cloned" style="width: 292.5px;"><div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-4.jpg" style="background-image: url(&quot;img/categories/cat-4.jpg&quot;);">
                                    <h5><a href="#">drink fruits</a></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="owl-nav">
                    <button type="button" role="presentation" class="owl-prev">
                        <span class="fa fa-angle-left"><span></span></span></button>
                    <button type="button" role="presentation" class="owl-next">
                        <span class="fa fa-angle-right"><span></span></span></button></div>
                <div class="owl-dots disabled"></div></div>
        </div>
    </div>
</section>
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Featured Product</h2>
                </div>
<!--                <div class="featured__controls">
                    <ul>
                        <%--<c:forEach var="cat" items="${categories}">--%>
                            <li class="nav-item">
                                <%--<c:url value="/" var="catPath">--%>
                                    <%--<c:param name="CateId" value="${cat.id}"></c:param>--%>
                                <%--</c:url>--%>
                                <a class="nav-link" href="${catPath}"">${cat.name}</a>
                            </li>
                        <%--</c:forEach>--%>
                    </ul>
                </div>-->
            </div>
        </div>
        <div class="row">
            <c:forEach var="p" items="${products}">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="card-body">                                         
                        <div class="featured__item">
                            <div class="featured__item__pic set-bg" >
                                <img class="img-fluid"src="<c:url value="${p.image}"/>" alt="${p.name}"/>
                                <ul class="featured__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="<c:url value="/products/${p.id}" />"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="javacript:;"class="fa fa-shopping-cart" onclick="addToCart(${p.id})"></a></li>
                                </ul>
                            </div>
                            <div class="featured__item__text">
                                <h6><a href="#">${p.name}</a></h6>
                                <h5>${p.price} VNĐ</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <ul class="pagination justify-content-center">
            <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="i">
                <li class="page-item"><a class="page-link" href="<c:url value="/"/>?page=${i}">${i}</a></li>
                </c:forEach>
        </ul>
    </div>
</div>
</section>

