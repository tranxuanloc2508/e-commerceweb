<%-- 
    Document   : cart
    Created on : Aug 21, 2021, 3:31:58 PM
    Author     : LocNe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<section class="breadcrumb-section set-bg" data-setbg="<c:url value="/img/breadcrumb.jpg"/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Shopping Cart</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Home</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                            <tr>
                                <th class="shoping__product">Products</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th></th>
                            </tr>

                        </thead>
                        <tbody>
                            <c:forEach var="c" items="${carts}" >
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img class="img-fluid"src="<c:url value="${p.image}"/>" alt="${p.name}"/>
                                        <h5>${c.name}</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        ${c.price}
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        ${c.price}
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                
                            </c:forEach>

                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                    <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                        Upadate Cart</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__continue">
                    <div class="shoping__discount">
                        <h5>Discount Codes</h5>
                        <form action="#">
                            <input type="text" placeholder="Enter your coupon code">
                            <button type="submit" class="site-btn">APPLY COUPON</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <h5>Cart Total</h5>
                    <ul>
                        <li>Subtotal <span>$454.98</span></li>
                        <li>Total <span>$454.98</span></li>
                    </ul>
                    <a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->
<section class="product-details spad">
    <table class="table">
        <tr>
            <th>Ma san pham</th>
            <th>Ten san pham</th>
            <th>Don gia</th>
            <th>So luong</th>
        </tr>

        <c:forEach var="c" items="${carts}" >
            <tr>
                <td>${c.productId}</td>
                <td>${c.name}</td>
                <td>${c.price}</td>
                <td>${c.count}</td>
            </tr>
        </c:forEach>
    </table>
</section>
<script>
    function pay() {
        if (confirm("Bạn muốn thanh toán?")) {
            $.ajax({
                url: "/saleweb/api/cart/pay",
                type: "POST",
                success: function (data, textStatus, jqXHR) {
                    if (data === "")
                        $(".seleted-products").hide("slow");
                    else
                        alert("Vui lòng đăng nhập để thanh toán!!!");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Đã có lỗi khi thanh toán!!!");
                }
            });
        }
    }
</script>
