<%-- 
    Document   : list-product-stast
    Created on : Oct 8, 2021, 11:45:01 PM
    Author     : LocNe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<table class="table">
    <tr>
      
        <th>Ten san pham</th>
        <th>Thong tin</th>
        <th>Gia</th>
    </tr> 
    <c:forEach items="${listproductStats}" var="c">
        <tr>
            <th>${c[0]}</th>
            <th>${c[1]}</th>
            <th>${c[2]}</th>
        </tr> 
    </c:forEach>
</table>