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
<c:if test="${carts == null }">
    <div class="container-fluid mt-100">
        <div class="row">
            <div class="col-md-12 mt-5">
                <div class="card">
                    <div class="card-body cart ">
                        <div class="col-sm-12 empty-cart-cls text-center"> <img src="https://image.flaticon.com/icons/png/128/711/711947.png" width="130" height="130" class="img-fluid mb-4 mr-3">
                            <h3><strong>Chưa có sản phẩm</strong></h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${carts != null}">
    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr >
                                    <th class="shoping__product">Sản phẩm</th>
                                    <th>Giá </th>
                                    <th>Số lượng</th>
                                    <th>Tổng tiền</th>
                                    <th></th>
                                </tr>

                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${carts}">                             
                                    <tr>
                                        <td class="shoping__cart__item">
                                            <img class="img-fluid"src="<c:url value="${c.image}"/>" alt="${c.name}" style="width: 200px; height: 200px"/>
                                            <h5>${c.name}</h5>
                                        </td>
                                        <td class="shoping__cart__price">
                                            ${c.price} VNĐ
                                        </td>
                                        <td class="shoping__cart__quantity">     
                                            <div class="form-group">
                                                <input onblur="updateCart(this,${c.productId})" type="number" value="${c.count}"/> 
                                            </div>
                                        </td>
                                        <td class="shoping__cart__total">
                                            ${c.price * c.count}
                                        </td>
                                        <td >
                                            <input type="button"  value="Xóa" onclick="deleteCart(${c.productId})" class="btn btn-danger"/>
                                        </td>
                                    </tr> 
                                </tbody>
                            </c:forEach>
                            <tr  >                           
                                <th></th>
                                <th></th>
                                <th >Sum</th>                                                                 
                                <th> 
                                   
                                    <div><span id ="amountCart">${cartStats.amount}</span> VNĐ</div>

                                </th>                                    

<!--                                <th>
                                    <input type="button"  value="Order" onclick="pay()" class="btn btn-info"/>

                                </th>-->
                            </tr>

                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn ">MUA HÀNg</a>
                        <a href="#" class="primary-btn cart-btn-right">
                            CẬP NHẬT</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Giảm giá</h5>
                            <form action="#">
                                <input type="text" placeholder="Nhập mã giảm giá">
                                <button type="submit" class="site-btn">ÁP DỤNG MÃ</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>TỔNG ĐƠN HÀNG</h5>
                        <ul>
                            <li>Tổng tiền <span>$454.98</span></li>
                            <li>Thành tiền <span>$454.98</span></li>
                        </ul>
                        <li href="#" class="primary-btn"type="button" onclick="pay()">ĐẶT HÀNG</li>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

</c:if>
<!--<script>
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
</script>-->
