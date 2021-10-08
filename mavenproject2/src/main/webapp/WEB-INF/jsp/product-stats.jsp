<%-- 
    Document   : product-stats
    Created on : Oct 7, 2021, 3:27:23 PM
    Author     : QUYENNGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
    <tr>
        <th>Ma san pham</th>
        <th>Ten san pham</th>
        <th>Doanh thu</th>
        
    </tr>
    <c:forEach items="${productStats}" var="c">
         <tr>
        <td>${c[0]}</td>
        <td>${c[1]}</td>
        <td>${c[2]}</td>
        
    </tr>
    </c:forEach>
    
</table>
<div>
    <canvas id="myProductStatsChart"></canvas>
</div>
<script>
    let productLabel =[], productInfo=[];
    
    <c:forEach items="${productStats}" var="c">
       productLabel.push('${c[1]}')
       productInfo.push(${c[2]})
    </c:forEach>
    window.onload = function (){
        productChart("myProductStatsChart",  productLabel, productInfo)
    }
</script>