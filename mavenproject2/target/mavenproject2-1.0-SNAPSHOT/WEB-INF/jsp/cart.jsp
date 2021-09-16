<%-- 
    Document   : cart
    Created on : Aug 21, 2021, 3:31:58 PM
    Author     : LocNe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">
    <h1 class="text-center text-danger">Gio Hang</h1>


    <table class="table">
        <tr>
            <th>Ma san pham</th>
            <th>Ten san pham</th>
            <th>Don gia</th>
            <th>So luong</th>
        </tr>

        <c:forEach var="c" items="${carts}" >
            <tr>
                <td>${c.product.id}</td>
                <td>${c.product.name}</td>
                <td>${c.product.price}</td>
                <td>${c.count}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="2" class="text-right">Tổng cộng</td>
            <td colspan="2"><fmt:formatNumber type="number" maxFractionDigits="3" 
                              value="${sum}" /> VNĐ</td>
        </tr>
    </table>
    <div class="pull-right">
        <input type="button" class="btn btn-danger" onclick="pay()"
               value="<spring:message code="cart.pay" />" />
    </div>
</div>
<div class="container">
    <h2 class="text-center">CÁC SẢN PHẨM ĐÃ CHỌN</h2>
    <table class="table table-bordered seleted-products">
        <tr>
            <th>Mã sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Đơn giá</th>
            <th>Số lượng</th>
        </tr>
        <c:forEach items="${carts}" var="cart">
            <tr>
                <td>${cart.product.id}</td>
                <td>${cart.product.name}</td>
                <td><fmt:formatNumber type="number" maxFractionDigits="3" 
                                  value="${cart.product.price}" />  VNĐ</td>
                <td>${cart.num}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="2" class="text-right">Tổng cộng</td>
            <td colspan="2"><fmt:formatNumber type="number" maxFractionDigits="3" 
                              value="${sum}" /> VNĐ</td>
        </tr>
    </table>
    <div class="pull-right">
        <input type="button" class="btn btn-danger" onclick="pay()"
               value="<spring:message code="cart.pay" />" />
    </div>
</div>
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
