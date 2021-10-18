<%-- 
    Document   : category
    Created on : Aug 30, 2021, 3:11:23 PM
    Author     : LocNe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>Department</h4>
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
                    <div class="sidebar__item">
                        <h4>Price</h4>
                        <div class="price-range-wrap">
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content" data-min="10" data-max="540">
                                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 0%;"></span>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 100%;"></span>
                                <div class="ui-slider-range ui-corner-all ui-widget-header" style="left: 0%; width: 100%;"></div></div>
                            <div class="range-slider">
                                <div class="price-input">
                                    <input type="text" id="minamount">
                                    <input type="text" id="maxamount">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar__item sidebar__item__color--option">
                        <h4>Colors</h4>
                        <div class="sidebar__item__color sidebar__item__color--white">
                            <label for="white">
                                White
                                <input type="radio" id="white">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--gray">
                            <label for="gray">
                                Gray
                                <input type="radio" id="gray">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--red">
                            <label for="red">
                                Red
                                <input type="radio" id="red">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--black">
                            <label for="black">
                                Black
                                <input type="radio" id="black">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--blue">
                            <label for="blue">
                                Blue
                                <input type="radio" id="blue">
                            </label>
                        </div>
                        <div class="sidebar__item__color sidebar__item__color--green">
                            <label for="green">
                                Green
                                <input type="radio" id="green">
                            </label>
                        </div>
                    </div>
                    <div class="sidebar__item">
                        <h4>Popular Size</h4>
                        <div class="sidebar__item__size">
                            <label for="large">
                                Large
                                <input type="radio" id="large">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="medium">
                                Medium
                                <input type="radio" id="medium">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="small">
                                Small
                                <input type="radio" id="small">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="tiny">
                                Tiny
                                <input type="radio" id="tiny">
                            </label>
                        </div>
                    </div>
                    <div class="sidebar__item">
                        <div class="latest-product__text">
                            <h4>Latest Products</h4>
                            <div class="latest-product__slider owl-carousel owl-loaded owl-drag">


                                <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-525px, 0px, 0px); transition: all 1.2s ease 0s; width: 1575px;"><div class="owl-item cloned" style="width: 262.5px;"><div class="latest-prdouct__slider__item">
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                            </div></div><div class="owl-item cloned" style="width: 262.5px;"><div class="latest-prdouct__slider__item">
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                            </div></div><div class="owl-item active" style="width: 262.5px;"><div class="latest-prdouct__slider__item">
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                            </div></div><div class="owl-item" style="width: 262.5px;"><div class="latest-prdouct__slider__item">
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                            </div></div><div class="owl-item cloned" style="width: 262.5px;"><div class="latest-prdouct__slider__item">
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                            </div></div><div class="owl-item cloned" style="width: 262.5px;"><div class="latest-prdouct__slider__item">
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-2.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                                <a href="#" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="img/latest-product/lp-3.jpg" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>Crab Pool Security</h6>
                                                        <span>$30.00</span>
                                                    </div>
                                                </a>
                                            </div></div></div></div><div class="owl-nav"><button type="button" role="presentation" class="owl-prev"><span class="fa fa-angle-left"><span></span></span></button><button type="button" role="presentation" class="owl-next"><span class="fa fa-angle-right"><span></span></span></button></div><div class="owl-dots disabled"></div></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="product__discount">
                    <div class="section-title product__discount__title">
                        <h2>Sale Off</h2>
                    </div>
                    <div class="row">
                        <div class="product__discount__slider owl-carousel owl-loaded owl-drag">
                            <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-877px, 0px, 0px); transition: all 1.2s ease 0s; width: 3510px;"><div class="owl-item cloned" style="width: 292.5px;"><div class="col-lg-4">
                                            <div class="product__discount__item">
                                                <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-4.jpg" style="background-image: url(&quot;img/product/discount/pd-4.jpg&quot;);">
                                                    <div class="product__discount__percent">-20%</div>
                                                    <ul class="product__item__pic__hover">
                                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__discount__item__text">
                                                    <span>Dried Fruit</span>
                                                    <h5><a href="#">Raisin’n’nuts</a></h5>
                                                    <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                                </div>
                                            </div>
                                        </div></div><div class="owl-item cloned" style="width: 292.5px;"><div class="col-lg-4">
                                            <div class="product__discount__item">
                                                <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-5.jpg" style="background-image: url(&quot;img/product/discount/pd-5.jpg&quot;);">
                                                    <div class="product__discount__percent">-20%</div>
                                                    <ul class="product__item__pic__hover">
                                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__discount__item__text">
                                                    <span>Dried Fruit</span>
                                                    <h5><a href="#">Raisin’n’nuts</a></h5>
                                                    <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                                </div>
                                            </div>
                                        </div></div><div class="owl-item cloned" style="width: 292.5px;"><div class="col-lg-4">
                                            <div class="product__discount__item">
                                                <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-6.jpg" style="background-image: url(&quot;img/product/discount/pd-6.jpg&quot;);">
                                                    <div class="product__discount__percent">-20%</div>
                                                    <ul class="product__item__pic__hover">
                                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__discount__item__text">
                                                    <span>Dried Fruit</span>
                                                    <h5><a href="#">Raisin’n’nuts</a></h5>
                                                    <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                                </div>
                                            </div>
                                        </div></div><div class="owl-item active" style="width: 292.5px;"><div class="col-lg-4">
                                            <div class="product__discount__item">
                                                <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-1.jpg" style="background-image: url(&quot;img/product/discount/pd-1.jpg&quot;);">
                                                    <div class="product__discount__percent">-20%</div>
                                                    <ul class="product__item__pic__hover">
                                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__discount__item__text">
                                                    <span>Dried Fruit</span>
                                                    <h5><a href="#">Raisin’n’nuts</a></h5>
                                                    <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                                </div>
                                            </div>
                                        </div></div><div class="owl-item active" style="width: 292.5px;"><div class="col-lg-4">
                                            <div class="product__discount__item">
                                                <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-2.jpg" style="background-image: url(&quot;img/product/discount/pd-2.jpg&quot;);">
                                                    <div class="product__discount__percent">-20%</div>
                                                    <ul class="product__item__pic__hover">
                                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__discount__item__text">
                                                    <span>Vegetables</span>
                                                    <h5><a href="#">Vegetables’package</a></h5>
                                                    <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                                </div>
                                            </div>
                                        </div></div><div class="owl-item active" style="width: 292.5px;"><div class="col-lg-4">
                                            <div class="product__discount__item">
                                                <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-3.jpg" style="background-image: url(&quot;img/product/discount/pd-3.jpg&quot;);">
                                                    <div class="product__discount__percent">-20%</div>
                                                    <ul class="product__item__pic__hover">
                                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__discount__item__text">
                                                    <span>Dried Fruit</span>
                                                    <h5><a href="#">Mixed Fruitss</a></h5>
                                                    <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                                </div>
                                            </div>
                                        </div></div><div class="owl-item" style="width: 292.5px;"><div class="col-lg-4">
                                            <div class="product__discount__item">
                                                <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-4.jpg" style="background-image: url(&quot;img/product/discount/pd-4.jpg&quot;);">
                                                    <div class="product__discount__percent">-20%</div>
                                                    <ul class="product__item__pic__hover">
                                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__discount__item__text">
                                                    <span>Dried Fruit</span>
                                                    <h5><a href="#">Raisin’n’nuts</a></h5>
                                                    <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                                </div>
                                            </div>
                                        </div></div><div class="owl-item" style="width: 292.5px;"><div class="col-lg-4">
                                            <div class="product__discount__item">
                                                <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-5.jpg" style="background-image: url(&quot;img/product/discount/pd-5.jpg&quot;);">
                                                    <div class="product__discount__percent">-20%</div>
                                                    <ul class="product__item__pic__hover">
                                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__discount__item__text">
                                                    <span>Dried Fruit</span>
                                                    <h5><a href="#">Raisin’n’nuts</a></h5>
                                                    <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                                </div>
                                            </div>
                                        </div></div><div class="owl-item" style="width: 292.5px;"><div class="col-lg-4">
                                            <div class="product__discount__item">
                                                <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-6.jpg" style="background-image: url(&quot;img/product/discount/pd-6.jpg&quot;);">
                                                    <div class="product__discount__percent">-20%</div>
                                                    <ul class="product__item__pic__hover">
                                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__discount__item__text">
                                                    <span>Dried Fruit</span>
                                                    <h5><a href="#">Raisin’n’nuts</a></h5>
                                                    <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                                </div>
                                            </div>
                                        </div></div><div class="owl-item cloned" style="width: 292.5px;"><div class="col-lg-4">
                                            <div class="product__discount__item">
                                                <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-1.jpg" style="background-image: url(&quot;img/product/discount/pd-1.jpg&quot;);">
                                                    <div class="product__discount__percent">-20%</div>
                                                    <ul class="product__item__pic__hover">
                                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__discount__item__text">
                                                    <span>Dried Fruit</span>
                                                    <h5><a href="#">Raisin’n’nuts</a></h5>
                                                    <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                                </div>
                                            </div>
                                        </div></div><div class="owl-item cloned" style="width: 292.5px;"><div class="col-lg-4">
                                            <div class="product__discount__item">
                                                <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-2.jpg" style="background-image: url(&quot;img/product/discount/pd-2.jpg&quot;);">
                                                    <div class="product__discount__percent">-20%</div>
                                                    <ul class="product__item__pic__hover">
                                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__discount__item__text">
                                                    <span>Vegetables</span>
                                                    <h5><a href="#">Vegetables’package</a></h5>
                                                    <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                                </div>
                                            </div>
                                        </div></div><div class="owl-item cloned" style="width: 292.5px;"><div class="col-lg-4">
                                            <div class="product__discount__item">
                                                <div class="product__discount__item__pic set-bg" data-setbg="img/product/discount/pd-3.jpg" style="background-image: url(&quot;img/product/discount/pd-3.jpg&quot;);">
                                                    <div class="product__discount__percent">-20%</div>
                                                    <ul class="product__item__pic__hover">
                                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="product__discount__item__text">
                                                    <span>Dried Fruit</span>
                                                    <h5><a href="#">Mixed Fruitss</a></h5>
                                                    <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                                </div>
                                            </div>
                                        </div></div></div></div><div class="owl-nav disabled"><button type="button" role="presentation" class="owl-prev"><span aria-label="Previous">‹</span></button><button type="button" role="presentation" class="owl-next"><span aria-label="Next">›</span></button></div><div class="owl-dots"><button role="button" class="owl-dot active"><span></span></button><button role="button" class="owl-dot"><span></span></button></div></div>
                    </div>
                </div>
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <div class="filter__sort">
                                <span>Sort By</span>
                                <select style="display: none;">
                                    <option value="0">Default</option>
                                    <option value="0">Default</option>
                                </select><div class="nice-select" tabindex="0"><span class="current">Default</span><ul class="list"><li data-value="0" class="option selected">Default</li><li data-value="0" class="option">Default</li></ul></div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="filter__found">
                                <h6><span>16</span> Products found</h6>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-3">
                            <div class="filter__option">
                                <span class="icon_grid-2x2"></span>
                                <span class="icon_ul"></span>
                            </div>
                        </div>
                    </div>
                     <div class="row">
                        <c:forEach var="p" items="${products}">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">                                         
                                    <div class="featured__item">
                                        <div class="featured__item__pic set-bg" >
                                            <img class="img-fluid"src="<c:url value="${p.image}"/>" alt="${p.name}"/>
                                            <ul class="featured__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="<c:url value="/products/${p.id}" />"><i class="fa fa-retweet"></i></a></li>
                                                <li> <a href="javacript:;"class="fa fa-shopping-cart" onclick="addToCart(${p.id})"></a></li>

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
                </div>

                <div class="container">
                   
                </div>

                <ul class="pagination justify-content-center">
                    <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="i">
                        <li class="page-item"><a class="page-link" href="<c:url value="/category"/>?page=${i}">${i}</a></li>
                        </c:forEach>
                </ul>
            </div>
        </div>
    </div>

</section>