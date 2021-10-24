<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="hero">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                   <a href="<c:url value="/"/>"><img src="<c:url value="img/z.png"/>" alt=""></a>
                </div>
                <br>
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Tất cả loại sản phẩm</span>
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
                                Tất cả loại sản phẩm

                            </div>
                            <input type="text" name="kw" placeholder="Tìm kiếm sản phẩm?">
                            <button type="submit" class="site-btn">TÌM KIẾM</button>
                        </form>
                    </div>
                  
                  <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>

                            <li>
                                <a  href="<c:url value="/cart"/>"><i class="fa fa-shopping-bag"></i><span  id="cart-counter">${cartCounter}</span></a>
                            </li>
                        </ul>                   
                    </div>
                          
                   
                </div>
                
                <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg" style="background-image: url(&quot;img/hero/banner.jpg&quot;);">
                    <div class="hero__text">
                        <span>Trái cây tươi</span>
                      
                        <h2>Rau quả <br>100% hữu cơ</h2>
                        <p>Nhận và giao hàng miễn phí </p>
                        <a href="<c:url value="/"/>" class="primary-btn">MUA NGAY</a>
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
                                    <h5><a href="#">Hoa quả sấy khô</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="owl-item cloned" style="width: 292.5px;">
                            <div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-3.jpg" style="background-image: url(&quot;img/categories/cat-3.jpg&quot;);">
                                    <h5><a href="#">Rau</a></h5>
                                </div>
                            </div>
                        </div>
                        <div class="owl-item cloned" style="width: 292.5px;">
                            <div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-4.jpg" style="background-image: url(&quot;img/categories/cat-4.jpg&quot;);">
                                    <h5><a href="#">Nước uống trái cây</a></h5>
                                </div>
                            </div></div><div class="owl-item cloned" style="width: 292.5px;"><div class="col-lg-3">
                                <div class="categories__item set-bg" data-setbg="img/categories/cat-5.jpg" style="background-image: url(&quot;img/categories/cat-5.jpg&quot;);">
                                    <h5><a href="#">Nước uống trái cây</a></h5>
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
                    <h2>Tất cả sản phẩm</h2>
                </div>
               
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

