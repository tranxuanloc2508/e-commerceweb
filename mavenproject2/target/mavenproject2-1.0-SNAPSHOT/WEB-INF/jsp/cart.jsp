<%-- 
    Document   : cart
    Created on : Aug 21, 2021, 3:31:58 PM
    Author     : LocNe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            <td>${c.productId}</td>
            <td>${c.name}</td>
            <td>${c.price}</td>
            <td>${c.count}</td>
        </tr>
    </c:forEach>
</table>